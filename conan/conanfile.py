from conans import ConanFile, CMake, tools
import os

required_conan_version = ">=1.47.0"

class UserverConan(ConanFile):
    name = "userver"
    version = "1.0.0"
    description = "The C++ Asynchronous Framework"
    topics = ("framework", "coroutines", "asynchronous")
    url = "https://github.com/userver-framework/userver"
    homepage = "https://userver.tech/"
    license = "Apache-2.0"
    generators = "cmake_find_package"

    settings = "os", "arch", "compiler", "build_type"
    options = {
        "shared": [True, False], "fPIC": [True, False], 
        "with_jemalloc": [True, False],
        "with_mongodb": [True, False],
        "with_postgresql": [True, False],
        "with_redis": [True, False],
        "with_grpc": [True, False],
        "with_clickhouse": [True, False],
        "with_universal": [True, False],
        "namespace": ["ANY"],
        "namespace_begin": ["ANY"],
        "namespace_end": ["ANY"]
    }

    default_options = {
        "shared": False, "fPIC": True, 
        "with_jemalloc": True,
        "with_mongodb": False, 
        "with_postgresql": False,
        "with_redis": False,
        "with_grpc": True, 
        "with_clickhouse": True,
        "with_universal": False,
        "namespace": "userver",
        "namespace_begin": "",
        "namespace_end": ""
    }

    exports_sources = "cmake/*"

    scm = {
        "type": "git",
        "url": "https://github.com/jorgenpo/userver.git",
        "revision": "conan"
    }

    _build_subfolder = "cmake-build"

    def configure(self):
        if self.options.shared:
            del self.options.fPIC

        if not self.options.namespace_begin:
            self.options.namespace_begin = f"namespace {self.options.namespace} {{"
        if not self.options.namespace_end:
            self.options.namespace_end = "}"

    def requirements(self):
        self.requires("boost/1.79.0")
        self.requires("libev/4.33")
        self.requires("spdlog/1.9.0")
        self.requires("fmt/8.1.1")
        self.requires("c-ares/1.18.1")
        self.requires("libcurl/7.68.0")
        self.requires("cryptopp/8.6.0")
        self.requires("yaml-cpp/0.7.0")
        self.requires("cctz/2.3")
        self.requires("http_parser/2.9.4")
        self.requires("openssl/1.1.1q")

        if self.options.with_jemalloc:
            self.requires("jemalloc/5.2.1")
        if self.options.with_grpc:
            self.requires("grpc/1.48.0")

        # TODO: comment this out when clickhouse-cpp will be available through conan
        #if self.options.with_clickhouse:
            #self.requires("clickhouse-cpp/1.0.0")

    def _configure_cmake(self):
        cmake = CMake(self)
        cmake.definitions["CMAKE_FIND_DEBUG_MODE"] = "OFF"

        cmake.definitions["USERVER_OPEN_SOURCE_BUILD"] = "ON"
        cmake.definitions["USERVER_IS_THE_ROOT_PROJECT"] = "OFF"
        cmake.definitions["USERVER_DOWNLOAD_PACKAGES"] = "OFF"
        cmake.definitions["USERVER_NAMESPACE"] = self.options.namespace
        cmake.definitions["USERVER_NAMESPACE_BEGIN"] = self.options.namespace_begin
        cmake.definitions["USERVER_NAMESPACE_END"] = self.options.namespace_end
        cmake.definitions["USERVER_FEATURE_STACKTRACE"] = "OFF"

        if not self.options.with_jemalloc:
            cmake.definitions["USERVER_FEATURE_JEMALLOC"] = "OFF"
        if not self.options.with_mongodb:
            cmake.definitions["USERVER_FEATURE_MONGODB"] = "OFF"
        if not self.options.with_postgresql:
            cmake.definitions["USERVER_FEATURE_POSTGRESQL"] = "OFF"
        if not self.options.with_redis:
            cmake.definitions["USERVER_FEATURE_REDIS"] = "OFF"
        if not self.options.with_grpc:
            cmake.definitions["USERVER_FEATURE_GRPC"] = "OFF"

        if self.options.with_clickhouse:
            cmake.definitions["USERVER_DOWNLOAD_PACKAGE_CLICKHOUSECPP"] = "ON"
            cmake.definitions["USERVER_FEATURE_CLICKHOUSE"] = "ON"
        else:
            cmake.definitions["USERVER_FEATURE_CLICKHOUSE"] = "OFF"

        if not self.options.with_universal:
            cmake.definitions["USERVER_FEATURE_UNIVERSAL"] = "OFF"

        cmake.configure(build_folder=self._build_subfolder)
        return cmake

    def build(self):
        # Rename some packages for cmake to find them in find_package
        os.rename("Findlibev.cmake", "FindLibEv.cmake")
        os.rename("Findcryptopp.cmake", "FindCryptoPP.cmake")
        os.rename("Findyaml-cpp.cmake", "Findlibyamlcpp.cmake")
        os.rename("Findhttp_parser.cmake", "FindHttp_Parser.cmake")
        
        if self.options.with_jemalloc:
            os.rename("Findjemalloc.cmake", "FindJemalloc.cmake")
            tools.replace_in_file("FindJemalloc.cmake", "jemalloc::jemalloc", "Jemalloc")

        # The simplest way for grpc to be found correctly is to patch CMakeLists
        if self.options.with_grpc:
            tools.replace_in_file("grpc/CMakeLists.txt", "find_package(UserverGrpc REQUIRED)", "find_package(gRPC REQUIRED)")
            tools.replace_in_file("grpc/CMakeLists.txt", "add_library(Grpc ALIAS UserverGrpc)", "")
            tools.replace_in_file("grpc/CMakeLists.txt", "find_package(UserverProtobuf REQUIRED)", "find_package(Protobuf REQUIRED)")
            tools.replace_in_file("grpc/CMakeLists.txt", "add_library(Protobuf ALIAS UserverProtobuf)", "")
            tools.replace_in_file("FindgRPC.cmake", "gRPC::gRPC", "Grpc")

        # Tune Find* files to produce correct variables-
        tools.replace_in_file("FindCryptoPP.cmake", "cryptopp_FOUND", "CryptoPP_FOUND")
        tools.replace_in_file("FindCryptoPP.cmake", "cryptopp_VERSION", "CryptoPP_VERSION")
        tools.replace_in_file("FindCryptoPP.cmake", "cryptopp::cryptopp", "CryptoPP")
        tools.replace_in_file("Findlibyamlcpp.cmake", "yaml-cpp_FOUND", "libyamlcpp_FOUND")
        tools.replace_in_file("Findlibyamlcpp.cmake", "yaml-cpp_VERSION", "libyamlcpp_VERSION")
        tools.replace_in_file("Findlibyamlcpp.cmake", "yaml-cpp::yaml-cpp", "libyamlcpp")
        tools.replace_in_file("Findcctz.cmake", "cctz::cctz", "cctz")
        tools.replace_in_file("Findc-ares.cmake", "c-ares::c-ares", "c-ares")
        tools.replace_in_file("FindLibEv.cmake", "libev::libev", "LibEv")
        tools.replace_in_file("FindHttp_Parser.cmake", "http_parser::http_parser", "Http_Parser")
        tools.replace_in_file("Findfmt.cmake", "add_library(fmt::fmt INTERFACE IMPORTED)", "add_library(fmt::fmt INTERFACE IMPORTED)\nadd_library(fmt ALIAS fmt::fmt)")

        cmake = self._configure_cmake()
        cmake.build()

    def package(self):
        self.copy(pattern="LICENSE", dst="licenses")
        
        self.copy(pattern="*", dst="include", src=os.path.join("core", "include"), keep_path=True)
        self.copy(pattern="*", dst="include", src=os.path.join("shared", "include"), keep_path=True)
        self.copy(pattern="*", dst="include", src=os.path.join("third_party", "moodycamel", "include"), keep_path=True)

        self.copy(pattern="*.so", dst="lib", src=os.path.join(self._build_subfolder, "userver"), keep_path=False)
        self.copy(pattern="*.a", dst="lib", src=os.path.join(self._build_subfolder, "userver"), keep_path=False)

        if self.options.with_grpc:
            self.copy(pattern="*", dst="include", src=os.path.join("grpc", "include"), keep_path=True)
            self.copy(pattern="*", dst=os.path.join("scripts", "grpc"), src=os.path.join("scripts", "grpc"), keep_path=True)
            os.rename(os.path.join("cmake", "GrpcTargets.cmake"), os.path.join("cmake", "GrpcTargetsImpl.cmake"))
            os.rename(os.path.join("cmake", "GrpcTargetsWrapper.cmake"), os.path.join("cmake", "GrpcTargets.cmake"))
            self.copy(pattern="GrpcTargets*.cmake", dst="cmake", src="cmake", keep_path=False)

        if self.options.with_clickhouse:
            self.copy(pattern="*", dst="include", src=os.path.join("clickhouse", "include"), keep_path=True)
            self.copy(pattern="*.a", dst=os.path.join("lib", "clickhouse"), src=os.path.join(self._build_subfolder, "third_party", "clickhouse-cpp"), keep_path=False)

    def package_info(self):
        self.cpp_info.libs = tools.collect_libs(self)

        # TODO: create clickhouse-cpp receipt
        if self.options.with_clickhouse:
            self.cpp_info.libs.extend(["clickhouse-cpp-lib-static", "cityhash-lib", "lz4-lib"])
            self.cpp_info.libdirs.append(os.path.join("lib", "clickhouse"))

        self.cpp_info.builddirs.append("cmake")

        self.cpp_info.defines.append(f"USERVER_NAMESPACE={self.options.namespace}")
        self.cpp_info.defines.append(f"USERVER_NAMESPACE_BEGIN={self.options.namespace_begin}")
        self.cpp_info.defines.append(f"USERVER_NAMESPACE_END={self.options.namespace_end}")
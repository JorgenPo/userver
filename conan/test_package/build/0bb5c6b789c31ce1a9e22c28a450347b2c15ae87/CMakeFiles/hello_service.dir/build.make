# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /userver/test_package

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87

# Include any dependencies generated for this target.
include CMakeFiles/hello_service.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/hello_service.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/hello_service.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello_service.dir/flags.make

CMakeFiles/hello_service.dir/hello_service.cpp.o: CMakeFiles/hello_service.dir/flags.make
CMakeFiles/hello_service.dir/hello_service.cpp.o: ../../hello_service.cpp
CMakeFiles/hello_service.dir/hello_service.cpp.o: CMakeFiles/hello_service.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hello_service.dir/hello_service.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hello_service.dir/hello_service.cpp.o -MF CMakeFiles/hello_service.dir/hello_service.cpp.o.d -o CMakeFiles/hello_service.dir/hello_service.cpp.o -c /userver/test_package/hello_service.cpp

CMakeFiles/hello_service.dir/hello_service.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello_service.dir/hello_service.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /userver/test_package/hello_service.cpp > CMakeFiles/hello_service.dir/hello_service.cpp.i

CMakeFiles/hello_service.dir/hello_service.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello_service.dir/hello_service.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /userver/test_package/hello_service.cpp -o CMakeFiles/hello_service.dir/hello_service.cpp.s

# Object files for target hello_service
hello_service_OBJECTS = \
"CMakeFiles/hello_service.dir/hello_service.cpp.o"

# External object files for target hello_service
hello_service_EXTERNAL_OBJECTS =

hello_service: CMakeFiles/hello_service.dir/hello_service.cpp.o
hello_service: CMakeFiles/hello_service.dir/build.make
hello_service: /root/.conan/data/userver/1.0.0/_/_/package/3dbae2e5af315b89cf2395933e40b73df1ea6d23/lib/libuserver-core.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_contract.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_coroutine.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_fiber_numa.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_fiber.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_context.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_graph.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_iostreams.a
hello_service: /root/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib/libbz2.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_json.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_locale.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_log_setup.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_log.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_math_c99.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_math_c99f.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_math_c99l.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_math_tr1.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_math_tr1f.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_math_tr1l.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_nowide.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_program_options.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_random.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_regex.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_stacktrace_addr2line.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_stacktrace_backtrace.a
hello_service: /root/.conan/data/libbacktrace/cci.20210118/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib/libbacktrace.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_stacktrace_basic.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_stacktrace_noop.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_timer.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_type_erasure.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_thread.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_chrono.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_container.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_date_time.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_unit_test_framework.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_prg_exec_monitor.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_test_exec_monitor.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_exception.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_wave.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_filesystem.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_atomic.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_wserialization.a
hello_service: /root/.conan/data/boost/1.79.0/_/_/package/dc8aedd23a0f0a773a5fcdcfe1ae3e89c4205978/lib/libboost_serialization.a
hello_service: /root/.conan/data/libev/4.33/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib/libev.a
hello_service: /root/.conan/data/spdlog/1.9.0/_/_/package/4d2b231078dcc813aaf3eb5175bee272655efbc4/lib/libspdlog.a
hello_service: /root/.conan/data/fmt/8.1.1/_/_/package/2c09c8f84c016041549fcee94e4caae5d89424b6/lib/libfmt.a
hello_service: /root/.conan/data/c-ares/1.18.1/_/_/package/568a9f05046bc2a125b25bb11b7b1b0ed567b825/lib/libcares.a
hello_service: /root/.conan/data/libcurl/7.68.0/_/_/package/0c5339e3252a17695b86faf7d8701a95bdc6c4ef/lib/libcurl.a
hello_service: /root/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib/libz.a
hello_service: /root/.conan/data/openssl/1.1.1o/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib/libssl.a
hello_service: /root/.conan/data/openssl/1.1.1o/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib/libcrypto.a
hello_service: /root/.conan/data/cryptopp/8.6.0/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/lib/libcryptopp.a
hello_service: /root/.conan/data/yaml-cpp/0.7.0/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/lib/libyaml-cpp.a
hello_service: /root/.conan/data/cctz/2.3/_/_/package/238df00604cc31bb14445227f4be73e1727116e7/lib/libcctz.a
hello_service: /root/.conan/data/http_parser/2.9.4/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib/libhttp_parser.a
hello_service: /root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/lib/libjemalloc_pic.a
hello_service: CMakeFiles/hello_service.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hello_service"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello_service.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello_service.dir/build: hello_service
.PHONY : CMakeFiles/hello_service.dir/build

CMakeFiles/hello_service.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello_service.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello_service.dir/clean

CMakeFiles/hello_service.dir/depend:
	cd /userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /userver/test_package /userver/test_package /userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87 /userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87 /userver/test_package/build/0bb5c6b789c31ce1a9e22c28a450347b2c15ae87/CMakeFiles/hello_service.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello_service.dir/depend


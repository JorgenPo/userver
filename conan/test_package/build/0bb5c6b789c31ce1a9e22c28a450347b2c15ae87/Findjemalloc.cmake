

function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS FRAMEWORKS_DIRS)
    if(APPLE)
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAMES ${_FRAMEWORK} PATHS ${FRAMEWORKS_DIRS} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${FRAMEWORKS_DIRS}")
            endif()
        endforeach()
    endif()
endmacro()


function(conan_package_library_targets libraries package_libdir deps out_libraries out_libraries_target build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            list(APPEND _out_libraries ${CONAN_FOUND_LIBRARY})
            if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
                # Create a micro-target for each lib/a found
                string(REGEX REPLACE "[^A-Za-z0-9.+_-]" "_" _LIBRARY_NAME ${_LIBRARY_NAME})
                set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
                if(NOT TARGET ${_LIB_NAME})
                    # Create a micro-target for each lib/a found
                    add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                    set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
                    set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
                else()
                    conan_message(STATUS "Skipping already existing target: ${_LIB_NAME}")
                endif()
                list(APPEND _out_libraries_target ${_LIB_NAME})
            endif()
            conan_message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            list(APPEND _out_libraries_target ${_LIBRARY_NAME})
            list(APPEND _out_libraries ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
        # Add all dependencies to all targets
        string(REPLACE " " ";" deps_list "${deps}")
        foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
            set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
        endforeach()
    endif()

    set(${out_libraries} ${_out_libraries} PARENT_SCOPE)
    set(${out_libraries_target} ${_out_libraries_target} PARENT_SCOPE)
endfunction()


include(FindPackageHandleStandardArgs)

conan_message(STATUS "Conan: Using autogenerated Findjemalloc.cmake")
# Global approach
set(jemalloc_FOUND 1)
set(jemalloc_VERSION "5.2.1")

find_package_handle_standard_args(jemalloc REQUIRED_VARS
                                  jemalloc_VERSION VERSION_VAR jemalloc_VERSION)
mark_as_advanced(jemalloc_FOUND jemalloc_VERSION)


set(jemalloc_INCLUDE_DIRS "/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/include"
			"/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/include/jemalloc")
set(jemalloc_INCLUDE_DIR "/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/include;/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/include/jemalloc")
set(jemalloc_INCLUDES "/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/include"
			"/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/include/jemalloc")
set(jemalloc_RES_DIRS )
set(jemalloc_DEFINITIONS "-DJEMALLOC_EXPORT=")
set(jemalloc_LINKER_FLAGS_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(jemalloc_COMPILE_DEFINITIONS "JEMALLOC_EXPORT=")
set(jemalloc_COMPILE_OPTIONS_LIST "" "")
set(jemalloc_COMPILE_OPTIONS_C "")
set(jemalloc_COMPILE_OPTIONS_CXX "")
set(jemalloc_LIBRARIES_TARGETS "") # Will be filled later, if CMake 3
set(jemalloc_LIBRARIES "") # Will be filled later
set(jemalloc_LIBS "") # Same as jemalloc_LIBRARIES
set(jemalloc_SYSTEM_LIBS dl pthread rt)
set(jemalloc_FRAMEWORK_DIRS )
set(jemalloc_FRAMEWORKS )
set(jemalloc_FRAMEWORKS_FOUND "") # Will be filled later
set(jemalloc_BUILD_MODULES_PATHS )

conan_find_apple_frameworks(jemalloc_FRAMEWORKS_FOUND "${jemalloc_FRAMEWORKS}" "${jemalloc_FRAMEWORK_DIRS}")

mark_as_advanced(jemalloc_INCLUDE_DIRS
                 jemalloc_INCLUDE_DIR
                 jemalloc_INCLUDES
                 jemalloc_DEFINITIONS
                 jemalloc_LINKER_FLAGS_LIST
                 jemalloc_COMPILE_DEFINITIONS
                 jemalloc_COMPILE_OPTIONS_LIST
                 jemalloc_LIBRARIES
                 jemalloc_LIBS
                 jemalloc_LIBRARIES_TARGETS)

# Find the real .lib/.a and add them to jemalloc_LIBS and jemalloc_LIBRARY_LIST
set(jemalloc_LIBRARY_LIST jemalloc_pic)
set(jemalloc_LIB_DIRS "/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_jemalloc_DEPENDENCIES "${jemalloc_FRAMEWORKS_FOUND} ${jemalloc_SYSTEM_LIBS} ")

conan_package_library_targets("${jemalloc_LIBRARY_LIST}"  # libraries
                              "${jemalloc_LIB_DIRS}"      # package_libdir
                              "${_jemalloc_DEPENDENCIES}"  # deps
                              jemalloc_LIBRARIES            # out_libraries
                              jemalloc_LIBRARIES_TARGETS    # out_libraries_targets
                              ""                          # build_type
                              "jemalloc")                                      # package_name

set(jemalloc_LIBS ${jemalloc_LIBRARIES})

foreach(_FRAMEWORK ${jemalloc_FRAMEWORKS_FOUND})
    list(APPEND jemalloc_LIBRARIES_TARGETS ${_FRAMEWORK})
    list(APPEND jemalloc_LIBRARIES ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${jemalloc_SYSTEM_LIBS})
    list(APPEND jemalloc_LIBRARIES_TARGETS ${_SYSTEM_LIB})
    list(APPEND jemalloc_LIBRARIES ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(jemalloc_LIBRARIES_TARGETS "${jemalloc_LIBRARIES_TARGETS};")
set(jemalloc_LIBRARIES "${jemalloc_LIBRARIES};")

set(CMAKE_MODULE_PATH "/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/root/.conan/data/jemalloc/5.2.1/_/_/package/dd4b25aaf895ca2136a38b9660b8dbca6ee25a36/" ${CMAKE_PREFIX_PATH})

if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
    # Target approach
    if(NOT TARGET jemalloc::jemalloc)
        add_library(jemalloc::jemalloc INTERFACE IMPORTED)
        if(jemalloc_INCLUDE_DIRS)
            set_target_properties(jemalloc::jemalloc PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                                  "${jemalloc_INCLUDE_DIRS}")
        endif()
        set_property(TARGET jemalloc::jemalloc PROPERTY INTERFACE_LINK_LIBRARIES
                     "${jemalloc_LIBRARIES_TARGETS};${jemalloc_LINKER_FLAGS_LIST}")
        set_property(TARGET jemalloc::jemalloc PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     ${jemalloc_COMPILE_DEFINITIONS})
        set_property(TARGET jemalloc::jemalloc PROPERTY INTERFACE_COMPILE_OPTIONS
                     "${jemalloc_COMPILE_OPTIONS_LIST}")
        
    endif()
endif()

foreach(_BUILD_MODULE_PATH ${jemalloc_BUILD_MODULES_PATHS})
    include(${_BUILD_MODULE_PATH})
endforeach()

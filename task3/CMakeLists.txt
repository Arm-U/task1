cmake_minimum_required(VERSION 3.10)

project(SimpleLibrary)

if (ARM_BUILD)
	set(CMAKE_SYSTEM_PROCESSOR arm)

	set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)
	set(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
	set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN})

	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
	set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
	
	include_directories(include)

	install(FILES ${SimpleLibrary_SOURCE_DIR}/include/buffer.h
		DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
	set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib)
	set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)

add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)
target_link_libraries(MainLib buffer)

if (ARM_BUILD)
	install(TARGETS Main MainLib
		DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
endif()

cmake_minimum_required(VERSION 3.0)

set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

if(ARM_BUILD)
	set(CMAKE_SYSTEM_PROCESSOR arm)

	set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/arm-linux-gnueabihf-g++) 
	set(CMAKE_C_COMPILER ${TOOLCHAIN}/arm-linux-gnueabihf-gcc)
	
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib-arm)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin-arm)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib-arm)
else()
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)
endif()

project(SimpleLibrary)

include_directories(include)

add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)

target_link_libraries(MainLib buffer)

install(TARGETS Main MainLib
	ARCHIVE DESTINATION lib
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	PUBLIC_HEADER DESTINATION include)


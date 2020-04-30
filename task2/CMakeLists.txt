cmake_minimum_required(VERSION 3.10)

project(C LANGUAGES CXX)

include_directories(.)

add_executable(C ${PROJECT_SOURCE_DIR}/C/main.cpp)

add_subdirectory(${PROJECT_SOURCE_DIR}/B)

target_link_libraries(C dirB)

execute_process(COMMAND python ${PROJECT_SOURCE_DIR}/A/preparing.py WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/A)

set_target_properties(C
	PROPERTIES
	LIBRARY_OUTPUT_DIRECTORY "lib"
	RUNTIME_OUTPUT_DIRECTORY "bin"
)

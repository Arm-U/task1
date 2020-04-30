cmake_minimum_required(VERSION 3.10)

project(C LANGUAGES CXX)

include_directories(.)

add_executable(C ${PROJECT_SOURCE_DIR}/C/main.cpp)

add_subdirectory(${PROJECT_SOURCE_DIR}/B)

target_link_libraries(C dirB)

execute_process(COMMAND python ${PROJECT_SOURCE_DIR}/A/preparing.py WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/A)

set(EXECUTABLE_OUTPUT_PATH "../bin")

add_subdirectory(${PROJECT_SOURCE_DIR}/C/googletest_dir/googletest)

set(GTEST_SOURCE_DIR ${PROJECT_SOURCE_DIR}/C/googletest_dir/googletest)

include_directories(${GTEST_SOURCE_DIR}/include ${GTEST_SOURCE_DIR})

add_executable(CTest ${PROJECT_SOURCE_DIR}/C/main_test.cpp)

target_link_libraries(CTest gtest gtest_main)

enable_testing()

add_test(NAME CTest
	COMMAND CTest
)

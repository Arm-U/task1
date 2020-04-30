cmake_minimum_required(VERSION 3.10)

add_library(dirB SHARED lib.cpp)

set_target_properties(dirB
	        	PROPERTIES
			LIBRARY_OUTPUT_DIRECTORY "../lib"
)

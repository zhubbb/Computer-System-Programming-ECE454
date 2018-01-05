cmake_minimum_required(VERSION 3.5)
project(ECE454_Lab2)

set(CMAKE_C_STANDARD 99)
SET(CMAKE_C_FLAGS "-g -no-pie")
set(CMAKE_BUILD_TYPE Debug)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

set(SOURCE_FILES ECE454-Lab2.c)
add_executable(ECE454_Lab2 ${SOURCE_FILES}
        loadbmp.h
        utilities.c utilities.h
        fcyc.c fcyc.h clock.c clock.h
        implementation_reference.c implementation_reference.h
        implementation.c implementation.h)

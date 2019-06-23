cmake_minimum_required(VERSION 3.5.1)

#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp -std=c++11")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 ")
find_package(OpenCV REQUIRED)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ../)

file(GLOB SRC "tmp/*.cpp")

include_directories(${OpenCV_INCLUDE_DIRS})

add_library(detect SHARED ${SRC})

target_link_libraries(detect ${OpenCV_LIBS})

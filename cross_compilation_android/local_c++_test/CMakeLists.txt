cmake_minimum_required(VERSION 3.5.1)
project(detect)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp")
#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp")
set (CMAKE_CXX_STANDARD 11)
find_package(OpenCV REQUIRED)

set(SRC src/main.cpp src/common.cpp src/lbf.cpp
        src/npddetect.cpp src/npdmodel.cpp src/rf.cpp)


include_directories(./include ${OpenCV_INCLUDE_DIRS})

add_executable(detect ${SRC})

target_link_libraries(detect ${OpenCV_LIBS})

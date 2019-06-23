cmake_minimum_required(VERSION 3.6.0)
project(opencvTest)

#find_package(OpenCV REQUIRED PATHS)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)
# Add OpenCV headers location to your include paths
#include_directories(${OpenCV_INCLUDE_DIRS})
include_directories (/usr/local/include/)

link_directories (/usr/local/lib64)

#link_directories (~/opencv-3.3.0/my_build/lib/)
# Declare the executable target built from your sources
add_executable (track ./src/track.cpp)

# Link your application with OpenCV libraries
target_link_libraries (track opencv_core opencv_imgcodecs opencv_highgui opencv_imgproc opencv_videoio opencv_tracking)

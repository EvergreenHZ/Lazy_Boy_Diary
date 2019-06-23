cmake_minimum_required(VERSION 3.5.1)
project(opencvTest)

find_package(OpenCV REQUIRED PATHS /home/huaizhi/Android/OpenCV-android-sdk)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)

# Add OpenCV headers location to your include paths
include_directories(${OpenCV_INCLUDE_DIRS} 
		/home/huaizhi/opencv_contrib-3.3.0/modules/tracking/include
		/home/huaizhi/opencv_contrib-3.3.0/modules/tracking/samples)

message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

link_directories (~/opencv-3.3.0/my_build/lib/)
# Declare the executable target built from your sources
add_executable (multiTrack ./src/multiTrack.cpp)

# Link your application with OpenCV libraries
target_link_libraries (multiTrack ${OpenCV_LIBS})

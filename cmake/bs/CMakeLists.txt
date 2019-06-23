cmake_minimum_required(VERSION 3.5.1)
project(opencvTest)

#set("OpenCV_DIR" "/home/huaizhi/Android/OpenCV-android-sdk")
find_package(OpenCV REQUIRED PATHS /home/huaizhi/Android/OpenCV-android-sdk)
find_package(JNI)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)

#message(STATUS "OpenCV library status:")
#message(STATUS "    version: ${OpenCV_VERSION}")
#message(STATUS "    libraries: ${OpenCV_LIBS}")
#message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")
#message(STATUS "Java JNI:")
#message(STATUS "JNI_INCLUDE_DIRS=${JNI_INCLUDE_DIRS}")
#message(STATUS "JNI_LIBRARIES=${JNI_LIBRARIES}")

# Add OpenCV headers location to your include paths
include_directories(${OpenCV_INCLUDE_DIRS})

# Declare the executable target built from your sources
add_executable (bs ./src/bs.cpp)

# Link your application with OpenCV libraries
target_link_libraries(bs ${OpenCV_LIBS} ${JNI_LIBRARIES})

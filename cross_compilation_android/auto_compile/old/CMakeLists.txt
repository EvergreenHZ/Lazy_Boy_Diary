cmake_minimum_required(VERSION 3.5.1)
project(detect)

OPTION (USE_OpenMP "Use OpenMP" ON)
IF(USE_OpenMP)
  FIND_PACKAGE(OpenMP)
  IF(OPENMP_FOUND)
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  ENDIF()
ENDIF()

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp")
set (CMAKE_SYSTEM_NAME Android)
set (CMAKE_CXX_STANDARD 11)
set (CMAKE_SYSROOT "/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/sysroot")
set (CMAKE_SYSTEM_VERSION 1)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib)

set(SRC jni/npddetect.cpp jni/npdmodel.cpp jni/detect_wrap.cxx)
set(CMAKE_C_COMPILER "/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/bin/aarch64-linux-android-gcc" )
set(CMAKE_CXX_COMPILER "/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/bin/aarch64-linux-android-g++" )

message(STATUS "    compiler: ${CMAKE_CXX_COMPILER}")

include_directories (/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/sysroot/usr/include
		/home/tristian/Android/OpenCV-android-sdk/sdk/native/jni/include
		/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/lib/gcc/aarch64-linux-android/4.9.x/include)

link_directories (/home/tristian/Android/OpenCV-android-sdk/sdk/native/libs/arm64-v8a
		/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/sysroot/usr/lib  # c++ std
		/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/aarch64-linux-android/lib64)

add_library(detect SHARED ${SRC})

target_link_libraries(detect log opencv_java3)
#target_link_libraries(detect log opencv_java3 libgomp.a)
#OPTION (USE_OpenMP "Use OpenMP" ON)
#IF(USE_OpenMP)
#  FIND_PACKAGE(OpenMP)
#  IF(OPENMP_FOUND)
#    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
#    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
#  ENDIF()
#ENDIF()
##swig -c++ -java -package com.zjgsu.face -outdir com/zjgsu/face ./jni/detect.i

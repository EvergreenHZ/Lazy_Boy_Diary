cmake_minimum_required(VERSION 3.5.1)
project(detect)

#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp")
set (CMAKE_SYSTEM_NAME Android)
set (CMAKE_CXX_STANDARD 11)
set (CMAKE_SYSROOT "/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/sysroot")
set (CMAKE_SYSTEM_VERSION 1)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib)

set(SRC jni/npddetect.cpp jni/npdmodel.cpp jni/detect_wrap.cxx)
set(CMAKE_C_COMPILER "/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/bin/arm-linux-androideabi-gcc" )
set(CMAKE_CXX_COMPILER "/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/bin/arm-linux-androideabi-g++" )


include_directories(/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/sysroot/usr/include
		/home/huaizhi/Android/OpenCV-android-sdk/sdk/native/jni/include
		/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/lib/gcc/arm-linux-androideabi/4.9.x/include)

link_directories(/home/huaizhi/Android/OpenCV-android-sdk/sdk/native/libs/armeabi-v7a
		/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/sysroot/usr/lib
		/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/arm-linux-androideabi/lib)

add_library(detect SHARED ${SRC})

target_link_libraries(detect log opencv_core opencv_imgcodecs opencv_imgproc libgomp.a)

# target_link_libraries(detect log opencv_java3 libgomp.a)
#export CC=/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/bin/aarch64-linux-android-gcc
#export CXX=/home/huaizhi/Android/Sdk/ndk-bundle/build/tools/standalonetoolchain/bin/aarch64-linux-android-g++
#OPTION (USE_OpenMP "Use OpenMP" ON)
#IF(USE_OpenMP)
#  FIND_PACKAGE(OpenMP)
#  IF(OPENMP_FOUND)
#    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
#    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
#  ENDIF()
#ENDIF()
#swig -c++ -java -package com.zjgsu.face -outdir com/zjgsu/face ./jni/detect.i

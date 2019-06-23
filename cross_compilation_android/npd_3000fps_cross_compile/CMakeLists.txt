cmake_minimum_required (VERSION 3.10)
project(detect)

#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp")
set(CMAKE_SYSTEM_NAME Android)
set (CMAKE_CXX_STANDARD 11)
set(CMAKE_SYSROOT "/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/sysroot")
set(CMAKE_SYSTEM_VERSION 1)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib)

set(SRC jni/detect_wrap.cxx jni/common.cpp jni/lbf.cpp jni/npddetect.cpp jni/npdmodel.cpp jni/rf.cpp)

set(CMAKE_C_COMPILER "/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/bin/aarch64-linux-android-gcc")
set(CMAKE_CXX_COMPILER "/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/bin/aarch64-linux-android-g++")


include_directories(/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/sysroot/usr/include
		/home/tristian/Android/OpenCV-android-sdk/sdk/native/jni/include
		/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/lib/gcc/aarch64-linux-android/4.9.x/include)

link_directories(/home/tristian/Android/OpenCV-android-sdk/sdk/native/libs/arm64-v8a
		/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/sysroot/usr/lib
		/home/tristian/Android/Sdk/ndk-bundle/build/tools/standalone-toolchain/aarch64-linux-android/lib64)

add_library(detect SHARED ${SRC})

target_link_libraries(detect log opencv_java3 libgomp.a)

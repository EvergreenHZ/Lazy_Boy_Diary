cmake_minimum_required(VERSION 3.5.1)
project(detect)

#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -fopenmp")
set(CMAKE_SYSTEM_VERSION 1)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib)

set(SRC jni/detect_wrap.cxx jni/common.cpp jni/lbf.cpp jni/npddetect.cpp
        jni/npdmodel.cpp jni/rf.cpp)


include_directories(/usr/include/python2.7 ${OpenCV_INCLUDE_DIRS})
#link_directories()

add_library(_detect SHARED ${SRC})

target_link_libraries(_detect ${OpenCV_LIBS})

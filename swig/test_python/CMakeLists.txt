cmake_minimum_required (VERSION 3.5.1)

find_package (OpenCV REQUIRED)
include_directories (/usr/include/python2.7
		${OpenCV_INCLUDE_DIRS}
		./include)

set (SRC ./src/npddetect.cpp ./src/npdmodel.cpp ./src/detect_wrap.cxx)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib)

add_library (_detect.so SHARED ${SRC})

target_link_libraries (_detect.so ${OpenCV_LIBS})

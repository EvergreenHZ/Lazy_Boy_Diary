cmake_minimum_required(VERSION 3.5.1)

#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -g -std=c++11 -fopenmp")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -std=c++11 -fopenmp")
set (CMAKE_CXX_STANDARD 11)
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)
find_package(OpenCV REQUIRED)

#file(GLOB SRC "src/multiTrack/*.cpp")
file(GLOB SRC "src/track/*.cpp")
#set (SRC ./src/detectImg.cpp)
#set (SRC ./src/videoTest.cpp)

include_directories(${OpenCV_INCLUDE_DIRS} ./include
		/home/huaizhi/opencv_contrib-3.3.0/modules/tracking/samples)
#link_directories(./lib)

add_executable(videoTest ${SRC})

#target_link_libraries(videoTest ${OpenCV_LIBS} detect)
target_link_libraries(videoTest ${OpenCV_LIBS})

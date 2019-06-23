cmake_minimum_required(VERSION 2.8.9)
project (TestLibrary)

set ( PROJECT_LINK_LIBS libtestStudent.so )
link_directories( ../studentlib_shared/build )

include_directories( ../studentlib_shared/include)

add_executable(libtest libtest.cpp)
target_link_libraries(libtest ${PROJECT_LINK_LIBS} )

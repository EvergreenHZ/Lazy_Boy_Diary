# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build

# Include any dependencies generated for this target.
include CMakeFiles/libtest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/libtest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/libtest.dir/flags.make

CMakeFiles/libtest.dir/libtest.cpp.o: CMakeFiles/libtest.dir/flags.make
CMakeFiles/libtest.dir/libtest.cpp.o: ../libtest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/libtest.dir/libtest.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libtest.dir/libtest.cpp.o -c /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/libtest.cpp

CMakeFiles/libtest.dir/libtest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libtest.dir/libtest.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/libtest.cpp > CMakeFiles/libtest.dir/libtest.cpp.i

CMakeFiles/libtest.dir/libtest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libtest.dir/libtest.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/libtest.cpp -o CMakeFiles/libtest.dir/libtest.cpp.s

CMakeFiles/libtest.dir/libtest.cpp.o.requires:

.PHONY : CMakeFiles/libtest.dir/libtest.cpp.o.requires

CMakeFiles/libtest.dir/libtest.cpp.o.provides: CMakeFiles/libtest.dir/libtest.cpp.o.requires
	$(MAKE) -f CMakeFiles/libtest.dir/build.make CMakeFiles/libtest.dir/libtest.cpp.o.provides.build
.PHONY : CMakeFiles/libtest.dir/libtest.cpp.o.provides

CMakeFiles/libtest.dir/libtest.cpp.o.provides.build: CMakeFiles/libtest.dir/libtest.cpp.o


# Object files for target libtest
libtest_OBJECTS = \
"CMakeFiles/libtest.dir/libtest.cpp.o"

# External object files for target libtest
libtest_EXTERNAL_OBJECTS =

libtest: CMakeFiles/libtest.dir/libtest.cpp.o
libtest: CMakeFiles/libtest.dir/build.make
libtest: CMakeFiles/libtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable libtest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/libtest.dir/build: libtest

.PHONY : CMakeFiles/libtest.dir/build

CMakeFiles/libtest.dir/requires: CMakeFiles/libtest.dir/libtest.cpp.o.requires

.PHONY : CMakeFiles/libtest.dir/requires

CMakeFiles/libtest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/libtest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/libtest.dir/clean

CMakeFiles/libtest.dir/depend:
	cd /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build /home/huaizhi/Desktop/tool_learning/exploringBB/extras/cmake/usestudentlib/build/CMakeFiles/libtest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/libtest.dir/depend


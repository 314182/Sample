# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /downloads/Sample

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /downloads/Sample

# Include any dependencies generated for this target.
include CMakeFiles/coverage_test1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/coverage_test1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/coverage_test1.dir/flags.make

CMakeFiles/coverage_test1.dir/src/test_main.cpp.o: CMakeFiles/coverage_test1.dir/flags.make
CMakeFiles/coverage_test1.dir/src/test_main.cpp.o: src/test_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/downloads/Sample/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/coverage_test1.dir/src/test_main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/coverage_test1.dir/src/test_main.cpp.o -c /downloads/Sample/src/test_main.cpp

CMakeFiles/coverage_test1.dir/src/test_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/coverage_test1.dir/src/test_main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /downloads/Sample/src/test_main.cpp > CMakeFiles/coverage_test1.dir/src/test_main.cpp.i

CMakeFiles/coverage_test1.dir/src/test_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/coverage_test1.dir/src/test_main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /downloads/Sample/src/test_main.cpp -o CMakeFiles/coverage_test1.dir/src/test_main.cpp.s

# Object files for target coverage_test1
coverage_test1_OBJECTS = \
"CMakeFiles/coverage_test1.dir/src/test_main.cpp.o"

# External object files for target coverage_test1
coverage_test1_EXTERNAL_OBJECTS =

coverage_test1: CMakeFiles/coverage_test1.dir/src/test_main.cpp.o
coverage_test1: CMakeFiles/coverage_test1.dir/build.make
coverage_test1: CMakeFiles/coverage_test1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/downloads/Sample/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable coverage_test1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/coverage_test1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/coverage_test1.dir/build: coverage_test1

.PHONY : CMakeFiles/coverage_test1.dir/build

CMakeFiles/coverage_test1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/coverage_test1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/coverage_test1.dir/clean

CMakeFiles/coverage_test1.dir/depend:
	cd /downloads/Sample && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /downloads/Sample /downloads/Sample /downloads/Sample /downloads/Sample /downloads/Sample/CMakeFiles/coverage_test1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/coverage_test1.dir/depend


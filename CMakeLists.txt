cmake_minimum_required(VERSION 2.6)
project(Sample)
# Locate GTest
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

set(CMAKE_CXX_FLAGS " ${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
set(CMAKE_CXX_STANDARD 17)
add_executable(coverage src/test_main.cpp src/main.h)
target_link_libraries(coverage  ${GTEST_LIBRARIES} pthread)

# Link runTests with what we want to test and the GTest and pthread library
add_executable(runTests src/test_main.cpp)
target_link_libraries(runTests ${GTEST_LIBRARIES} pthread)

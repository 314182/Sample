cmake_minimum_required(VERSION 2.6)
project(sample)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_FLAGS_PROFILE --fprofile-arcs --ftest-coverage)
set(CMAKE_CXX_FLAGS_PROFILE --fprofile-arcs --ftest-coverage)
include(FetchContent)
FetchContent_Declare(
gtest
URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip
)
FetchContent_MakeAvailable(gtest)
add_executable(c_coverage main.cpp main.h)

enable_testing()
include(GoogleTest)

add_executable(runTests test_main.cpp)
target_link_libraries(runTests GTest::gtest_main pthread)

add_executable(t_coverage test_main.cpp main.h)
target_link_libraries(t_coverage GTest::gtest_main pthread)

gtest_discover_tests(runTests)

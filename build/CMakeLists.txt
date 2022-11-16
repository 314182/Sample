cmake_minimum_required(VERSION 2.6)
project(sample)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_FLAGS_PROFILE --coverage)
set(CMAKE_CXX_FLAGS_PROFILE --coverage)
include(FetchContent)
FetchContent_Declare(
gtest
URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip
)

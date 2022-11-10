cmake_minimum_required(VERSION 3.22)
project(cuda_wrapper LANGUAGES CUDA CXX)

add_library(cuda_wrapper SHARED "")

add_subdirectory(src)

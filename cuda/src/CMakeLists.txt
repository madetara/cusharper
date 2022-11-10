cmake_minimum_required(VERSION 3.22)
project(cuda-wrapper LANGUAGES CUDA CXX)

set(CMAKE_CXX_STANDARD  17)
set(CMAKE_CUDA_STANDARD 17)

find_package(CUDA REQUIRED)

target_include_directories(cuda_wrapper PRIVATE ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})
target_include_directories(cuda_wrapper PRIVATE ${CMAKE_CUDA_STANDARD_INCLUDE_DIRECTORIES})

target_sources(cuda_wrapper
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/cuda_wrapper.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/cuda_wrapper_p.h
        INTERFACE
            ${CMAKE_CURRENT_SOURCE_DIR}/cuda_wrapper.h
)

target_link_libraries(cuda_wrapper cudart cusolver)
set_target_properties(cuda_wrapper PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

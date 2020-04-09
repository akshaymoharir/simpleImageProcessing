# Minimum required version of CMake
cmake_minimum_required(VERSION 3.1)

# Project name
project(simpleImageProcessing)

# OpenCV package is required
find_package(OpenCV REQUIRED)

# Create executable name from source files
add_executable(mySimpleImageProcessingApp src/simpleImageProcessing.cpp)

# Link required libraries to executable
target_link_libraries( mySimpleImageProcessingApp ${OpenCV_LIBS} )


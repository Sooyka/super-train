# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project (super-train)


find_package(Broccoli REQUIRED)
include(BroccoliModule)


# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/super-train.cpp
)

# Add an executable with the above sources
add_executable(super-train ${SOURCES})

# add_subdirectory(Flake_1)

target_link_libraries(super-train PRIVATE sturdy-broccoli)

# include_directories(${SPDLOG_INCLUDE_DIR})

# message(${SPDLOG_INCLUDE_DIR}) 

# find_package (Eigen3 REQUIRED)

# include_directories(${EIGEN_INCLUDE_DIR} ${SPDLOG_INCLUDE_DIR} ${PROJECT_SOURCE_DIR}/include )

include_directories(${PROJECT_SOURCE_DIR}/include )

# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
# target_include_directories(Kinematics
#     PRIVATE 
#         ${PROJECT_SOURCE_DIR}/include
# )

install(TARGETS super-train
    LIBRARY DESTINATION bin
    ARCHIVE DESTINATION bin
)
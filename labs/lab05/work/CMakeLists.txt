cmake_minimum_required (VERSION 3.10)
project("lab05")

include_directories("C:\\Program Files (x86)\\Microsoft SDKs\\MPI\\Include")
link_libraries("C:\\Program Files (x86)\\Microsoft SDKs\\MPI\\Lib\\x86\\msmpi.lib")

add_executable(hello-mpi hello-mpi.cpp)
add_executable(send-receive send-receive.cpp)
add_executable(monte-carlo-pi monte-carlo-pi.cpp)
add_executable(normalize normalize.cpp)
add_executable(broadcast broadcast.cpp)
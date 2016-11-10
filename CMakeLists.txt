###############################
## CMakeList project created ##
###############################

cmake_minimum_required(VERSION 3.5)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
include(${CMAKE_MODULE_PATH}/GetGitRevisionDescription.cmake)

#################
# CONFIGURATION #
#################
option(test "Build Unit test" ON)
option(minigui "Build minigui" ON)
option(coreshell "Build coreshell" ON)
option(test_socket "Build socketcpp tests" OFF)
option(examples "Build BorealCore examples" ON)

#####################
# COMMON DEFINITION #
#####################

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

##################
# Boreal Project #
##################
project(Boreal)

##################
# Version number #
##################

# let git  generate it for us.
find_package(Git)

set(VERSION_ANNOTATION -dirty)
if (CMAKE_BUILD_TYPE MATCHES Debug)
  set(VERSION_ANNOTATION debug)
elseif (CMAKE_BUILD_TYPE MATCHES Release)
  set(VERSION_ANNOTATION release)
else()
  set(VERSION_ANNOTATION dirty)
endif()

if (GIT_FOUND)
  git_describe(VERSION --tags)
else()
  message(WARNING "git wasn't found, can't find revision number, generating a unknow one")
  set(VERSION "v0.0-unknow")
endif()

string(REGEX REPLACE "^v([0-9]+)\\..*" "\\1" BOREAL_MAJOR_VERSION "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" BOREAL_MINOR_VERSION "${VERSION}")
string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" BOREAL_PATCH_VERSION "${VERSION}")

get_git_head_revision(head_ref VERSION_SHA1)

set(BOREAL_VERSION_SHORT "${BOREAL_MAJOR_VERSION}.${BOREAL_MINOR_VERSION}.${BOREAL_PATCH_VERSION}")
set(BOREAL_VERSION_FULL "${BOREAL_VERSION_SHORT}-${VERSION_SHA1}-${VERSION_ANNOTATION}")

message("Configuring: Boreal ${BOREAL_VERSION_FULL}")

# configuring runtime version number (as opposite to compile-time one)
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/version.cc.in
  ${CMAKE_CURRENT_BINARY_DIR}/version.cc
  )

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cmake/) # version.hh is here
set(VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/version.cc")

###############################
# LIB SERIAL BUILD AND IMPORT #
###############################
include(ExternalProject)
ExternalProject_Add(
  libserialport
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/libserialport
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/libserialport/autogen.sh && ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/libserialport/configure -prefix ${CMAKE_CURRENT_SOURCE_DIR}/lib
  PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/lib
  BUILD_COMMAND make && make install
  BUILD_IN_SOURCE 1
  )

find_library(SERIAL_PORT_LIB
  NAMES serialport
  PATHS ${Boreal_SOURCE_DIR}/lib/lib
  DOC "the serialport implementation used with stock boreal")

if(NOT SERIAL_PORT_LIB)
  message(FATAL_ERROR "serialport library not found, configure it manually, install it in Boreal/lib")
endif()

##################
# SUBDIR PROJECT #
##################
add_subdirectory(3rdParty/socketcpp)
add_subdirectory(src/BorealCore)

if (test)
  enable_testing()
  add_subdirectory(3rdParty/googletest)
  add_subdirectory(tests/tests)
endif()

if (coreshell)
  add_subdirectory(tests/coreshell)
endif()

if (minigui)
  add_subdirectory(tests/minigui)
endif()

if (examples)
  add_subdirectory(examples)
endif()


#EOF

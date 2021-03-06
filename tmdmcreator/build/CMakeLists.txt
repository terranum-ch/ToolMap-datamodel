# CMAKE BUILD FILE FOR TmDmCreator 
# (c) LUCIEN SCHREIBER CREALP 2013
cmake_minimum_required(VERSION 2.6)

PROJECT ("TmDmCreator")

#search all source files
FILE (GLOB_RECURSE SRC_FILES "../src/*.cpp")
FILE (GLOB_RECURSE HEAD_FILES "../src/*.h")
MESSAGE(${SRC_FILES})
SOURCE_GROUP (source FILES ${SRC_FILES})
SOURCE_GROUP (header FILES ${HEAD_FILES})

# WXWIDGETS
# DEFINE ALL INCLUDES AND SO ON
SET(WXWINDOWS_USE_GL 0)
INCLUDE ("cmake/FindwxWidgets.cmake")


# GET PROGRAM REVISON (NUMBER)
EXECUTE_PROCESS(COMMAND "git" rev-list --count HEAD
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        TIMEOUT 20
        OUTPUT_VARIABLE lsVERSION_SOFT_VERSION
        ERROR_VARIABLE MY_ERROR1)
IF (MY_ERROR1)
  MESSAGE(FATAL_ERROR "myError1 : ${MY_ERROR1}")
ENDIF (MY_ERROR1)
STRING(STRIP ${lsVERSION_SOFT_VERSION} lsVERSION_SOFT_VERSION)

# GET PROGRAM BRANCH
EXECUTE_PROCESS(COMMAND "git" rev-parse --abbrev-ref HEAD
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        TIMEOUT 20
        OUTPUT_VARIABLE lsVERSION_SOFT_VERSION_BRANCH
        ERROR_VARIABLE MY_ERROR1)
IF (MY_ERROR1)
  MESSAGE(FATAL_ERROR "myError1 : ${MY_ERROR1}")
ENDIF (MY_ERROR1)
STRING(STRIP ${lsVERSION_SOFT_VERSION_BRANCH} lsVERSION_SOFT_VERSION_BRANCH)

# GET PROGRAM REVISION (SHORT)
EXECUTE_PROCESS(COMMAND "git" rev-parse --short HEAD
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        TIMEOUT 20
        OUTPUT_VARIABLE lsVERSION_SOFT_VERSION_REVISION
        ERROR_VARIABLE MY_ERROR1)
IF (MY_ERROR1)
  MESSAGE(FATAL_ERROR "myError1 : ${MY_ERROR1}")
ENDIF (MY_ERROR1)
STRING(STRIP ${lsVERSION_SOFT_VERSION_REVISION} lsVERSION_SOFT_VERSION_REVISION)
MESSAGE("version: ${lsVERSION_SOFT_VERSION}")


ADD_EXECUTABLE(${CMAKE_PROJECT_NAME} ${HEAD_FILES} ${SRC_FILES})

# SHOULD WE USE THE MT VERSION FOR DEFAULT 
# COMPATIBILITY WITH < WINXP
IF (WIN32)
  INCLUDE ("cmake/Use_visualstudioMT.cmake")
ENDIF (WIN32)

INCLUDE(cmake/create_installer.cmake)


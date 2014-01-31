
FIND_PACKAGE(Subversion) 
IF(Subversion_FOUND) 
  Subversion_WC_INFO(${PROJECT_SOURCE_DIR} MY) 
  MESSAGE("Current revision is ${MY_WC_REVISION}") 
ENDIF(Subversion_FOUND) 

install(
  TARGETS ${CMAKE_PROJECT_NAME}
  BUNDLE DESTINATION .
  RUNTIME DESTINATION bin 
)

SET (SOFT_NUMBER ${MY_WC_REVISION})
MESSAGE ("${SOFT_NUMBER} number")

SET(CPACK_PACKAGE_VENDOR "crealp")
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "0")
SET(CPACK_PACKAGE_VERSION_PATCH "${SOFT_NUMBER}")
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "TmDmCreator. Create ToolMap datamodels from the command line.")

# APPLE ONLY CODE 
#IF (APPLE)
#  INSTALL(FILES "../install/osx/osx_readme.pdf" DESTINATION .) 
#  SET(CPACK_PACKAGE_VERSION "1")
#  SET(CPACK_GENERATOR "DragNDrop")
#  SET(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}_r${CPACK_PACKAGE_VERSION_PATCH}")
#  SET(CPACK_DMG_VOLUME_NAME "${CMAKE_PROJECT_NAME}")
#  SET(CPACK_DMG_FORMAT "UDBZ")
#ENDIF (APPLE)

# WINDOWS CODE ONLY (NSIS)
IF (WIN32)
  #SET(CPACK_RESOURCE_FILE_LICENSE 0)
  SET (CPACK_GENERATOR "NSIS")
  SET (CPACK_NSIS_COMPRESSOR "lzma")
  SET(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-setup_r${CPACK_PACKAGE_VERSION_PATCH}")
  SET (CPACK_PACKAGE_INSTALL_DIRECTORY ${CMAKE_PROJECT_NAME})
  SET (CPACK_NSIS_CONTACT "Lucien Schreiber lucien.schreiber@crealp.vs.ch")
  SET (CPACK_NSIS_HELP_LINK "www.crealp.ch")
  SET (CPACK_NSIS_MODIFY_PATH ON)
  #SET (CPACK_NSIS_MUI_FINISHPAGE_RUN ${CMAKE_PROJECT_NAME})
  SET (CPACK_NSIS_URL_INFO_ABOUT "www.crealp.ch")
  #SET (CPACK_NSIS_MENU_LINKS
  # "bin/${SHPCROP}" "${SHPCROP}" 
  # "http://www.crealp.ch" "www.crealp.ch")
ENDIF(WIN32)

# including cpack isn't working with Linux 
IF(APPLE OR WIN32)
  INCLUDE(CPACK)
ENDIF()


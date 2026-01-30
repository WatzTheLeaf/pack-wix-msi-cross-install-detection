cmake_minimum_required(VERSION 3.29)

project("AppMsiTest")

# Include sub-projects
add_subdirectory("AppMsiTest")

# ==============================================================================
# INSTALL RULES (STAGING)
# These rules do not generate the MSI. They essentially "export" the files
# to a clean output directory (staging area) so WiX can harvest them easily.
# ==============================================================================

# The main executable
install(TARGETS AppMsiTest DESTINATION bin)

# Data directories
install(DIRECTORY "${CMAKE_SOURCE_DIR}/Data/FolderA/" DESTINATION Data/FolderA)
install(DIRECTORY "${CMAKE_SOURCE_DIR}/Data/FolderB/" DESTINATION Data/FolderB)
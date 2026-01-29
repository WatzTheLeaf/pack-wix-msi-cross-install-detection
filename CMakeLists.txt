cmake_minimum_required(VERSION 3.28)

# Enable Hot Reload for MSVC compilers if supported.
if(POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

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
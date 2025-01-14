message(STATUS "CMake version ${CMAKE_VERSION}")

# -----------------------------------------------------------------------------
# Modules
# -----------------------------------------------------------------------------

include(CTest)
include(CodeTools)
include(GenerateExportHeader)
include(GNUInstallDirs)

if (MVVM_SETUP_CODECOVERAGE)
    include(CodeCoverage)
    append_coverage_compiler_flags()
endif()

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

get_filename_component(MVVM_PROJECT_DIR "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

set(MVVM_SOVERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR})
set(MVVM_BUILDVERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH})
set(MVVM_TESTOUTPUT_DIR ${CMAKE_BINARY_DIR}/test_output_mvvm)

# -----------------------------------------------------------------------------
# Directories
# -----------------------------------------------------------------------------

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

file(MAKE_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${MVVM_TESTOUTPUT_DIR})

# directory for autogenerated configs
set(MVVM_AUTOGEN_DIR ${CMAKE_BINARY_DIR}/autogen/mvvm)
file(MAKE_DIRECTORY ${MVVM_AUTOGEN_DIR})

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 5.3 COMPONENTS Widgets Core Gui PrintSupport REQUIRED HINTS "/opt/qt5.3.2/5.3/gcc_64/lib/cmake/Qt5")
find_package(Threads)

get_target_property(Qt5Widgets_location Qt5::Widgets LOCATION_Release)
message(STATUS " Qt5 libraries : ${Qt5Widgets_LIBRARIES} ${Qt5Widgets_location}")
message(STATUS " Qt5 Includes  : ${Qt5Widgets_INCLUDE_DIRS}")

# -----------------------------------------------------------------------------
# Generating config files
# -----------------------------------------------------------------------------

configure_file(${MVVM_PROJECT_DIR}/cmake/scripts/testconfig.h.in  ${MVVM_AUTOGEN_DIR}/testconfig.h @ONLY)

if (MVVM_BUMP_VERSION)
    configure_file(${MVVM_PROJECT_DIR}/cmake/scripts/mvvm_version.h.in  ${MVVM_PROJECT_DIR}/source/libmvvm_model/mvvm/core/version.h @ONLY)
endif()

# -----------------------------------------------------------------------------
# Compile options
# -----------------------------------------------------------------------------

add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/MP>)

# warning level
if (MSVC)
    add_compile_options(/W2)
else()
    add_compile_options(-Wall -Wextra -pedantic)
endif()

cmake_minimum_required(VERSION 3.19...4.3)

project(RPNcalc
LANGUAGES Fortran
VERSION 1.4.1
)

enable_testing()

option(RPNcalc_BUILD_TESTING "build tests" on)

include(cmake/compilers.cmake)

file(GENERATE OUTPUT .gitignore CONTENT "*")


set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include)

add_executable(rpncalc app/main.f90 src/help.f90 src/eval.f90 src/ui.f90)
target_include_directories(rpncalc PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
target_link_libraries(rpncalc PRIVATE assert hyper reg funcs)

#--- functions (usable in other programs too)
add_library(assert OBJECT src/assert.F90)
target_include_directories(assert PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
target_compile_definitions(assert PRIVATE $<$<NOT:$<BOOL:${f03ieee}>>:NO_IEEE>)

add_subdirectory(src)

if(RPNcalc_BUILD_TESTING)
  add_subdirectory(test)
endif()


#--- install
install(TARGETS rpncalc)

install(FILES ${PROJECT_SOURCE_DIR}/README.md
  DESTINATION share/docs/RPNcalc)

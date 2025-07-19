find_package(Python COMPONENTS Interpreter)

if(Python_Interpreter_FOUND)
  if(NOT DEFINED Scipy_ok)
    execute_process(COMMAND ${Python_EXECUTABLE} -c "import scipy; print('SciPy', scipy.__version__)"
    ERROR_VARIABLE err
    RESULT_VARIABLE ret
    )
    message(VERBOSE "${ret} ${err}")
    if(ret EQUAL 0)
      set(Scipy_ok true CACHE BOOL "Scipy OK")
    else()
      set(Scipy_ok false CACHE BOOL "Scipy Not Found")
    endif()
  endif()

  if(NOT DEFINED HAS_PYTEST)
    execute_process(COMMAND ${Python_EXECUTABLE} -c "import pytest"
    ERROR_VARIABLE err
    RESULT_VARIABLE ret
    )
    message(VERBOSE "${ret} ${err}")
    if(ret EQUAL 0)
      set(HAS_PYTEST true CACHE BOOL "Pytest OK")
    else()
      set(HAS_PYTEST false CACHE BOOL "Pytest Not Found")
    endif()
  endif()
endif()


add_executable(testcalc test.f90)
target_link_libraries(testcalc PRIVATE assert funcs hyper reg)

add_test(NAME RPNfunc COMMAND testcalc)

add_test(NAME UI
COMMAND ${CMAKE_COMMAND} -Dtgt:FILEPATH=$<TARGET_FILE:rpncalc> -Dtxt:FILEPATH=${CMAKE_CURRENT_SOURCE_DIR}/test_ui.asc -P ${PROJECT_SOURCE_DIR}/cmake/test_stdin.cmake)
set_property(TEST UI PROPERTY PASS_REGULAR_EXPRESSION "10.0")

add_test(NAME Value
COMMAND ${CMAKE_COMMAND} -Dtgt:FILEPATH=$<TARGET_FILE:rpncalc> -Dtxt:FILEPATH=${CMAKE_CURRENT_SOURCE_DIR}/test_value.asc -P ${PROJECT_SOURCE_DIR}/cmake/test_stdin.cmake)
set_property(TEST Value PROPERTY PASS_REGULAR_EXPRESSION "308 / 29")

get_property(test_names DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY TESTS)

add_test(NAME FunctionEval
COMMAND Python::Interpreter -m pytest ${CMAKE_CURRENT_SOURCE_DIR}/test_functions.py --exe $<TARGET_FILE:rpncalc>
)
set_property(TEST FunctionEval PROPERTY DISABLED $<OR:$<NOT:$<BOOL:${Scipy_ok}>>,$<NOT:$<BOOL:${HAS_PYTEST}>>>)

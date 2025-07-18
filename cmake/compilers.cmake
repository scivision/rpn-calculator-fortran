include(GNUInstallDirs)
include(CheckSourceCompiles)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

check_source_compiles(Fortran "subroutine test()
use, intrinsic :: ieee_arithmetic
logical :: L
L = ieee_is_finite(0.)
end subroutine"
f03ieee
)

check_source_compiles(Fortran "subroutine test()
complex :: x
real :: r, c
r = x%RE
c = x%IM
end subroutine"
f08prop
)

if(NOT f08prop)
  message(FATAL_ERROR "${CMAKE_Fortran_COMPILER_ID} does not have Fortran 2008 %RE %IM real imaginary properties.")
endif()


check_source_compiles(Fortran "subroutine test()
complex :: x
print *, acosh(x)
end subroutine"
f08hyper
)

if(NOT f08hyper)
  message(FATAL_ERROR "${CMAKE_Fortran_COMPILER_ID} does not have Fortran 2008 hyperbolic functions.")
endif()

if(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
  add_compile_options(-fimplicit-none -Werror=line-truncation
  "$<$<CONFIG:Debug>:-fcheck=all;-fexceptions;-ffpe-trap=invalid,zero,overflow;-finit-real=nan;-Wconversion>"
  )
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "IntelLLVM")
  add_compile_options(-traceback
  "$<$<CONFIG:Debug>:-warn;-fpe0>"
  )
endif()

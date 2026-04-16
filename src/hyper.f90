module hyper

use assert, only: wp
use global

implicit none

private

interface sech
procedure :: sech_r, sech_c
end interface sech

interface asech
procedure :: asech_r, asech_c
end interface asech

interface csch
procedure :: csch_r, csch_c
end interface csch

interface acsch
procedure :: acsch_r, acsch_c
end interface acsch

interface coth
procedure :: coth_r, coth_c
end interface coth

interface acoth
procedure :: acoth_r, acoth_c
end interface acoth

interface tanhc
procedure :: tanhc_r, tanhc_c
end interface tanhc

public :: sech, asech, csch, acsch, coth, acoth, tanhc

contains


!***********************************************************************************************************************************
!  TANHC
!
!  Tanhc function.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION TANHC_r (X) RESULT (Y)
real(wp), INTENT(IN) :: X
IF (X .EQ. 0._wp) THEN
   Y = 1
ELSE
   Y = TANH(X) / X
END IF
END FUNCTION


elemental complex(wp) FUNCTION TANHC_c (Z) RESULT (Y)
COMPLEX(wp), INTENT(IN) :: Z
IF (Z .EQ. (0._wp, 0._wp)) THEN
   Y = (1._wp, 0._wp)
ELSE
   Y = TANH(Z) / Z
END IF
END FUNCTION

!***********************************************************************************************************************************
!  SECH
!
!  Hyperbolic secant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION SECH_r(X) result(s)
real(wp), INTENT (IN) :: X
s = 1/COSH(X)
END FUNCTION

elemental complex(wp) FUNCTION SECH_c(Z) RESULT(s)
COMPLEX(wp), INTENT (IN) :: Z
s = 1/cosh(Z)
END FUNCTION


!***********************************************************************************************************************************
!  ASECH
!
!  Inverse hyperbolic secant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ASECH_r(y) result(s)
real(wp), INTENT (IN) :: Y
s = ACOSH(1/Y)
END FUNCTION


elemental complex(wp) FUNCTION ASECH_c(Y) result(s)
COMPLEX(wp), INTENT (IN) :: Y
s = ACOSH(1/Y)
END FUNCTION

!***********************************************************************************************************************************
!  CSCH
!
!  Hyperbolic cosecant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION CSCH_r(X) RESULT (Y)
real(wp), INTENT (IN) :: X
Y = 1/SINH(X)
END FUNCTION


elemental complex(wp) FUNCTION CSCH_c(Z) RESULT (Y)
COMPLEX(wp), INTENT (IN) :: Z
Y = 1 / SINH(Z)
END FUNCTION

!***********************************************************************************************************************************
!  ACSCH
!
!  Inverse hyperbolic cosecant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACSCH_r(Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = ASINH(1/Y)
END FUNCTION


elemental complex(wp) FUNCTION ACSCH_c(Y) RESULT (X)
COMPLEX(wp), INTENT (IN) :: Y
X = ASINH(1/Y)
END FUNCTION


!***********************************************************************************************************************************
!  COTH
!
!  Hyperbolic cotangent.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION COTH_r(X) result(s)
real(wp), INTENT (IN) :: X
s = 1/TANH(X)
END FUNCTION

elemental complex(wp) FUNCTION COTH_c(Z) result(s)
COMPLEX(wp), INTENT (IN) :: Z
s = 1 / tanh(Z)
END FUNCTION


!***********************************************************************************************************************************
!  ACOTH
!
!  Inverse hyperbolic cotangent.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACOTH_r(Y) result(s)
real(wp), INTENT (IN) :: Y
s = ATANH(1/Y)
END FUNCTION


elemental complex(wp) FUNCTION ACOTH_c(Z) result(s)
COMPLEX(wp), INTENT(IN) :: Z
s = 0.5_wp*LOG((Z+1)/(Z-1))
END FUNCTION

end module hyper

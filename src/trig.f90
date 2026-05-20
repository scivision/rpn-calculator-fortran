module trig

use assert, only: wp

implicit none

interface csc
procedure :: csc_r, csc_c
end interface csc

interface acsc
procedure :: acsc_r, acsc_c
end interface acsc

interface sec
procedure :: sec_r, sec_c
end interface sec

interface asec
procedure :: asec_r, asec_c
end interface asec

interface cot
procedure :: cot_r, cot_c
end interface cot

interface acot
procedure :: acot_r, acot_c
end interface acot

interface hav
procedure :: hav_r, hav_c
end interface hav

interface ahav
procedure :: ahav_r, ahav_c
end interface ahav

interface crd
procedure :: crd_r, crd_c
end interface crd

interface vers
procedure :: vers_r, vers_c
end interface vers

interface avers
procedure :: avers_r, avers_c
end interface avers

interface covers
procedure :: covers_r, covers_c
end interface covers

interface acovers
procedure :: acovers_r, acovers_c
end interface acovers

interface exsec
procedure :: exsec_r, exsec_c
end interface exsec

interface aexsec
procedure :: aexsec_r, aexsec_c
end interface aexsec

interface acrd
procedure :: acrd_r, acrd_c
end interface acrd

private
public :: csc, acsc, sec, asec, cot, acot, acot2, hav, ahav, crd
public :: vers, avers, covers, acovers, exsec, aexsec, acrd

contains


!***********************************************************************************************************************************
!  SEC
!
!  Secant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION SEC_r (X) RESULT (r)
real(wp), INTENT (IN) :: X
r = 1/COS(X)
END FUNCTION


elemental complex(wp) FUNCTION SEC_c(Z) RESULT (r)
COMPLEX(wp), INTENT(IN) :: Z
r = 1/COS(Z)
END FUNCTION



!***********************************************************************************************************************************
!  ASEC
!
!  Inverse secant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ASEC_r (Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = ACOS(1/Y)
END FUNCTION


elemental complex(wp) FUNCTION ASEC_c (Z) RESULT (Y)
COMPLEX(wp), INTENT(IN) :: Z
Y = ACOS(1/Z)
END FUNCTION
!***********************************************************************************************************************************
!  CSC
!
!  Cosecant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION CSC_r(X) RESULT (r)
real(wp), INTENT (IN) :: X
r = 1/SIN(X)
END FUNCTION


elemental complex(wp) FUNCTION CSC_c(Z) RESULT (r)
COMPLEX(wp), INTENT(IN) :: Z
r = 1/SIN(Z)
END FUNCTION


!***********************************************************************************************************************************
!  ACSC
!
!  Inverse cosecant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACSC_r(Y) RESULT (r)
real(wp), INTENT (IN) :: Y
r = ASIN(1/Y)
END FUNCTION


elemental complex(wp) FUNCTION ACSC_c(Z) RESULT (r)
COMPLEX(wp), INTENT(IN) :: Z
r = ASIN(1/Z)
END FUNCTION


!***********************************************************************************************************************************
!  COT
!
!  Cotangent.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION COT_r(X) RESULT (r)
real(wp), INTENT (IN) :: X
r = 1/TAN(X)
END FUNCTION


elemental complex(wp) FUNCTION COT_c(Z) RESULT (r)
COMPLEX(wp), INTENT(IN) :: Z
r = COS(Z)/SIN(Z)
END FUNCTION

!***********************************************************************************************************************************
!  ACOT
!
!  Inverse cotangent.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACOT_r (Y) RESULT (r)
real(wp), INTENT (IN) :: Y
r = ATAN(1/Y)
END FUNCTION


elemental complex(wp) FUNCTION ACOT_c(Y) RESULT (r)
complex(wp), INTENT (IN) :: Y
r = ATAN(1/Y)
END FUNCTION

!***********************************************************************************************************************************
!  ACOT2
!
!  Inverse cotangent (two arguments).
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACOT2 (Y,Z)
real(wp), INTENT (IN) :: Y       !< cotangent numerator
real(wp), INTENT (IN) :: Z       !< cotangent denominator
ACOT2 = ATAN2(Z,Y)
END FUNCTION


!***********************************************************************************************************************************
!  EXSEC
!
!  Exsecant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION EXSEC_r (X) RESULT (Y)
real(wp), INTENT (IN) :: X
Y = 1/COS(X) - 1
END FUNCTION


elemental complex(wp) FUNCTION EXSEC_c (Z) RESULT (Y)
COMPLEX(wp), INTENT(IN) :: Z
Y = 1/COS(Z) - 1
END FUNCTION

!***********************************************************************************************************************************
!  AEXSEC
!
!  Inverse exsecant.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION AEXSEC_r (Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = ACOS(1 / (Y + 1))
END FUNCTION

elemental complex(wp) FUNCTION AEXSEC_c (Y) RESULT (X)
COMPLEX(wp), INTENT (IN) :: Y
X = ACOS(1 / (Y + 1))
END FUNCTION


!***********************************************************************************************************************************
!  VERS
!
!  Versine.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION VERS_r (X) RESULT (Y)
real(wp), INTENT (IN) :: X
Y = 1 - COS(X)
END FUNCTION

elemental complex(wp) FUNCTION VERS_c (Z) RESULT (Y)
COMPLEX(wp), INTENT(IN) :: Z
Y = 1 - COS(Z)
END FUNCTION

!***********************************************************************************************************************************
!  AVERS
!
!  Inverse versine.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION AVERS_r (Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = ACOS(1 - Y)
END FUNCTION

elemental complex(wp) FUNCTION AVERS_c (Y) RESULT (X)
COMPLEX(wp), INTENT (IN) :: Y
X = ACOS(1 - Y)
END FUNCTION


!*************************************************************************************************
!  COVERS
!
!  Coversine.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION COVERS_r (X) RESULT (Y)
real(wp), INTENT (IN) :: X
Y = 1 - SIN(X)
END FUNCTION


elemental complex(wp) FUNCTION COVERS_c (Z) RESULT (Y)
COMPLEX(wp), INTENT(IN) :: Z
Y = 1 - SIN(Z)
END FUNCTION


!***********************************************************************************************************************************
!  ACOVERS
!
!  Inverse coversine.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACOVERS_r (Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = ASIN(1 - Y)
END FUNCTION

elemental complex(wp) FUNCTION ACOVERS_c (Y) RESULT (X)
COMPLEX(wp), INTENT (IN) :: Y
X = ASIN(1 - Y)
END FUNCTION


!***********************************************************************************************************************************
!  HAV
!
!  Haversine.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION HAV_r(X) RESULT (Y)
real(wp), INTENT (IN) :: X
Y = (SIN(0.5_wp*X))**2
END FUNCTION


elemental complex(wp) FUNCTION HAV_c(Z) RESULT (Y)
COMPLEX(wp), INTENT(IN) :: Z
Y = (SIN(0.5_wp*Z))**2
END FUNCTION


!***********************************************************************************************************************************
!  AHAV
!
!  Inverse haversine.
!***********************************************************************************************************************************

elemental real(wp) FUNCTION AHAV_r(Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = 2*ASIN(SQRT(Y))
END FUNCTION

elemental complex(wp) FUNCTION AHAV_c(Y) RESULT (X)
COMPLEX(wp), INTENT (IN) :: Y
X = 2*asin(SQRT(Y))
END FUNCTION


!***********************************************************************************************************************************
!  CRD
!
!  Chord (of Ptolemy).
!***********************************************************************************************************************************

elemental real(wp) FUNCTION CRD_r (X) RESULT (r)
real(wp), INTENT (IN) :: X
r = 2*SIN(0.5_wp*X)
END FUNCTION

elemental complex(wp) FUNCTION CRD_c (Z) RESULT (r)
COMPLEX(wp), INTENT(IN) :: Z
r = 2*SIN(0.5_wp*Z)
END FUNCTION


!***********************************************************************************************************************************
!  ACRD
!
!  Inverse chord (of Ptolemy).
!***********************************************************************************************************************************

elemental real(wp) FUNCTION ACRD_r(Y) RESULT (X)
real(wp), INTENT (IN) :: Y
X = 2*ASIN(0.5_wp*Y)
END FUNCTION

elemental complex(wp) FUNCTION ACRD_c(Y) RESULT (X)
COMPLEX(wp), INTENT (IN) :: Y
X = 2*ASIN(0.5_wp*Y)
END FUNCTION


end module trig

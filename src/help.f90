module help

implicit none

private
public :: print_help

contains

subroutine print_help()

print '(a)', achar(13),'See README.md for complete documentation'
print '(a,/)', 'https://github.com/scivision/rpn-calculator-fortran'

print '(a)','Mode calculator is in:   MODES'
print '(a)','Stack:  R - roll down     U - roll up      D - drop'
print '(a)','        CLALL - clear all     CLS - Clear stack'
print '(a)','Number systems:     REAL     COMPLEX     RATIONAL'
print '(a)','Angular systems:    DEG     RAD     GRAD'
print '(a)','Number base:  BIN    DEC    HEX    OCT'
print '(a)','Register memory:  STOx   RCLx   where x ~ 0..9'

end subroutine print_help


end module help

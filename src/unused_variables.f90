PROGRAM unused_variables
!-----------------------------------------------------------------------
!
!  This program is used to test wheter flang eliminates unused variables
!
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER :: a,b,c,d
a = 9
b = 11
c = a * b
! The result of d is unused and should be eliminated
d = c * a * b
! Write out area of circle using function call
write(*,100) "The result of ",a, " * ", b, " is ", c
100 format (A,I1,A,I2,A,I2)

END PROGRAM unused_variables

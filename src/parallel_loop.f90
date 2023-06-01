PROGRAM parallel_loop
!-----------------------------------------------------------------------
!
!  This program is used to test wheter flang eliminates unused variables
!
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)				:: length, i
REAL(kind=8), allocatable 	:: arr(:)
length = 1024*1024
allocate (arr(length))

! Parallel do loop

!$omp parallel do
do i=1,length
	arr(i) = REAL(i-1,kind=8)/length
end do
!$omp end parallel do

! Write the result
write(*,100) "The result of arr(1) = arr(",length,") is ", (arr(1) + arr(length))
100 format (A,I7,A,F10.9)

END PROGRAM parallel_loop

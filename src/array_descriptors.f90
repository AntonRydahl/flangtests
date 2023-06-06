PROGRAM array_descriptor
!-----------------------------------------------------------------------
!  Minimal reproducible example of flang-new not generating duplicate 
! array descriptors with -fopenmp -O3
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)			:: length, i
REAL(kind=8), allocatable 	:: arr(:)
length = 1024*1024
allocate (arr(length))
! Parallel do loop
!$omp parallel do
do i=1,length
	arr(i) = 1.0/length
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of (arr(1)+arr(",length,") is ", (arr(1)+arr(length))
100 format (A,I7,A,e13.6e2)
! Deallocate Array
deallocate(arr)
END PROGRAM array_descriptor

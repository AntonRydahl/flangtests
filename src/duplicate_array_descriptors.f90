PROGRAM duplicate_array_descriptors
!-----------------------------------------------------------------------
!  Minimal reproducible example of flang-new generating duplicate array 
! descriptors with -fopenmp -O3
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)			:: length, i
REAL(kind=8), allocatable 	:: arr(:)
REAL(kind=8)			:: tmp
length = 1024*1024
allocate (arr(length))
! Parallel do loop
!$omp parallel do private(tmp)
do i=1,length
	arr(i) = 1.0/length
	tmp = arr(i)
!	arr(i) = 2.0*arr(i)
!	arr(i) = 0.5*arr(i)
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of (arr(1)+arr(",length,") is ", (arr(1)+arr(length))
100 format (A,I7,A,e13.6e2)
! Deallocate Array
deallocate(arr)
END PROGRAM duplicate_array_descriptors

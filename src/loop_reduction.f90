PROGRAM parallel_loop
!-----------------------------------------------------------------------
!  This program is used to test wheter flang eliminates unused variables
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)			:: length, i
REAL(kind=8), allocatable 	:: arr(:)
REAL(kind=8)			:: sumval
length = 1024*1024
allocate (arr(length))
sumval = 0.0
! Parallel do loop
!$omp parallel do reduction(+:sumval)
do i=1,length
	arr(i) = 1.0/length
	sumval = sumval + arr(i)
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of sum(arr(1:",length,")) is ", sumval
100 format (A,I7,A,e13.6e2)
!write (*,*), sumval
! Deallocate Array
deallocate(arr)
END PROGRAM parallel_loop

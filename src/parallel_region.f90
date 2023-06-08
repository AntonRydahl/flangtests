PROGRAM parallel_region
#ifdef OPENMP
	USE OMP_LIB
#endif
	IMPLICIT NONE
	INTEGER(kind=4)			:: length
	REAL(kind=8)			:: tmp, res
	length = 1024*1024
	call omp_subroutine(length,res)
	write(*,100) "The result of (arr(1)+arr(",length,") is ", res
	100 format (A,I7,A,e13.6e2)
CONTAINS
	SUBROUTINE omp_subroutine(length,res)
		IMPLICIT NONE
		INTEGER(kind=4), INTENT(in)	:: length
		INTEGER(kind=4)			:: i,tid,threads,from,to,block_size
		REAL(kind=8), ALLOCATABLE	:: arr(:)
		REAL(kind=8)			:: tmp
		REAL(kind=8), INTENT(out)	:: res 
		allocate (arr(length))
		!$omp parallel private(tid,threads,i,from,to,block_size) shared(length,arr)
#ifdef OPENMP
		tid = omp_get_thread_num()
		threads = omp_get_num_threads()
#else
		tid = 0
		threads = 1
#endif
		block_size = length / threads
		from = tid*block_size + 1 
		IF (tid .EQ. (threads - 1)) THEN
			to = length
		ELSE
			to = from + block_size
		END IF
		DO i=from,to
			arr(i) = 1.0/length
	        	tmp = arr(i)
		END DO
		!$omp end parallel
		res = arr(1) + arr(length)
		deallocate(arr)
	END SUBROUTINE omp_subroutine
END PROGRAM parallel_region

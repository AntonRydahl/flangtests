#include <stdio.h>
#include <stdlib.h>
#ifdef OPENMP
#include <omp.h>
#endif
int main(void) {
	const int length = 1024*1024;
	double * arr = (double *) malloc(length*sizeof(double));
	#pragma omp parallel
	{
#ifdef OPENMP
		int tid = omp_get_thread_num();
		int threads = omp_get_num_threads();
#else
		int tid = 0;
		int threads = 1;
#endif
		int block_size = length/threads;
		int from = tid*block_size;
		int to = (tid == threads-1) ? length : from+block_size; 
		for(int i = from; i < to; i++) {
			arr[i] = 1.0/length;
		}
	}
	printf("The result of arr[0]+arr[%d] is %lf\n",length-1,arr[0]+arr[length-1]);
	free(arr);
	return 0;
}

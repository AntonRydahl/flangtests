#include <stdio.h>
#include <stdlib.h>
int main(void) {
	const int length = 1024*1024;
	double * arr = (double *) malloc(length*sizeof(double));
	#pragma omp parallel for num_threads(24)
	for(int i = 0; i < length; i++) arr[i] = ((double) i)/length;
	printf("The result of arr[0] + arr[%d] is %1.9lf\n",length-1,arr[0] + arr[length-1]);
	free(arr);
	return 0;
}

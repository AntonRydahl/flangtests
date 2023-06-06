#include <stdio.h>
#include <stdlib.h>
int main(void) {
	const int length = 1024*1024;
	double * arr = (double *) malloc(length*sizeof(double));
	double tmp;
	#pragma omp parallel for private(tmp) 
	for(int i = 0; i < length; i++) {
		arr[i] = 1.0/length;
		tmp= arr[i];
	}
	printf("The result of arr[0]+arr[%d] is %1.9lf\n",length-1,arr[0]-arr[length-1]);
	free(arr);
	return 0;
}

#include <stdio.h>
#include <stdlib.h>
int main(void) {
	const int length = 1024*1024;
	double * arr = (double *) malloc(length*sizeof(double));
	double sum = 0.0;
	#pragma omp parallel for reduction(+:sum)
	for(int i = 0; i < length; i++) {
		arr[i] = 1.0/length;
		sum += arr[i];
	}
	printf("The result of sum(arr[0:%d]) is %1.9lf\n",length-1,sum);
	free(arr);
	return 0;
}

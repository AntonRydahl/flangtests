#include <stdio.h>
#include <stdlib.h>
#define TEST_ARR_LEN 100000000

#pragma omp declare target
void increment_at(int i, int *array);
int increment(int i);
void increment_loop(int * len,int *array);
#pragma omp end declare target

void increment_subroutine(int *b, int n) {
#pragma omp target map(tofrom : b [0:n])
#pragma omp teams distribute parallel for
  for (int i = 0; i < n; i++) {
    increment_at(i, b);
  }
}

void increment_function(int *b, int n) {
#pragma omp target map(tofrom : b [0:n])
#pragma omp teams distribute parallel for
  for (int i = 0; i < n; i++) {
    b[i] = increment(b[i]);
  }
}

void increment_impl_loop(int * b, int n) {
#pragma omp target map(tofrom : b [0:n])
  increment_loop(&n,b);
}

int main() {
  int * arr = malloc(TEST_ARR_LEN*sizeof(int));

  #pragma omp parallel for
  for (int i = 0; i < TEST_ARR_LEN; i++) arr[i] = i;
 
  printf("Calling subroutine from the device\n");
  increment_subroutine(arr, TEST_ARR_LEN);
  for (int i = 0; i < 10; i++) {
    printf("%d = %d\n", i, arr[i]);
  }

  printf("Calling function from the device\n");
  increment_function(arr, TEST_ARR_LEN);
  for (int i = 0; i < 10; i++) {
    printf("%d = %d\n", i, arr[i]);
  }

  printf("Calling function with implicit loop from the device\n");
  increment_impl_loop(arr, TEST_ARR_LEN);
  for (int i = 0; i < 10; i++) {
    printf("%d = %d\n", i, arr[i]);
  }

  free(arr);

  return 0;
}

#include <stdio.h>
#define TEST_ARR_LEN 10

#pragma omp declare target
void increment_at(int i, int *array);
int increment(int i);
#pragma omp end declare target

void increment_subroutine(int *b, int n) {
#pragma omp target map(tofrom : b [0:n])
  for (int i = 0; i < n; i++) {
    increment_at(i, b);
  }
}

void increment_function(int *b, int n) {
#pragma omp target map(tofrom : b [0:n])
  for (int i = 0; i < n; i++) {
    b[i] = increment(b[i]);
  }
}

int main() {
  int arr[TEST_ARR_LEN] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  
  printf("Calling subroutine from the device\n");
  increment_subroutine(arr, TEST_ARR_LEN);
  for (int i = 0; i < TEST_ARR_LEN; i++) {
    printf("%d = %d\n", i, arr[i]);
  }
  printf("Calling function from the device\n");

  increment_function(arr, TEST_ARR_LEN);
  for (int i = 0; i < TEST_ARR_LEN; i++) {
    printf("%d = %d\n", i, arr[i]);
  }

  return 0;
}

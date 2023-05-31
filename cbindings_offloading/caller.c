#include <stdio.h>
#define TEST_ARR_LEN 10

#pragma omp declare target
void increment_at(int i, int *array);
#pragma omp end declare target

void increment_array(int *b, int n) {
#pragma omp target map(tofrom : b [0:n])
  for (int i = 0; i < n; i++) {
    //b[i]++;;//
    increment_at(i, b);
  }
}

int main() {
  int arr[TEST_ARR_LEN] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

  increment_array(arr, TEST_ARR_LEN);
  for (int i = 0; i < TEST_ARR_LEN; i++) {
    printf("%d = %d\n", i, arr[i]);
  }

  return 0;
}

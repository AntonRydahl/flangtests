#include <time.h>

void add_arr(int* arr, int* out, int len) {
    for (int i = 0; i < len; i++) {
        out[i] = arr[i] + 27;
    }
}

int main() {
    int m[7] = {1, 2, 3, 4, 5, 6, 7}, o[7];
    clock_t start, end;

    start = clock();
    for (int i = 1; i <= 1000000000; i++) {
        add_arr(m, o, 7);
    }
    end = clock();

    printf("%d", o[0]);
    printf("time taken: %f", ((double)(end - start)) / CLOCKS_PER_SEC);
}
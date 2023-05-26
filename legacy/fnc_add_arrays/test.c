int* add_arr(int* a, int* b) {
    for (int i = 0; i < 3; i++) {
        a[i] += b[i];
    }
    return a;
}
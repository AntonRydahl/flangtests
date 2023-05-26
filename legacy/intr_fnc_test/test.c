#define MAX(a, b) ((a) > (b) ? (a) : (b))
#include <stdio.h>

int mx_sum_3x3(int mat[3][3]) {
    int sums[3] = {
        mat[0][0] + mat[1][0] + mat[2][0],
        mat[1][0] + mat[1][1] + mat[1][2],
        mat[2][0] + mat[2][1] + mat[2][2]};
    return MAX(MAX(sums[0], sums[1]), sums[2]);
}

int mx_sum_open(int *mat, int cols, int rows) {
    int max_col = 0;
    for (int r = 0; r < rows; r++) {
        int col_sum = 0;
        for (int c = 0; c < cols; c++) {
            col_sum += *(mat + c * cols + r);
        }
        max_col = MAX(max_col, col_sum);
    }
    return max_col;
}
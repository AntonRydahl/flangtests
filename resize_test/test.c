void resh(int flat[9], int mat[3][3]) {
    for (int i = 0; i < 9; i++) {
        mat[i / 3][i % 3] = flat[i];
    }
}

int main() {
    int flat[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9},
        mat[3][3];

    for (int j = 1; j <= 100000; j++) {
        for (int i = 0; i < 9; i++) {
            flat[i] = i + 1 + j;
        }
        resh(flat, mat);
    }

    printf("%d", mat[0][0]);
}
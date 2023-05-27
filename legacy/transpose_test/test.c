void trans_open(int* original, int* dest, int orows, int ocols) {
    for (int i = 0; i < orows; i++) {
        for (int j = 0; j < ocols; j++) {
            *(dest + i + j * orows) = *(original + i * orows + j);
        }
    }
}

void trans_closed(int original[3][3], int dest[3][3]) {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            dest[i][j] = original[j][i];
        }
    }
}

void trans_manual(int original[3][3], int dest[3][3]) {
    dest[0][1] = original[1][0];
    dest[1][0] = original[0][1];
    dest[0][2] = original[2][0];
    dest[2][0] = original[0][2];
    dest[2][1] = original[1][2];
    dest[1][2] = original[2][1];
    dest[0][0] = original[0][0];
    dest[1][1] = original[1][1];
    dest[2][2] = original[2][2];
}
#include "test.c"

/*
    integer :: i, mat(3, 3), s

    mat = 0
    s = 0

    do i = 1, 100000
        mat = 0
        mat(3, 3) = i
        mat = transpose(mat)
        s = s + sum(mat(3, :), dim=1)
    end do
*/
int main() {
    int s = 0, mat[3][3] = {
        {1, 2, 3}, {4, 5, 6}, {7, 8, 9}
    }, out[3][3];

    for (int i = 0; i < 100000; i++) {
        mat[2][2] = i;
        trans_open(mat, out, 3, 3);
        s += out[2][2];
    }

    printf("%d", s);
}
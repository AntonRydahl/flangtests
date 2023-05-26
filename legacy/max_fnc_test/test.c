/*    pure integer function mval_open(v)
        implicit none
        integer, intent(in) :: v(:)
        mval_open = maxval(v, dim=1)
    end function

    pure integer function mval_closed(v)
        implicit none
        integer, intent(in) :: v(3)
        mval_closed = maxval(v, dim=1)
    end function
*/
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#include <stdio.h>

int mval_open(int* v, int len) {
    int val = 0;
    for (int i = 0; i < len; i++) {
        val = MAX(val, v[i]);
    }
    return val;
}

int mval_closed(int v[3]) {
    return MAX(MAX(v[0], v[1]), v[2]);
}
# `fnc_add_arrays`

```fortran
module test
    implicit none
contains
    subroutine add_arr(a, b)
        implicit none
        integer, intent(inout) :: a(3)
        integer, intent(in) :: b(3)
        a = a + b
    end subroutine
end module
```

```c
int* add_arr(int* a, int* b) {
    for (int i = 0; i < 3; i++) {
        a[i] += b[i];
    }
    return a;
}
```

Notes:
- Pretty much no difference between clang and flang on -O3 and -O2.
- There are a lot of needless math operations happening in flang's unoptimized LLVM IR.  There are multiple lines where LLVM assigns a new virtual register the value of a previous value multipled by 1 (`./fbin/test.ll` lines 22, 23, 28, and 29) or incremented by zero (`./fbin/test.ll` lines 24 and 30).  Additionally, it follows `%8 = add i64 %4, 1` up with `%9 = sub i64 %8, 1` and later `%15 = sub i64 %8, 1`, which seems redundant.  I also do find it strange that it tracks both the current position of the "iterator" as well as the number of items left.  It uses the "iterator" position to load and store values, but it uses the number of items left to check when to stop the loop.  It seems like it would be easier to just check if the "iterator" value is set to three.  These issues aren't present O2 and O3, but I figured it was worth mentioning.
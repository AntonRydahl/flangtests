# `add_arrays_test`

```fortran
program test
    integer :: a(3), b(3), c(3)
    a = [17, 27, 37]
    b = [44, 55, 66]

    c = a + b
    print *, c
end program
```

```c
int main() {
    int a[3] = {17, 27, 37},
        b[3] = {44, 55, 66};
    int c[3];

    for (int i = 0; i < 3; i++) {
        c[i] = a[i] + b[i];
    }

    for (int i = 0; i < 3; i++) {
        println("%d", c[i]);
    }
}
```

Notes:
- Clang on O3 never calls alloca wheras flang on O3 does.  Clang just prints out the three numbers.  Tht said, this might be due to differences between `printf` and fortran's `print` statement.  Both were able to add the arrays at compile time, though.
- See the second bullet in `fnc_add_arrays`
- Unoptimized flang has three loops: one to populate a, one to populate b, and one to add them together.  Clang just uses memcpy to populate a and b.
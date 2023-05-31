# Calling Fortran Function from the Device
Even though the `flang-new` compiler does not yet offer offloading to GPUs, FORTRAN subroutines can be falled from the devide when compiled with the `clang` compiler. This example shows how a subroutine can be declared to use the C calling convention and how it can conform with the C types.
```fortran
subroutine increment_at(c_index, arr) bind(C, name="increment_at")
    use ISO_C_BINDING
    integer (C_INT), dimension(*), intent(inout) :: arr
    integer (C_INT), value :: c_index
    arr(c_index+1) = arr(c_index+1) + 1
end subroutine
```

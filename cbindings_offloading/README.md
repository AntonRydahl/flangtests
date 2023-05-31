# Calling Fortran Function from the Device
Even though the `flang-new` compiler does not yet offer offloading to GPUs, FORTRAN subroutines can be falled from the devide when compiled with the `clang` compiler. This example shows how a subroutine can be declared to use the C calling convention and how it can conform with the C types.

## Passing Arguments
`FORTRAN` is call by reference while `C` is call by value. To pass arguments by value, use the `VALUE` attribute. A `FORTRAN` subroutine performs some operations on the input variables. Hence, subroutines have return type `void`. In contrast, functions in `FORTRAN` have non-void return types.

## C Bindings
Since FORTRAN 2003, the language has supported the language binding attribute `bind(C,name=some_name)` where C is the inly supported language. The optional argument can `name` specifier can alter the external name of the function. As an example, 
```fortran
function a(...) bind(C,name=b)
...
end function
```
can only be called as *a* in a `FORTRAN` program and *b* in a `C` program

## Data Types
| FORTRAN  | Constant | C        |
|:--------:|:--------:|:--------:|
| INTEGER  | C_INT    | int      |
| INTEGER  | C_INT32_T| int32_t  |
| REAL     | C_FLOAT  | float    |
| REAL     | C_DOUBLE | double   |


An extensive overview can be found at [gcc.gnu.org](https://gcc.gnu.org/onlinedocs/gcc-4.7.4/gfortran/ISO_005fC_005fBINDING.html).

## Example I: Subroutine - Call by Reference
```fortran
subroutine a_subroutine(c_index, arr) bind(C, name="increment_at")
    use ISO_C_BINDING
    integer (C_INT), dimension(*), intent(inout) :: arr
    integer (C_INT), value :: c_index
    arr(c_index+1) = arr(c_index+1) + 1
end subroutine
```

## Example II: Funcion - Call by Value
```fortran
function a_function(input) result(output) bind(C, name="increment")
    use ISO_C_BINDING
    integer (C_INT), intent(in), VALUE :: input
    integer (C_INT)		:: output
    output = input + 1
end function
```

subroutine a_subroutine(c_index, arr) bind(C, name="increment_at")
    use ISO_C_BINDING
    integer (C_INT), dimension(*), intent(inout) :: arr
    integer (C_INT), value :: c_index
    arr(c_index+1) = arr(c_index+1) + 1
end subroutine


function a_function(input) result(output) bind(C, name="increment")
    use ISO_C_BINDING
    integer (C_INT), intent(in), VALUE :: input
    integer (C_INT)		:: output
    output = input + 1
end function

subroutine a_subroutine(c_index, arr) bind(C, name="increment_at")
    use ISO_C_BINDING
    integer (C_INT), dimension(*), intent(inout) :: arr
    integer (C_INT), value :: c_index
    arr(c_index+1) = arr(c_index+1) + 1
end subroutine


function a_function(input) result(output) bind(C, name="increment")
    use ISO_C_BINDING
    integer (C_INT), intent(in), VALUE 	:: input
    integer (C_INT)  			:: output
    output = input + 1
end function

subroutine implicit_loop_subroutine(length, arr) bind(C, name="increment_loop")
    use ISO_C_BINDING
    integer (C_INT), intent(in)				:: length
    integer (C_INT), dimension(*), intent(inout) 	:: arr
    arr(1:length) = arr(1:length) + 1
end subroutine

subroutine parallel_do_increment(length, arr) bind(C, name="increment_parallel_for")
    use ISO_C_BINDING
    integer (C_INT), intent(in)                         :: length
    integer (C_INT), dimension(*), intent(inout)        :: arr
    integer (C_INT)					:: i
! omp parallel do implicit(none) private(i) shared(arr,length)
    do i=1,length
        arr(i) = arr(i) + 1
    end do
! omp end parallel do
end subroutine

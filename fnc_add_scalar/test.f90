module test

contains
    pure function add_arr(vec) result(out)
        integer, intent(in) :: vec(:)
        integer :: out(size(vec))

        out = vec + 27;
    end function

    ! pure function add_stride(v)
    !     integer, intent(inout) :: v(10)

    !     v(1:10, 2)
    ! end function


end module
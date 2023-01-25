module test
contains
    pure function add_arr(vec) result(out)
        integer, intent(in) :: vec(3)
        integer :: out(3)

        out = vec + 27;
    end function
end module
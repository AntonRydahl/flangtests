program test

    integer :: i, m(7), o(7)
    real :: t1, t2

    m = [1, 2, 3, 4, 5, 6, 7]

    call cpu_time(t1)

    do i = 1, 1000000000
        o = add_arr_opt(m, 7)
    end do

    call cpu_time(t2)

    print *, o
    print *, (t2 - t1)

contains
    pure function add_arr(vec) result(out)
        integer, intent(in) :: vec(:)
        integer :: out(size(vec))

        out = vec + 27;
    end function
       
    pure function add_arr_opt(vec, n) result(out)
        integer, intent(in) :: n, vec(n)
        integer :: out(n)

        out = vec + 27;
    end function

end program
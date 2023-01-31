program test
    implicit none

    integer :: i, m(3, 3), val

    val = 0
    m = reshape([ (i, i=1,9) ], [3, 3]);

    do i = 1, 100000
        m(2, 2) = i
        val = val + max_sum_open(m)
    end do

    print "(I0)", val
contains
    pure integer function max_sum_open(mat)
        integer, intent(in) :: mat(:, :)
        max_sum_open = maxval(sum(mat, dim=1))
    end function

    pure integer function max_sum_3x3(mat)
        integer, intent(in) :: mat(3, 3)
        max_sum_3x3 = maxval(sum(mat, dim=1))
    end function
end program
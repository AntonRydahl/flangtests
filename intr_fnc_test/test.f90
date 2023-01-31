module test
contains
    pure integer function max_sum_open(mat)
        implicit none
        integer, intent(in) :: mat(:, :)
        max_sum_open = maxval(sum(mat, dim=1))
    end function

    pure integer function max_sum_3x3(mat)
        implicit none
        integer, intent(in) :: mat(3, 3)
        max_sum_3x3 = maxval(sum(mat, dim=1))
    end function
end module
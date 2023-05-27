program test
    implicit none

    integer :: i, mat(3, 3), s
    
    mat = 0
    s = 0

    do i = 1, 100000
        mat = 0
        mat(3, 3) = i
        mat = transpose(mat)
        s = s + sum(mat(3, :), dim=1)
    end do

    print "(I0)", s
contains

    pure function trans_open(vec) result(out)
        implicit none
        integer, intent(in) :: vec(:, :)
        integer :: out(size(vec, dim=1), size(vec, dim=2)) 
        out = transpose(vec)
    end function

    pure function trans_closed(vec) result(out)
        implicit none
        integer, intent(in) :: vec(3, 3)
        integer :: out(3, 3) 
        out = transpose(vec)
    end function

    pure function trans_manual(vec) result(out)
        implicit none
        integer, intent(in) :: vec(3, 3)
        integer :: out(3, 3) 

        out(1, :) = vec(:,1)
        out(2, :) = vec(:,2)
        out(3, :) = vec(:,3)
    end function

end program
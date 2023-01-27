program test
    implicit none
    integer :: i, j, flat(9), mat(3, 3)
    real :: t1, t2

    call cpu_time(t1)
    do j = 1, 100000
        flat = [(j + i, j = 1,9)]
        mat = resh_manual(flat)
    end do
    call cpu_time(t2)

    print '(I0)', mat(1, 1)
    print *, (t2 - t1)
contains
    ! pure function resh(vec) result(out)
    !     integer, intent(in) :: vec(9)
    !     integer :: out(3, 3) 

    !     out = reshape(vec, [3, 3])
    ! end function

    pure function resh_manual(vec) result(out)
        integer, intent(in) :: vec(9)
        integer :: out(3, 3) 

        out(1, :) = vec(1:3)
        out(2, :) = vec(4:6)
        out(3, :) = vec(7:9)
    end function
end program test
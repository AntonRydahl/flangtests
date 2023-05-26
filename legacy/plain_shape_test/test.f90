program test
    implicit none

    interface
        pure integer function special_rng(ind)
            integer, intent(in) :: ind
        end function
    end interface

    integer :: m(3, 3), i
    m = transpose(reshape([ (special_rng(i), i = 1,9) ], [3, 3]))

    print *, m

!contains

    ! pure function apply_trans(vec) result(out)
    !     integer, intent(in) :: vec(9)
    !     integer :: out(3, 3)
    !     out = transpose(reshape(vec, [3, 3]))
    ! end function
end program
module test
contains

    pure integer function mval_open(v)
        implicit none
        integer, intent(in) :: v(:)
        mval_open = maxval(v, dim=1)
    end function

    pure integer function mval_closed(v)
        implicit none
        integer, intent(in) :: v(3)
        mval_closed = maxval(v, dim=1)
    end function

end module
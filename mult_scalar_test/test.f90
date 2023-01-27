program test
    implicit none

    integer :: a(3) = [1, 2, 3]
    a = a * 5

contains

    pure function mult_scalar(vec) result(out)
        implicit none

        integer, intent(in) :: vec(:)
        integer :: out(size(vec))

        out = vec * 27
    end function
end program
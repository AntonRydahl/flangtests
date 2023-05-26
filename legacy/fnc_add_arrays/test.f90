module test
    implicit none
contains
    subroutine add_arr(a, b)
        implicit none
        integer, intent(inout) :: a(3)
        integer, intent(in) :: b(3)
        a = a + b
    end subroutine
end module
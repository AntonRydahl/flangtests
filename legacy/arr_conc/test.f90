program test
    implicit none
    
    integer :: first(6), second(7)

    first = [1, 2, 3, 4, 5, 6]
    second = [first, 7]

    print *, second;
end program

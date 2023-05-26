program test
    implicit none
    
    integer :: i, j, s, nums(3, 3)
    real :: t1, t2

    call cpu_time(t1)

    do j = 1, 10000000
        nums(1, :) = [(i * j * 2, i = 1,3)]
        nums(2, :) = [(i * j * 2, i = 4,6)]
        nums(3, :) = [(i * j * 2, i = 7,9)]
        !nums = reshape([ (i * i * 2, i = 1,9) ], [3, 3])
        !s = maxval(sum(nums, dim=1), dim=1)
    end do

    call cpu_time(t2)

    print '(I0)', nums
    print *, (t2 - t1)

end program


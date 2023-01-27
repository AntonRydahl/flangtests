program test
    implicit none

    integer :: i, j, s, nums(3, 3)

    
    do j = 1, 100000
        nums = reshape([ (i * j, i = 1,9) ], [3, 3])
        s = maxval(sum(nums, dim=1), dim=1)
    end do

    print *, size(nums)!maxval(sum(nums, dim=1), dim=1)

contains

    
    pure function resh(vec) result(out)
        integer, intent(in) :: vec(9)
        integer :: out(3, 3) 

        out = reshape(vec, [3, 3])
    end function
end program

!Benchmark 1: ./scratchpad/bbin/flangtest_bin
! ⠙ Current estimate: 7.510 s ███████████████████████████████████  Time (mean ± σ):      7.331 s ±  0.486 s    [User: 7.050 s, System: 
!0.031 s]
!  Range (min … max):    6.105 s …  7.875 s    10 runs

!Benchmark 1: ./scratchpad/bbin/gforttest_bin
!  Time (mean ± σ):     801.1 ms ±  49.1 ms    [User: 755.6 ms, System: 16.1 ms]
!  Range (min … max):   730.7 ms … 878.6 ms    10 runs
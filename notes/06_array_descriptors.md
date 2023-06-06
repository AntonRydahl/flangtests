# Minimal Reproducible Examples for Duplicate Array Descriptors in OpenMP Hot Loop
Inspired by [`./05_parallel_loop_reduction.md`](https://github.com/AntonRydahl/flangtests/tree/main/notes/05_parallel_loop_reduction.md), it was investigated when `flang-new` generates reasonably optimized code for simple OpenMP parallel for loops, and when the array desciptors occur in the optimized hot loop.

## Minimal Code Change
<table>
<tr>
<td> Example I </td> <td> Example II </td>
</tr>
<tr>
<td>

```fortran
PROGRAM array_descriptor
!-----------------------------------------------------------------------
!  Minimal reproducible example of flang-new not generating duplicate 
! array descriptors with -fopenmp -O3
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)                 :: length, i
REAL(kind=8), allocatable	    :: arr(:)
length = 1024*1024
allocate (arr(length))
! Parallel do loop
!$omp parallel do
do i=1,length
	arr(i) = 1.0/length
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of (arr(1)+arr(",length,") is ", (arr(1)+arr(length))
100 format (A,I7,A,e13.6e2)
! Deallocate Array
deallocate(arr)
END PROGRAM array_descriptor
```

</td>
<td>

```fortran
PROGRAM duplicate_array_descriptors
!-----------------------------------------------------------------------
!  Minimal reproducible example of flang-new generating duplicate array 
! descriptors with -fopenmp -O3
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)                 :: length, i
REAL(kind=8), allocatable	    :: arr(:)
REAL(kind=8)                    :: tmp
length = 1024*1024
allocate (arr(length))
! Parallel do loop
!$omp parallel do private(tmp)
do i=1,length
	arr(i) = 1.0/length
        tmp = arr(i)
!       arr(i) = 2.0*arr(i)
!       arr(i) = 0.5*arr(i)
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of (arr(1)+arr(",length,") is ", (arr(1)+arr(length))
100 format (A,I7,A,e13.6e2)
! Deallocate Array
deallocate(arr)
END PROGRAM duplicate_array_descriptors
```

</td>
</tr>
</table>

## LLVM IR

### LLVM IR From Example I (Working)
```llvm
vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = or i32 %index, 1
  %23 = add i32 %22, %3
  %24 = sext i32 %23 to i64
  %25 = add nsw i64 %24, -1
  %26 = getelementptr double, ptr %.unpack, i64 %25
  store <2 x double> %21, ptr %26, align 8, !tbaa !4, !alias.scope !13
  %index.next = add nuw i32 %index, 2
  %27 = icmp eq i32 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !15
```
In the regular `OpenMP` hot loop body, the code also seems reasonably optimized. Note that there is only a single store operation.
```llvm
omp_loop.body:                                    ; preds = %omp_loop.body.preheader, %omp_loop.body
  %omp_loop.iv33 = phi i32 [ %28, %omp_loop.body ], [ %omp_loop.iv33.ph, %omp_loop.body.preheader ]
  %28 = add nuw i32 %omp_loop.iv33, 1
  %29 = add i32 %28, %3
  %30 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %31 = sitofp i32 %30 to float
  %32 = fdiv contract float 1.000000e+00, %31
  %33 = fpext float %32 to double
  %34 = sext i32 %29 to i64
  %35 = add nsw i64 %34, -1
  %36 = getelementptr double, ptr %.unpack, i64 %35
  store double %33, ptr %36, align 8, !tbaa !4
  %exitcond.not = icmp eq i32 %omp_loop.iv33, %reass.sub
  br i1 %exitcond.not, label %omp_loop.header.omp_loop.exit_crit_edge, label %omp_loop.body, !llvm.loop !18
```
### LLVM IR From Example II (Buggy)
Ideally, the compiler should have noticed that the privatized variable `tmp` is not needed for anything. However, assuming that the expression `tmp = arr(i)` is not eliminated, there should intuitively only be two store instructions in the loop body. However, in the `OpenMP` hot loop body, we observe `21` stores that seem to be related to setting the size of the array descriptor. Again, even if it is necessary to initialize the array descritor once, the compiler should detect that the array sizes do not change between loop iterations and place this code in `%omp.par.entry`.
```llvm
omp_loop.body:                                    ; preds = %omp_loop.body.lr.ph, %omp_loop.body
  %omp_loop.iv66 = phi i32 [ 0, %omp_loop.body.lr.ph ], [ %5, %omp_loop.body ]
  %5 = add nuw i32 %omp_loop.iv66, 1
  %6 = add i32 %5, %3
  %7 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %8 = sitofp i32 %7 to float
  %9 = fdiv contract float 1.000000e+00, %8
  %10 = fpext float %9 to double
  store ptr %.unpack, ptr %loadgep_2, align 8, !tbaa !8
  store i64 8, ptr %loadgep_2.repack17, align 8, !tbaa !8
  store i32 20180515, ptr %loadgep_2.repack19, align 8, !tbaa !8
  store i8 1, ptr %loadgep_2.repack21, align 4, !tbaa !8
  store i8 28, ptr %loadgep_2.repack23, align 1, !tbaa !8
  store i8 2, ptr %loadgep_2.repack25, align 2, !tbaa !8
  store i8 0, ptr %loadgep_2.repack27, align 1, !tbaa !8
  store i64 1, ptr %loadgep_2.repack29, align 8, !tbaa !8
  store i64 %.unpack12.unpack.unpack14, ptr %loadgep_2.repack29.repack31, align 8, !tbaa !8
  store i64 8, ptr %loadgep_2.repack29.repack33, align 8, !tbaa !8
  %11 = sext i32 %6 to i64
  %12 = add nsw i64 %11, -1
  %13 = getelementptr double, ptr %.unpack, i64 %12
  store double %10, ptr %13, align 8, !tbaa !4
  store ptr %.unpack, ptr %loadgep_4, align 8, !tbaa !8
  store i64 8, ptr %loadgep_4.repack47, align 8, !tbaa !8
  store i32 20180515, ptr %loadgep_4.repack49, align 8, !tbaa !8
  store i8 1, ptr %loadgep_4.repack51, align 4, !tbaa !8
  store i8 28, ptr %loadgep_4.repack53, align 1, !tbaa !8
  store i8 2, ptr %loadgep_4.repack55, align 2, !tbaa !8
  store i8 0, ptr %loadgep_4.repack57, align 1, !tbaa !8
  store i64 1, ptr %loadgep_4.repack59, align 8, !tbaa !8
  store i64 %.unpack12.unpack.unpack14, ptr %loadgep_4.repack59.repack61, align 8, !tbaa !8
  store i64 8, ptr %loadgep_4.repack59.repack63, align 8, !tbaa !8
  %exitcond.not = icmp eq i32 %omp_loop.iv66, %reass.sub
  br i1 %exitcond.not, label %omp_loop.exit, label %omp_loop.body
```
# Minimal Reproducible Examples for Duplicate Array Descriptors in OpenMP Hot Loop
Inspired by [`./05_parallel_loop_reduction.md`](https://github.com/AntonRydahl/flangtests/tree/main/notes/05_parallel_loop_reduction.md), it was investigated when `flang-new` generates reasonably optimized code for simple OpenMP parallel for loops, and when the array desciptors occur in the optimized hot loop.

## Minimal Code Change
The only change from example one to two is the introduction of a private variable that is not used for anything except for reading the result that was just written to `arr(i)`.
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
REAL(kind=8), allocatable       :: arr(:)
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
REAL(kind=8), allocatable       :: arr(:)
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
The following two sections shows the intermediate representation resulting from compiling the two test programs with 
```bash
flang-new -fopenmp -O3 -emit-llvm -S
```
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

## Finding the Optimization Pass that Introduces the Bug
The intermediate representation was printed after all of the LLVM passes with the following command:
```bash
flang-new -O3  -fopenmp -emit-llvm -mllvm -print-after-all -S src/duplicate_array_descriptors.f90 -o ir/FC/duplicate_array_descriptors.ll &> ir/FC/duplicate_array_descriptors.ll.dump
```
By inspecting `ir/FC/duplicate_array_descriptors.ll.dump` it was found that the optimization pass `InstCombinePass` introduces a lot of stores in the hot loop.
### LLVM IR Before `InstCombinePass`
Before the optimization pass, there are a lot of unnecessary load instructions.
```llvm
omp_loop.body:                                    ; preds = %omp_loop.header
  %9 = add i32 %omp_loop.iv, %5
  %10 = add i32 %9, 1
  %11 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %12 = sitofp i32 %11 to float
  %13 = fdiv contract float 1.000000e+00, %12
  %14 = fpext float %13 to double
  %15 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, align 8, !tbaa !8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %15, ptr %loadgep_2, align 8, !tbaa !8
  %16 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i32 0, i32 7, i64 0, i32 0
  %17 = load i64, ptr %16, align 8, !tbaa !8
  %18 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i32 0, i32 7, i64 0, i32 1
  %19 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i32 0, i32 7, i64 0, i32 2
  %20 = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %21 = sext i32 %10 to i64
  %22 = sub i64 %21, %17
  %23 = getelementptr double, ptr %20, i64 %22
  store double %14, ptr %23, align 8, !tbaa !4
  %24 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, align 8, !tbaa !8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %24, ptr %loadgep_4, align 8, !tbaa !8
  %25 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 7, i64 0, i32 0
  %26 = load i64, ptr %25, align 8, !tbaa !8
  %27 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 7, i64 0, i32 1
  %28 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 7, i64 0, i32 2
  %29 = load ptr, ptr %loadgep_4, align 8, !tbaa !8
  %30 = sub i64 %21, %26
  %31 = getelementptr double, ptr %29, i64 %30
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header
```
### LLVM IR After `InstCombinePass`
After the optimization pass, there are still a lot of unneceassry load instructions, but `InstCombinePass` instroduces a lot of unnecessary store instructions which are not removed by any of the following optimization passes.
```llvm
omp_loop.body:                                    ; preds = %omp_loop.header
  %7 = add i32 %omp_loop.iv, %3
  %8 = add i32 %7, 1
  %9 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %10 = sitofp i32 %9 to float
  %11 = fdiv contract float 1.000000e+00, %10
  %12 = fpext float %11 to double
  %.unpack = load ptr, ptr @_QFEarr, align 16, !tbaa !8
  %.unpack6 = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 1), align 8, !tbaa !8
  %.unpack7 = load i32, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 2), align 16, !tbaa !8
  %.unpack8 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 3), align 4, !tbaa !8
  %.unpack9 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 4), align 1, !tbaa !8
  %.unpack10 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 5), align 2, !tbaa !8
  %.unpack11 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 6), align 1, !tbaa !8
  %.unpack12.unpack.unpack = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 7), align 8, !tbaa !8
  %.unpack12.unpack.unpack14 = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 7, i64 0, i64 1), align 16, !tbaa !8
  %.unpack12.unpack.unpack15 = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 7, i64 0, i64 2), align 8, !tbaa !8
  store ptr %.unpack, ptr %loadgep_2, align 8, !tbaa !8
  %loadgep_2.repack17 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 1
  store i64 %.unpack6, ptr %loadgep_2.repack17, align 8, !tbaa !8
  %loadgep_2.repack19 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 2
  store i32 %.unpack7, ptr %loadgep_2.repack19, align 8, !tbaa !8
  %loadgep_2.repack21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 3
  store i8 %.unpack8, ptr %loadgep_2.repack21, align 4, !tbaa !8
  %loadgep_2.repack23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 4
  store i8 %.unpack9, ptr %loadgep_2.repack23, align 1, !tbaa !8
  %loadgep_2.repack25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 5
  store i8 %.unpack10, ptr %loadgep_2.repack25, align 2, !tbaa !8
  %loadgep_2.repack27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 6
  store i8 %.unpack11, ptr %loadgep_2.repack27, align 1, !tbaa !8
  %loadgep_2.repack29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7
  store i64 %.unpack12.unpack.unpack, ptr %loadgep_2.repack29, align 8, !tbaa !8
  %loadgep_2.repack29.repack31 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 1
  store i64 %.unpack12.unpack.unpack14, ptr %loadgep_2.repack29.repack31, align 8, !tbaa !8
  %loadgep_2.repack29.repack33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 2
  store i64 %.unpack12.unpack.unpack15, ptr %loadgep_2.repack29.repack33, align 8, !tbaa !8
  %13 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 0
  %14 = load i64, ptr %13, align 8, !tbaa !8
  %15 = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %16 = sext i32 %8 to i64
  %17 = sub i64 %16, %14
  %18 = getelementptr double, ptr %15, i64 %17
  store double %12, ptr %18, align 8, !tbaa !4
  %.unpack35 = load ptr, ptr @_QFEarr, align 16, !tbaa !8
  %.unpack36 = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 1), align 8, !tbaa !8
  %.unpack37 = load i32, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 2), align 16, !tbaa !8
  %.unpack38 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 3), align 4, !tbaa !8
  %.unpack39 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 4), align 1, !tbaa !8
  %.unpack40 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 5), align 2, !tbaa !8
  %.unpack41 = load i8, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 6), align 1, !tbaa !8
  %.unpack42.unpack.unpack = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 7), align 8, !tbaa !8
  %.unpack42.unpack.unpack44 = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 7, i64 0, i64 1), align 16, !tbaa !8
  %.unpack42.unpack.unpack45 = load i64, ptr getelementptr inbounds ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, i64 0, i32 7, i64 0, i64 2), align 8, !tbaa !8
  store ptr %.unpack35, ptr %loadgep_4, align 8, !tbaa !8
  %loadgep_4.repack47 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 1
  store i64 %.unpack36, ptr %loadgep_4.repack47, align 8, !tbaa !8
  %loadgep_4.repack49 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 2
  store i32 %.unpack37, ptr %loadgep_4.repack49, align 8, !tbaa !8
  %loadgep_4.repack51 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 3
  store i8 %.unpack38, ptr %loadgep_4.repack51, align 4, !tbaa !8
  %loadgep_4.repack53 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 4
  store i8 %.unpack39, ptr %loadgep_4.repack53, align 1, !tbaa !8
  %loadgep_4.repack55 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 5
  store i8 %.unpack40, ptr %loadgep_4.repack55, align 2, !tbaa !8
  %loadgep_4.repack57 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 6
  store i8 %.unpack41, ptr %loadgep_4.repack57, align 1, !tbaa !8
  %loadgep_4.repack59 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7
  store i64 %.unpack42.unpack.unpack, ptr %loadgep_4.repack59, align 8, !tbaa !8
  %loadgep_4.repack59.repack61 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 1
  store i64 %.unpack42.unpack.unpack44, ptr %loadgep_4.repack59.repack61, align 8, !tbaa !8
  %loadgep_4.repack59.repack63 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 2
  store i64 %.unpack42.unpack.unpack45, ptr %loadgep_4.repack59.repack63, align 8, !tbaa !8
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header
```
# Parallel For / Parallel Do Loops
## `clang` Program

```C
#include <stdio.h>
#include <stdlib.h>
int main(void) {
	const int length = 1024*1024;
	double * arr = (double *) malloc(length*sizeof(double));
	#pragma omp parallel for
	for(int i = 0; i < length; i++) arr[i] = ((double) i)/length;
	printf("The result of arr[0] + arr[%d] is %1.9lf\n",length-1,arr[0] + arr[length-1]);
	free(arr);
	return 0;
}
```

### `clang` Without `-fopenmp`
```llvmir
; ModuleID = 'src/parallel_loop.c'
source_filename = "src/parallel_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [42 x i8] c"The result of arr[0] + arr[%d] is %1.9lf\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %length = alloca i32, align 4
  %arr = alloca ptr, align 8
  %i = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 1048576, ptr %length, align 4
  ; Allocating array
  %call = call noalias ptr @malloc(i64 noundef 8388608) #4
  store ptr %call, ptr %arr, align 8
  ; Initializing loop counter to 0
  store i32 0, ptr %i, align 4
  ; Start for loop
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  ; If loop counter is strictly smaller than bound, go to body, else, go to end
  %cmp = icmp slt i32 %0, 1048576
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  ; Load the value of the loop counter
  %1 = load i32, ptr %i, align 4
  ; Convert loop counter from int to double (signed integer to floatingpoint)
  %conv = sitofp i32 %1 to double
  ; Divide converted loop counter by loop bound
  %div = fdiv double %conv, 0x4130000000000000
  ; Load result and loop counter
  %2 = load ptr, ptr %arr, align 8
  %3 = load i32, ptr %i, align 4
  ; Extend integer index to pointer
  %idxprom = sext i32 %3 to i64
  ; Load the address to write result to
  %arrayidx = getelementptr inbounds double, ptr %2, i64 %idxprom
  ; Store the result
  store double %div, ptr %arrayidx, align 8
  ; Go to increment
  br label %for.inc

for.inc:                                          ; preds = %for.body
  ; increment loop counter by one
  %4 = load i32, ptr %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  ; Load first element of array
  %5 = load ptr, ptr %arr, align 8
  %arrayidx1 = getelementptr inbounds double, ptr %5, i64 0
  %6 = load double, ptr %arrayidx1, align 8
  ; Load last element of array
  %7 = load ptr, ptr %arr, align 8
  %arrayidx2 = getelementptr inbounds double, ptr %7, i64 1048575
  %8 = load double, ptr %arrayidx2, align 8
  ; Add the first and last elements and print result
  %add = fadd double %6, %8
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 1048575, double noundef %add)
  ; Free the allocated array
  %9 = load ptr, ptr %arr, align 8
  call void @free(ptr noundef %9) #5
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare dso_local noalias ptr @malloc(i64 noundef) #1

declare dso_local i32 @printf(ptr noundef, ...) #2
```

### `clang` - Loop Compiled With `-fopenmp`
```llvmir
; Function Attrs: nounwind
declare dso_local void @free(ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2e4e218474320abf480c39d3b968a5a09477ad03)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
; ModuleID = 'src/parallel_loop.c'
source_filename = "src/parallel_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.str = private unnamed_addr constant [42 x i8] c"The result of arr[0] + arr[%d] is %1.9lf\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %length = alloca i32, align 4
  %arr = alloca ptr, align 8
  store i32 0, ptr %retval, align 4
  store i32 1048576, ptr %length, align 4
  %call = call noalias ptr @malloc(i64 noundef 8388608) #6
  store ptr %call, ptr %arr, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 2, ptr @main.omp_outlined, ptr %length, ptr %arr)
  %0 = load ptr, ptr %arr, align 8
  %arrayidx = getelementptr inbounds double, ptr %0, i64 0
  %1 = load double, ptr %arrayidx, align 8
  %2 = load ptr, ptr %arr, align 8
  %arrayidx1 = getelementptr inbounds double, ptr %2, i64 1048575
  %3 = load double, ptr %arrayidx1, align 8
  %add = fadd double %1, %3
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 1048575, double noundef %add)
  %4 = load ptr, ptr %arr, align 8
  call void @free(ptr noundef %4) #3
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @main.omp_outlined(ptr noalias noundef %.global_tid., ptr noalias noundef %.bound_tid., ptr noundef nonnull align 4 dereferenceable(4) %length, ptr noundef nonnull align 8 dereferenceable(8) %arr) #2 {
entry:
  %.global_tid..addr = alloca ptr, align 8
  %.bound_tid..addr = alloca ptr, align 8
  %length.addr = alloca ptr, align 8
  %arr.addr = alloca ptr, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %.global_tid., ptr %.global_tid..addr, align 8
  store ptr %.bound_tid., ptr %.bound_tid..addr, align 8
  store ptr %length, ptr %length.addr, align 8
  store ptr %arr, ptr %arr.addr, align 8
  %0 = load ptr, ptr %length.addr, align 8
  %1 = load ptr, ptr %arr.addr, align 8
  store i32 0, ptr %.omp.lb, align 4
  store i32 1048575, ptr %.omp.ub, align 4
  store i32 1, ptr %.omp.stride, align 4
  store i32 0, ptr %.omp.is_last, align 4
  %2 = load ptr, ptr %.global_tid..addr, align 8
  %3 = load i32, ptr %2, align 4
  call void @__kmpc_for_static_init_4(ptr @1, i32 %3, i32 34, ptr %.omp.is_last, ptr %.omp.lb, ptr %.omp.ub, ptr %.omp.stride, i32 1, i32 1)
  %4 = load i32, ptr %.omp.ub, align 4
  %cmp = icmp sgt i32 %4, 1048575
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load i32, ptr %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1048575, %cond.true ], [ %5, %cond.false ]
  store i32 %cond, ptr %.omp.ub, align 4
  %6 = load i32, ptr %.omp.lb, align 4
  store i32 %6, ptr %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %7 = load i32, ptr %.omp.iv, align 4
  %8 = load i32, ptr %.omp.ub, align 4
  %cmp1 = icmp sle i32 %7, %8
  br i1 %cmp1, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %9 = load i32, ptr %.omp.iv, align 4
  %mul = mul nsw i32 %9, 1
  %add = add nsw i32 0, %mul
  store i32 %add, ptr %i, align 4
  %10 = load i32, ptr %i, align 4
  %conv = sitofp i32 %10 to double
  %div = fdiv double %conv, 0x4130000000000000
  %11 = load ptr, ptr %1, align 8
  %12 = load i32, ptr %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds double, ptr %11, i64 %idxprom
  store double %div, ptr %arrayidx, align 8
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %13 = load i32, ptr %.omp.iv, align 4
  %add2 = add nsw i32 %13, 1
  store i32 %add2, ptr %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(ptr @1, i32 %3)
  ret void
}

declare void @__kmpc_for_static_init_4(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #3

; Function Attrs: nounwind
declare !callback !7 void @__kmpc_fork_call(ptr, i32, ptr, ...) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 50}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2e4e218474320abf480c39d3b968a5a09477ad03)"}
!7 = !{!8}
!8 = !{i64 2, i64 -1, i64 -1, i1 true}
```

## `FORTRAN` Program
```FORTRAN
PROGRAM parallel_loop
!-----------------------------------------------------------------------
!  This program is used to test wheter flang eliminates unused variables
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)                         :: length, i
REAL(kind=8), allocatable	:: arr(:)
length = 1024*1024
allocate (arr(length))
! Parallel do loop
!$omp parallel do
do i=1,length
	arr(i) = REAL(i-1,kind=8)/length
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of arr(1) = arr(",length,") is ", (arr(1) + arr(length))
100 format (A,I7,A,F10.9)
! Deallocate Array
deallocate(arr)
END PROGRAM parallel_loop
```

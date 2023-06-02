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
INTEGER(kind=4)                 :: length, i
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

## Comparison of Code Compiled with `-fopenmp -O3`
### Code Generated with `clang`
```llvmir
; ModuleID = 'src/parallel_loop.c'
source_filename = "src/parallel_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [42 x i8] c"The result of arr[0] + arr[%d] is %1.9lf\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <2 x i32> [ <i32 0, i32 1>, %entry ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <2 x i32> %vec.ind, <i32 2, i32 2>
  %0 = sitofp <2 x i32> %vec.ind to <2 x double>
  %1 = sitofp <2 x i32> %step.add to <2 x double>
  %2 = fmul <2 x double> %0, <double 0x3EB0000000000000, double 0x3EB0000000000000>
  %3 = fmul <2 x double> %1, <double 0x3EB0000000000000, double 0x3EB0000000000000>
  %4 = getelementptr inbounds double, ptr %call, i64 %index
  store <2 x double> %2, ptr %4, align 8, !tbaa !3
  %5 = getelementptr inbounds double, ptr %4, i64 2
  store <2 x double> %3, ptr %5, align 8, !tbaa !3
  %index.next = or i64 %index, 4
  %vec.ind.next = add <2 x i32> %vec.ind, <i32 4, i32 4>
  %step.add.1 = add <2 x i32> %vec.ind, <i32 6, i32 6>
  %6 = sitofp <2 x i32> %vec.ind.next to <2 x double>
  %7 = sitofp <2 x i32> %step.add.1 to <2 x double>
  %8 = fmul <2 x double> %6, <double 0x3EB0000000000000, double 0x3EB0000000000000>
  %9 = fmul <2 x double> %7, <double 0x3EB0000000000000, double 0x3EB0000000000000>
  %10 = getelementptr inbounds double, ptr %call, i64 %index.next
  store <2 x double> %8, ptr %10, align 8, !tbaa !3
  %11 = getelementptr inbounds double, ptr %10, i64 2
  store <2 x double> %9, ptr %11, align 8, !tbaa !3
  %index.next.1 = add nuw nsw i64 %index, 8
  %vec.ind.next.1 = add <2 x i32> %vec.ind, <i32 8, i32 8>
  %12 = icmp eq i64 %index.next.1, 1048576
  br i1 %12, label %for.cond.cleanup, label %vector.body, !llvm.loop !7

for.cond.cleanup:                                 ; preds = %vector.body
  %13 = load double, ptr %call, align 8, !tbaa !3
  %arrayidx2 = getelementptr inbounds double, ptr %call, i64 1048575
  %14 = load double, ptr %arrayidx2, align 8, !tbaa !3
  %add = fadd double %13, %14
  %call3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1048575, double noundef %add)
  tail call void @free(ptr noundef nonnull %call) #5
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr nocapture noundef) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2e4e218474320abf480c39d3b968a5a09477ad03)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9, !10}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
```

### Code Generated with `flang-new`
```llvmir
; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEarr.0 = internal unnamed_addr global ptr null
@_QQcl.412af3a0d982698e911d95b829b2040f = internal constant [48 x i8] c"/g/g92/rydahl1/flangtests/src/parallel_loop.f90\00"
@_QQcl.28612C69372C612C6631302E3929 = internal constant [14 x i8] c"(a,i7,a,f10.9)"
@_QQcl.54686520726573756C74206F6620617272283129203D2061727228 = internal constant [27 x i8] c"The result of arr(1) = arr("
@_QQcl.2920697320 = internal constant [5 x i8] c") is "
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
vector.ph:
  %0 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %0, ptr @_QFEarr.0, align 8, !tbaa !1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = or i64 %index, 1
  %2 = insertelement <2 x i64> poison, i64 %index, i64 0
  %3 = insertelement <2 x i64> %2, i64 %1, i64 1
  %4 = or i64 %index, 2
  %5 = or i64 %index, 3
  %6 = insertelement <2 x i64> poison, i64 %4, i64 0
  %7 = insertelement <2 x i64> %6, i64 %5, i64 1
  %8 = trunc <2 x i64> %3 to <2 x i32>
  %9 = trunc <2 x i64> %7 to <2 x i32>
  %10 = sitofp <2 x i32> %8 to <2 x double>
  %11 = sitofp <2 x i32> %9 to <2 x double>
  %12 = fmul contract <2 x double> %10, <double 0x3EB0000000000000, double 0x3EB0000000000000>
  %13 = fmul contract <2 x double> %11, <double 0x3EB0000000000000, double 0x3EB0000000000000>
  %14 = getelementptr double, ptr %0, i64 %index
  store <2 x double> %12, ptr %14, align 8, !tbaa !5
  %15 = getelementptr double, ptr %14, i64 2
  store <2 x double> %13, ptr %15, align 8, !tbaa !5
  %index.next = add nuw i64 %index, 4
  %16 = icmp eq i64 %index.next, 1048576
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %17 = tail call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6631302E3929, i64 14, ptr null, i32 -1, ptr nonnull @_QQcl.412af3a0d982698e911d95b829b2040f, i32 18)
  %18 = tail call i1 @_FortranAioOutputAscii(ptr %17, ptr nonnull @_QQcl.54686520726573756C74206F6620617272283129203D2061727228, i64 27)
  %19 = tail call i1 @_FortranAioOutputInteger32(ptr %17, i32 1048576)
  %20 = tail call i1 @_FortranAioOutputAscii(ptr %17, ptr nonnull @_QQcl.2920697320, i64 5)
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !1
  %21 = load double, ptr %.unpack, align 8, !tbaa !5
  %22 = getelementptr double, ptr %.unpack, i64 1048575
  %23 = load double, ptr %22, align 8, !tbaa !5
  %24 = fadd contract double %21, %23
  %25 = tail call i1 @_FortranAioOutputReal64(ptr %17, double %24)
  %26 = tail call i32 @_FortranAioEndIoStatement(ptr %17)
  %.unpack121 = load ptr, ptr @_QFEarr.0, align 8, !tbaa !1
  tail call void @free(ptr %.unpack121)
  store ptr null, ptr @_QFEarr.0, align 8, !tbaa !1
  ret void
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputReal64(ptr, double) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2, !2, i64 0}
!2 = !{!"descriptor member", !3, i64 0}
!3 = !{!"any access", !4, i64 0}
!4 = !{!"Flang Type TBAA Root"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any data access", !3, i64 0}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
```

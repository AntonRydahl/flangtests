# OpenMP Parallel For/Do Reductions in `clang` ad `flang-new`

## `C` Program
```C
#include <stdio.h>
#include <stdlib.h>
int main(void) {
        const int length = 1024*1024;
        double * arr = (double *) malloc(length*sizeof(double));
        double sum = 0.0;
        #pragma omp parallel for reduction(+:sum)
        for(int i = 0; i < length; i++) {
                arr[i] = 1.0/length;
                sum += arr[i];
        }
	printf("The result of sum(arr[0:%d]) is %1.9lf\n",length-1,sum);
        free(arr);
        return 0;
}
```
### `clang -fopenmp -O0`
```llvm
; ModuleID = 'src/loop_reduction.c'
source_filename = "src/loop_reduction.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.str = private unnamed_addr constant [40 x i8] c"The result of sum(arr[0:%d]) is %1.9lf\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %length = alloca i32, align 4
  %arr = alloca ptr, align 8
  %sum = alloca double, align 8
  store i32 0, ptr %retval, align 4
  store i32 1048576, ptr %length, align 4
  %call = call noalias ptr @malloc(i64 noundef 8388608) #8
  store ptr %call, ptr %arr, align 8
  store double 0.000000e+00, ptr %sum, align 8
```
`__kmpc_fork_call()` calls the outlined region `main.omp_outlined`:
```llvm
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @3, i32 3, ptr @main.omp_outlined, ptr %length, ptr %arr, ptr %sum)
  %0 = load double, ptr %sum, align 8
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 1048575, double noundef %0)
  %1 = load ptr, ptr %arr, align 8
  call void @free(ptr noundef %1) #3
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline norecurse nounwind optnone
define internal void @main.omp_outlined(ptr noalias noundef %.global_tid., ptr noalias noundef %.bound_tid., ptr noundef nonnull align 4 dereferenceable(4) %length, ptr noundef nonnull align 8 dereferenceable(8) %arr, ptr noundef nonnull align 8 dereferenceable(8) %sum) #2 {
entry:
  %.global_tid..addr = alloca ptr, align 8
  %.bound_tid..addr = alloca ptr, align 8
  %length.addr = alloca ptr, align 8
  %arr.addr = alloca ptr, align 8
  %sum.addr = alloca ptr, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %sum1 = alloca double, align 8
  %i = alloca i32, align 4
  %.omp.reduction.red_list = alloca [1 x ptr], align 8
  store ptr %.global_tid., ptr %.global_tid..addr, align 8
  store ptr %.bound_tid., ptr %.bound_tid..addr, align 8
  store ptr %length, ptr %length.addr, align 8
  store ptr %arr, ptr %arr.addr, align 8
  store ptr %sum, ptr %sum.addr, align 8
  %0 = load ptr, ptr %length.addr, align 8
  %1 = load ptr, ptr %arr.addr, align 8
  %2 = load ptr, ptr %sum.addr, align 8
  store i32 0, ptr %.omp.lb, align 4
  store i32 1048575, ptr %.omp.ub, align 4
  store i32 1, ptr %.omp.stride, align 4
  store i32 0, ptr %.omp.is_last, align 4
  store double 0.000000e+00, ptr %sum1, align 8
  %3 = load ptr, ptr %.global_tid..addr, align 8
  %4 = load i32, ptr %3, align 4
```
`__kmp_for_static_init()` computes one set of iteration bounds. In this case, static means that the number of iterations are decided at compile time. With dynamic scheduling, it would have been `__kmp_dispatch_next`.
```llvm
  call void @__kmpc_for_static_init_4(ptr @1, i32 %4, i32 34, ptr %.omp.is_last, ptr %.omp.lb, ptr %.omp.ub, ptr %.omp.stride, i32 1, i32 1)
```
If the upper bound is outside of the loop iteration bound, the thread will go to label `cond.end`.
```llvm
  %5 = load i32, ptr %.omp.ub, align 4
  %cmp = icmp sgt i32 %5, 1048575
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32, ptr %.omp.ub, align 4
  br label %cond.end
```
The phi instruction selects a value based on the predecessor of the current block. If the thread came from `cond.true`, the global upper bound is set used as the upper bound. Otherwise, the local upper bound computed with `__kmp_for static_init_4()` is used.
```llvm
cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1048575, %cond.true ], [ %6, %cond.false ]
  store i32 %cond, ptr %.omp.ub, align 4
  %7 = load i32, ptr %.omp.lb, align 4
  store i32 %7, ptr %.omp.iv, align 4
  br label %omp.inner.for.cond
```
If the loop counter is smaller than or equal to the thread's upper bound, the loop iteration is reiterated. Else, the thread goes to `%omp.inner.for.end` and thereby `%omp.loop.exit`.
```llvm
omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %8 = load i32, ptr %.omp.iv, align 4
  %9 = load i32, ptr %.omp.ub, align 4
  %cmp2 = icmp sle i32 %8, %9
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %10 = load i32, ptr %.omp.iv, align 4
  %mul = mul nsw i32 %10, 1
  %add = add nsw i32 0, %mul
  store i32 %add, ptr %i, align 4
  %11 = load ptr, ptr %1, align 8
```
The loopcounter `i` is extended to a 64 bit integer. Then the the index `%idxprom3` is added to the address of the array, `%13`, which contains the base pointer for the array, `%1`.
```llvm
  %12 = load i32, ptr %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds double, ptr %11, i64 %idxprom
  store double 0x3EB0000000000000, ptr %arrayidx, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %14 to i64
  %arrayidx4 = getelementptr inbounds double, ptr %13, i64 %idxprom3
```
The value of the loop iteration is added to the local version of `sum`, `sum1`.
```llvm
  %15 = load double, ptr %arrayidx4, align 8
  %16 = load double, ptr %sum1, align 8
  %add5 = fadd double %16, %15
  store double %add5, ptr %sum1, align 8
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %17 = load i32, ptr %.omp.iv, align 4
  %add6 = add nsw i32 %17, 1
  store i32 %add6, ptr %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit
```
In `%omp.loop.exit` the thread local sums are added together into the global reduction.
```llvm
omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(ptr @1, i32 %4)
  %18 = getelementptr inbounds [1 x ptr], ptr %.omp.reduction.red_list, i64 0, i64 0
  store ptr %sum1, ptr %18, align 8
```
Depending on the output from `__kmpc_reduce_nowait()` stored in `%19`, the thread private result is added to the global sum with atomics in label `omp.reduction.case2`.
```llvm
  %19 = call i32 @__kmpc_reduce_nowait(ptr @2, i32 %4, i32 1, i64 8, ptr %.omp.reduction.red_list, ptr @main.omp_outlined.omp.reduction.reduction_func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %19, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ]

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %20 = load double, ptr %2, align 8
  %21 = load double, ptr %sum1, align 8
  %add7 = fadd double %20, %21
  store double %add7, ptr %2, align 8
  call void @__kmpc_end_reduce_nowait(ptr @2, i32 %4, ptr @.gomp_critical_user_.reduction.var)
  br label %.omp.reduction.default

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %22 = load double, ptr %sum1, align 8
  %23 = atomicrmw fadd ptr %2, double %22 monotonic, align 8
  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  ret void
} ; EXITS OMP OUTLINED

declare void @__kmpc_for_static_init_4(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #3

; Function Attrs: noinline norecurse nounwind
define internal void @main.omp_outlined.omp.reduction.reduction_func(ptr noundef %0, ptr noundef %1) #4 {
entry:
  %.addr = alloca ptr, align 8
  %.addr1 = alloca ptr, align 8
  store ptr %0, ptr %.addr, align 8
  store ptr %1, ptr %.addr1, align 8
  %2 = load ptr, ptr %.addr, align 8
  %3 = load ptr, ptr %.addr1, align 8
  %4 = getelementptr inbounds [1 x ptr], ptr %3, i64 0, i64 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds [1 x ptr], ptr %2, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load double, ptr %7, align 8
  %9 = load double, ptr %5, align 8
  %add = fadd double %8, %9
  store double %add, ptr %7, align 8
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce_nowait(ptr, i32, i32, i64, ptr, ptr, ptr) #5

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce_nowait(ptr, i32, ptr) #5

; Function Attrs: nounwind
declare !callback !6 void @__kmpc_fork_call(ptr, i32, ptr, ...) #3

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: nounwind
declare void @free(ptr noundef) #7

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { noinline norecurse nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { convergent nounwind }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 50}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2e4e218474320abf480c39d3b968a5a09477ad03)"}
!6 = !{!7}
!7 = !{i64 2, i64 -1, i64 -1, i1 true}
```

### `clang -fopenmp -O3`
```
; ModuleID = 'src/loop_reduction.c'
source_filename = "src/loop_reduction.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.str = private unnamed_addr constant [40 x i8] c"The result of sum(arr[0:%d]) is %1.9lf\0A\00", align 1

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %length = alloca i32, align 4
  %arr = alloca ptr, align 8
  %sum = alloca double, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %length) #4
  store i32 1048576, ptr %length, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %arr) #4
  %call = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #10
  store ptr %call, ptr %arr, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %sum) #4
  store double 0.000000e+00, ptr %sum, align 8, !tbaa !11
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @3, i32 3, ptr nonnull @main.omp_outlined, ptr nonnull %length, ptr nonnull %arr, ptr nonnull %sum)
  %0 = load double, ptr %sum, align 8, !tbaa !11
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1048575, double noundef %0)
  %1 = load ptr, ptr %arr, align 8, !tbaa !9
  call void @free(ptr noundef %1) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %sum) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %arr) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %length) #4
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: alwaysinline norecurse nounwind
define internal void @main.omp_outlined(ptr noalias nocapture noundef readonly %.global_tid., ptr noalias nocapture readnone %.bound_tid., ptr nocapture nonnull readnone align 4 %length, ptr nocapture noundef nonnull readonly align 8 dereferenceable(8) %arr, ptr nocapture noundef nonnull align 8 dereferenceable(8) %sum) #3 {
entry:
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %sum1 = alloca double, align 8
  %.omp.reduction.red_list = alloca [1 x ptr], align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %.omp.lb) #4
  store i32 0, ptr %.omp.lb, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %.omp.ub) #4
  store i32 1048575, ptr %.omp.ub, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %.omp.stride) #4
  store i32 1, ptr %.omp.stride, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %.omp.is_last) #4
  store i32 0, ptr %.omp.is_last, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %sum1) #4
  store double 0.000000e+00, ptr %sum1, align 8, !tbaa !11
  %0 = load i32, ptr %.global_tid., align 4, !tbaa !5
  call void @__kmpc_for_static_init_4(ptr nonnull @1, i32 %0, i32 34, ptr nonnull %.omp.is_last, ptr nonnull %.omp.lb, ptr nonnull %.omp.ub, ptr nonnull %.omp.stride, i32 1, i32 1)
  %1 = load i32, ptr %.omp.ub, align 4
  %cond = call i32 @llvm.smin.i32(i32 %1, i32 1048575)
  store i32 %cond, ptr %.omp.ub, align 4, !tbaa !5
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !5
  %cmp2.not11 = icmp slt i32 %cond, %2
  br i1 %cmp2.not11, label %omp.loop.exit, label %omp.inner.for.body.lr.ph

omp.inner.for.body.lr.ph:                         ; preds = %entry
  %3 = load ptr, ptr %arr, align 8, !tbaa !9
  %4 = sext i32 %2 to i64
  %5 = add nsw i32 %cond, 1
  %6 = add nsw i32 %cond, 1
  %7 = sub i32 %6, %2
  %8 = sub i32 %cond, %2
  %xtraiter = and i32 %7, 3
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %omp.inner.for.body.prol.loopexit, label %omp.inner.for.body.prol

omp.inner.for.body.prol:                          ; preds = %omp.inner.for.body.lr.ph, %omp.inner.for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %omp.inner.for.body.prol ], [ %4, %omp.inner.for.body.lr.ph ]
  %prol.iter = phi i32 [ %prol.iter.next, %omp.inner.for.body.prol ], [ 0, %omp.inner.for.body.lr.ph ]
  %arrayidx.prol = getelementptr inbounds double, ptr %3, i64 %indvars.iv.prol
  store double 0x3EB0000000000000, ptr %arrayidx.prol, align 8, !tbaa !11
  %9 = load double, ptr %sum1, align 8, !tbaa !11
  %add5.prol = fadd double %9, 0x3EB0000000000000
  store double %add5.prol, ptr %sum1, align 8, !tbaa !11
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1
  %prol.iter.next = add i32 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i32 %prol.iter.next, %xtraiter
  br i1 %prol.iter.cmp.not, label %omp.inner.for.body.prol.loopexit, label %omp.inner.for.body.prol, !llvm.loop !13

omp.inner.for.body.prol.loopexit:                 ; preds = %omp.inner.for.body.prol, %omp.inner.for.body.lr.ph
  %indvars.iv.unr = phi i64 [ %4, %omp.inner.for.body.lr.ph ], [ %indvars.iv.next.prol, %omp.inner.for.body.prol ]
  %10 = icmp ult i32 %8, 3
  br i1 %10, label %omp.loop.exit, label %omp.inner.for.body
```
Constant propagation has been carried out. Note that `0x3EB0000000000000` in hexadecimal is `9.5367431640625e-7` in decimal, and that `1024*1024*9.5367431640625e-7=1.0`. Further, loop unrolling has been appplied such that four elements are handled per iteration.
```llvm
omp.inner.for.body:                               ; preds = %omp.inner.for.body.prol.loopexit, %omp.inner.for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %omp.inner.for.body ], [ %indvars.iv.unr, %omp.inner.for.body.prol.loopexit ]
  %arrayidx = getelementptr inbounds double, ptr %3, i64 %indvars.iv
  store double 0x3EB0000000000000, ptr %arrayidx, align 8, !tbaa !11
  %11 = load double, ptr %sum1, align 8, !tbaa !11
  %add5 = fadd double %11, 0x3EB0000000000000
  store double %add5, ptr %sum1, align 8, !tbaa !11
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds double, ptr %3, i64 %indvars.iv.next
  store double 0x3EB0000000000000, ptr %arrayidx.1, align 8, !tbaa !11
  %12 = load double, ptr %sum1, align 8, !tbaa !11
  %add5.1 = fadd double %12, 0x3EB0000000000000
  store double %add5.1, ptr %sum1, align 8, !tbaa !11
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds double, ptr %3, i64 %indvars.iv.next.1
  store double 0x3EB0000000000000, ptr %arrayidx.2, align 8, !tbaa !11
  %13 = load double, ptr %sum1, align 8, !tbaa !11
  %add5.2 = fadd double %13, 0x3EB0000000000000
  store double %add5.2, ptr %sum1, align 8, !tbaa !11
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds double, ptr %3, i64 %indvars.iv.next.2
  store double 0x3EB0000000000000, ptr %arrayidx.3, align 8, !tbaa !11
  %14 = load double, ptr %sum1, align 8, !tbaa !11
  %add5.3 = fadd double %14, 0x3EB0000000000000
  store double %add5.3, ptr %sum1, align 8, !tbaa !11
```
Due to vectorization, the loop counter is incremented by four.
```  
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.3 to i32
  %exitcond.not.3 = icmp eq i32 %5, %lftr.wideiv.3
  br i1 %exitcond.not.3, label %omp.loop.exit, label %omp.inner.for.body

omp.loop.exit:                                    ; preds = %omp.inner.for.body.prol.loopexit, %omp.inner.for.body, %entry
  call void @__kmpc_for_static_fini(ptr nonnull @1, i32 %0)
  store ptr %sum1, ptr %.omp.reduction.red_list, align 8
  %15 = call i32 @__kmpc_reduce_nowait(ptr nonnull @2, i32 %0, i32 1, i64 8, ptr nonnull %.omp.reduction.red_list, ptr nonnull @main.omp_outlined.omp.reduction.reduction_func, ptr nonnull @.gomp_critical_user_.reduction.var)
  switch i32 %15, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ]

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %16 = load double, ptr %sum, align 8, !tbaa !11
  %17 = load double, ptr %sum1, align 8, !tbaa !11
  %add7 = fadd double %16, %17
  store double %add7, ptr %sum, align 8, !tbaa !11
  call void @__kmpc_end_reduce_nowait(ptr nonnull @2, i32 %0, ptr nonnull @.gomp_critical_user_.reduction.var)
  br label %.omp.reduction.default

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %18 = load double, ptr %sum1, align 8, !tbaa !11
  %19 = atomicrmw fadd ptr %sum, double %18 monotonic, align 8
  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %sum1) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %.omp.is_last) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %.omp.stride) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %.omp.ub) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %.omp.lb) #4
  ret void
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define internal void @main.omp_outlined.omp.reduction.reduction_func(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) #5 {
entry:
  %2 = load ptr, ptr %1, align 8
  %3 = load ptr, ptr %0, align 8
  %4 = load double, ptr %3, align 8, !tbaa !11
  %5 = load double, ptr %2, align 8, !tbaa !11
  %add = fadd double %4, %5
  store double %add, ptr %3, align 8, !tbaa !11
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce_nowait(ptr, i32, i32, i64, ptr, ptr, ptr) local_unnamed_addr #6

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce_nowait(ptr, i32, ptr) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind
declare !callback !15 void @__kmpc_fork_call(ptr, i32, ptr, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #9

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { alwaysinline norecurse nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { convergent nounwind }
attributes #7 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 50}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2e4e218474320abf480c39d3b968a5a09477ad03)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !7, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !7, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16}
!16 = !{i64 2, i64 -1, i64 -1, i1 true}
```

## `FORTRAN` Program
```FORTRAN

PROGRAM parallel_loop
!-----------------------------------------------------------------------
!  This program is used to test wheter flang eliminates unused variables
!-----------------------------------------------------------------------
IMPLICIT NONE
! Declare local variables
INTEGER(kind=4)			:: length, i
REAL(kind=8), allocatable 	:: arr(:)
REAL(kind=8)			:: sumval
length = 1024*1024
allocate (arr(length))
sumval = 0.0
! Parallel do loop
!$omp parallel do reduction(+:sumval)
do i=1,length
	arr(i) = 1.0/length
	sumval = sumval + arr(i)
end do
!$omp end parallel do
! Write the result
write(*,100) "The result of sum(arr(1:",length,")) is ", sumval
100 format (A,I7,A,e13.6e2)
!write (*,*), sumval
! Deallocate Array
deallocate(arr)
END PROGRAM parallel_loop
```

### `flang -fopenmp -O0`
```llvm

; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QFEarr = internal global { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 28, i8 2, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64)]] }
@_QQcl.1c24fad2427fba85941c2f07b505b42a = internal constant [49 x i8] c"/g/g92/rydahl1/flangtests/src/loop_reduction.f90\00"
@_QQcl.28612C69372C612C6531332E36653229 = internal constant [16 x i8] c"(a,i7,a,e13.6e2)"
@_QQcl.54686520726573756C74206F662073756D2861727228313A = internal constant [24 x i8] c"The result of sum(arr(1:"
@_QQcl.292920697320 = internal constant [6 x i8] c")) is "
@_QQEnvironmentDefaults = constant ptr null
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 4

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %structArg = alloca { ptr, ptr, ptr, ptr }, align 8
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %6 = alloca i32, i64 1, align 4
  %7 = alloca i32, i64 1, align 4
  %8 = alloca double, i64 1, align 8
  store i32 1048576, ptr %7, align 4
  %9 = load i32, ptr %7, align 4
  %10 = sext i32 %9 to i64
```
Verifying that the array length is a non-negative number.
```llvm
  %11 = icmp sgt i64 %10, 0
  %12 = select i1 %11, i64 %10, i64 0
```
Allocating array with `malloc`. `ptrtoint` and `inttoptr` are used because non-integral pointers are used. 
```llvm
  %13 = mul i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), %12
  %14 = call ptr @malloc(i64 %13)
  %15 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 28, i8 2, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 undef, i64 undef]] }, i64 %12, 7, 0, 1
  %16 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %15, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), 7, 0, 2
  %17 = mul i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), %12
  %18 = mul i64 1, %12
  %19 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %16, ptr %14, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %19, ptr %5, align 8
  %20 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %20, ptr @_QFEarr, align 8
```
Initializing the result to 0
```llvm
  store double 0.000000e+00, ptr %8, align 8
  br label %entry
```
The inititial thread gets its global thread number before forking. That is not the case for the `clang` version.
```llvm
entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %7, ptr %gep_, align 8
  %gep_7 = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %8, ptr %gep_7, align 8
  %gep_8 = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %4, ptr %gep_8, align 8
  %gep_9 = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %3, ptr %gep_9, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit
```
The control flow is completely different for `flang`. After the parallel region, the initial thread goes on to print the result in `%omp.par.exit.split` redirected via `%omp.par.outlined.exit`.
```llvm
omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %21 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr @_QQcl.28612C69372C612C6531332E36653229, i64 16, ptr null, i32 -1, ptr @_QQcl.1c24fad2427fba85941c2f07b505b42a, i32 21)
  %22 = call i1 @_FortranAioOutputAscii(ptr %21, ptr @_QQcl.54686520726573756C74206F662073756D2861727228313A, i64 24)
  %23 = load i32, ptr %7, align 4
  %24 = call i1 @_FortranAioOutputInteger32(ptr %21, i32 %23)
  %25 = call i1 @_FortranAioOutputAscii(ptr %21, ptr @_QQcl.292920697320, i64 6)
  %26 = load double, ptr %8, align 8
  %27 = call i1 @_FortranAioOutputReal64(ptr %21, double %26)
  %28 = call i32 @_FortranAioEndIoStatement(ptr %21)
  %29 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %29, ptr %2, align 8
  %30 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  call void @free(ptr %31)
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 28, i8 2, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64)]] }, ptr %1, align 8
  %32 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %32, ptr @_QFEarr, align 8
  ret void
}
```
The following function is called by `__kmpc_fork_call()`. 
```llvm
; Function Attrs: norecurse nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %gep_5 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_6 = load ptr, ptr %gep_5, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = alloca double, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %red.array = alloca [1 x ptr], align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.par.entry
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %3 = alloca i32, i64 1, align 4
  %4 = load i32, ptr %loadgep_, align 4
  store double 0.000000e+00, ptr %2, align 8
  %5 = select i1 false, i32 %4, i32 1
  %6 = select i1 false, i32 1, i32 %4
  %7 = sub nsw i32 %6, %5
  %8 = icmp slt i32 %6, %5
  %9 = udiv i32 %7, 1
  %10 = add i32 %9, 1
  %omp_loop.tripcount = select i1 %8, i32 0, i32 %10
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i32 0, ptr %p.lowerbound, align 4
  %11 = sub i32 %omp_loop.tripcount, 1
  store i32 %11, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
```
The loop bounds are statically computed with `__kmpc_for_static_init_4u()`.
```
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num3, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %12 = load i32, ptr %p.lowerbound, align 4
  %13 = load i32, ptr %p.upperbound, align 4
  %14 = sub i32 %13, %12
  %15 = add i32 %14, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %15
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num3)
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num4)
  br label %omp_loop.after
```
Again, `__kmpc_reduce` is used to switch atomic operations on or off.
```llvm
omp_loop.after:                                   ; preds = %omp_loop.exit
  %red.array.elem.0 = getelementptr inbounds [1 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %2, ptr %red.array.elem.0, align 8
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @1)
  %reduce = call i32 @__kmpc_reduce(ptr @1, i32 %omp_global_thread_num5, i32 1, i64 8, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp_loop.after
  unreachable

reduce.switch.nonatomic:                          ; preds = %omp_loop.after
  %red.value.0 = load double, ptr %loadgep_2, align 8
  %red.private.value.0 = load double, ptr %2, align 8
  %16 = fadd contract double %red.value.0, %red.private.value.0
  store double %16, ptr %loadgep_2, align 8
  call void @__kmpc_end_reduce(ptr @1, i32 %omp_global_thread_num5, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.nonatomic, %omp_loop.after
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num6)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %reduce.finalize
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %17 = add i32 %omp_loop.iv, %12
  %18 = mul i32 %17, 1
  %19 = add i32 %18, 1
  br label %omp.wsloop.region
```
What is the purpose of the following section?
```llvm
omp.wsloop.region:                                ; preds = %omp_loop.body
  store i32 %19, ptr %3, align 4
  %20 = load i32, ptr %loadgep_, align 4
  %21 = sitofp i32 %20 to float
  %22 = fdiv contract float 1.000000e+00, %21
  %23 = fpext float %22 to double
  %24 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %24, ptr %loadgep_4, align 8
  %25 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 7, i64 0, i32 0
  %26 = load i64, ptr %25, align 8
  %27 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 7, i64 0, i32 1
  %28 = load i64, ptr %27, align 8
  %29 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 7, i64 0, i32 2
  %30 = load i64, ptr %29, align 8
  %31 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = sub i64 %34, %26
  %36 = getelementptr double, ptr %32, i64 %35
  store double %23, ptr %36, align 8
  %37 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEarr, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %37, ptr %loadgep_6, align 8
  %38 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i32 0, i32 7, i64 0, i32 0
  %39 = load i64, ptr %38, align 8
  %40 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i32 0, i32 7, i64 0, i32 1
  %41 = load i64, ptr %40, align 8
  %42 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i32 0, i32 7, i64 0, i32 2
  %43 = load i64, ptr %42, align 8
  %44 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i32 0, i32 0
  %45 = load ptr, ptr %44, align 8
  %46 = load i32, ptr %3, align 4
  %47 = sext i32 %46 to i64
  %48 = sub i64 %47, %39
  %49 = getelementptr double, ptr %45, i64 %48
  %50 = load double, ptr %49, align 8
  %51 = load double, ptr %2, align 8
  %52 = fadd contract double %51, %50
  store double %52, ptr %2, align 8
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32)

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64)

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32)

declare zeroext i1 @_FortranAioOutputReal64(ptr, double)

declare i32 @_FortranAioEndIoStatement(ptr)

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #2

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #2

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #3

define internal void @.omp.reduction.func(ptr %0, ptr %1) {
  %3 = getelementptr inbounds [1 x ptr], ptr %0, i64 0, i64 0
  %4 = load ptr, ptr %3, align 8
  %5 = load double, ptr %4, align 8
  %6 = getelementptr inbounds [1 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load double, ptr %7, align 8
  %9 = fadd contract double %5, %8
  store double %9, ptr %4, align 8
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) #3

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) #3

; Function Attrs: nounwind
declare !callback !4 void @__kmpc_fork_call(ptr, i32, ptr, ...) #2

attributes #0 = { norecurse nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 7, !"openmp", i32 11}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{!5}
!5 = !{i64 2, i64 -1, i64 -1, i1 true}
```

### `flang-new -fopenmp -O3`
```llvm
; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QFEarr.0 = internal unnamed_addr global ptr null
@_QFEarr.8 = internal unnamed_addr global i1 false
@_QQcl.1c24fad2427fba85941c2f07b505b42a = internal constant [49 x i8] c"/g/g92/rydahl1/flangtests/src/loop_reduction.f90\00"
@_QQcl.28612C69372C612C6531332E36653229 = internal constant [16 x i8] c"(a,i7,a,e13.6e2)"
@_QQcl.54686520726573756C74206F662073756D2861727228313A = internal constant [24 x i8] c"The result of sum(arr(1:"
@_QQcl.292920697320 = internal constant [6 x i8] c")) is "
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 4

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
entry:
  %structArg = alloca { ptr, ptr, ptr, ptr }, align 8
  %0 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  store i32 1048576, ptr %2, align 4, !tbaa !4
  %4 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %4, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 true, ptr @_QFEarr.8, align 1
  store double 0.000000e+00, ptr %3, align 8, !tbaa !4
  %omp_global_thread_num = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  store ptr %2, ptr %structArg, align 8
  %gep_7 = getelementptr inbounds { ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 1
  store ptr %3, ptr %gep_7, align 8
  %gep_8 = getelementptr inbounds { ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 2
  store ptr %1, ptr %gep_8, align 8
  %gep_9 = getelementptr inbounds { ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 3
  store ptr %0, ptr %gep_9, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QQmain..omp_par, ptr nonnull %structArg)
  %5 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6531332E36653229, i64 16, ptr null, i32 -1, ptr nonnull @_QQcl.1c24fad2427fba85941c2f07b505b42a, i32 21)
  %6 = call i1 @_FortranAioOutputAscii(ptr %5, ptr nonnull @_QQcl.54686520726573756C74206F662073756D2861727228313A, i64 24)
  %7 = load i32, ptr %2, align 4, !tbaa !4
  %8 = call i1 @_FortranAioOutputInteger32(ptr %5, i32 %7)
  %9 = call i1 @_FortranAioOutputAscii(ptr %5, ptr nonnull @_QQcl.292920697320, i64 6)
  %10 = load double, ptr %3, align 8, !tbaa !4
  %11 = call i1 @_FortranAioOutputReal64(ptr %5, double %10)
  %12 = call i32 @_FortranAioEndIoStatement(ptr %5)
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  call void @free(ptr %.unpack)
  store ptr null, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 false, ptr @_QFEarr.8, align 1
  ret void
}
```
The statically allocated variable `%0` is now `%structArg`. Thereby, `loadgep_` points to percent `%2` from the previous scope, which is the array length `1024*1024=1048576`.
```llvm
; Function Attrs: norecurse nounwind
define internal void @_QQmain..omp_par(ptr noalias nocapture readnone %tid.addr, ptr noalias nocapture readnone %zero.addr, ptr nocapture readonly %0) #2 {
omp.par.entry:
  %loadgep_ = load ptr, ptr %0, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %gep_5 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 3
  %loadgep_6 = load ptr, ptr %gep_5, align 8
  %1 = alloca double, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %red.array = alloca [1 x ptr], align 8
  %2 = load i32, ptr %loadgep_, align 4, !tbaa !4
  store double 0.000000e+00, ptr %1, align 8
  %omp_loop.tripcount = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  store i32 0, ptr %p.lowerbound, align 4
  %3 = add nsw i32 %omp_loop.tripcount, -1
  store i32 %3, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num6 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  call void @__kmpc_for_static_init_4u(ptr nonnull @1, i32 %omp_global_thread_num6, i32 34, ptr nonnull %p.lastiter, ptr nonnull %p.lowerbound, ptr nonnull %p.upperbound, ptr nonnull %p.stride, i32 1, i32 0)
  %4 = load i32, ptr %p.lowerbound, align 4
  %5 = load i32, ptr %p.upperbound, align 4
  %reass.sub = sub i32 %5, %4
  %omp_loop.cmp67.not = icmp eq i32 %reass.sub, -1
  br i1 %omp_loop.cmp67.not, label %omp_loop.exit, label %omp_loop.body.lr.ph

omp_loop.body.lr.ph:                              ; preds = %omp.par.entry
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  %.unpack14.unpack.unpack16.b = load i1, ptr @_QFEarr.8, align 1
  %.unpack14.unpack.unpack16 = select i1 %.unpack14.unpack.unpack16.b, i64 1048576, i64 0
  %loadgep_4.repack19 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 1
  %loadgep_4.repack21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 2
  %loadgep_4.repack23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 3
  %loadgep_4.repack25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 4
  %loadgep_4.repack27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 5
  %loadgep_4.repack29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 6
  %loadgep_4.repack31 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7
  %loadgep_4.repack31.repack33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 1
  %loadgep_4.repack31.repack35 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 2
  %loadgep_6.repack49 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 1
  %loadgep_6.repack51 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 2
  %loadgep_6.repack53 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 3
  %loadgep_6.repack55 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 4
  %loadgep_6.repack57 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 5
  %loadgep_6.repack59 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 6
  %loadgep_6.repack61 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7
  %loadgep_6.repack61.repack63 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 1
  %loadgep_6.repack61.repack65 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 2
  br label %omp_loop.body

omp_loop.exit:                                    ; preds = %omp_loop.body, %omp.par.entry
  call void @__kmpc_for_static_fini(ptr nonnull @1, i32 %omp_global_thread_num6)
  call void @__kmpc_barrier(ptr nonnull @2, i32 %omp_global_thread_num6)
  store ptr %1, ptr %red.array, align 8
  %reduce = call i32 @__kmpc_reduce(ptr nonnull @1, i32 %omp_global_thread_num6, i32 1, i64 8, ptr nonnull %red.array, ptr nonnull @.omp.reduction.func, ptr nonnull @.gomp_critical_user_.reduction.var)
  %cond = icmp eq i32 %reduce, 1
  br i1 %cond, label %reduce.switch.nonatomic, label %reduce.finalize

reduce.switch.nonatomic:                          ; preds = %omp_loop.exit
  %red.value.0 = load double, ptr %loadgep_2, align 8
  %red.private.value.0 = load double, ptr %1, align 8
  %6 = fadd contract double %red.value.0, %red.private.value.0
  store double %6, ptr %loadgep_2, align 8
  call void @__kmpc_end_reduce(ptr nonnull @1, i32 %omp_global_thread_num6, ptr nonnull @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %omp_loop.exit, %reduce.switch.nonatomic
  call void @__kmpc_barrier(ptr nonnull @2, i32 %omp_global_thread_num6)
  ret void
```
In the following lines, `flang-new -O3` has not performed constant propagation of the devision of one by the array length. Floatig point contraction has been enabled with `fadd constract` and `fdiv contract`. `%10` is converted from `%9%` which is loaded from `%loadgep_`, which is ultumately the array length.<br>
<font color='red'>In the code generated with `clang`, vectorization with a vector length of four had been applied, and constant propagation was enabled.</font><br>
However, one optimiation that has kicked in is floating point contraction. Division is carried out in FP32 precision and extended to FP64.
```llvm
omp_loop.body:                                    ; preds = %omp_loop.body.lr.ph, %omp_loop.body
  %omp_loop.iv68 = phi i32 [ 0, %omp_loop.body.lr.ph ], [ %7, %omp_loop.body ]
  %7 = add nuw i32 %omp_loop.iv68, 1
  %8 = add i32 %7, %4
  %9 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %10 = sitofp i32 %9 to float
  %11 = fdiv contract float 1.000000e+00, %10
  %12 = fpext float %11 to double
  store ptr %.unpack, ptr %loadgep_4, align 8, !tbaa !8
  store i64 8, ptr %loadgep_4.repack19, align 8, !tbaa !8
  store i32 20180515, ptr %loadgep_4.repack21, align 8, !tbaa !8
  store i8 1, ptr %loadgep_4.repack23, align 4, !tbaa !8
  store i8 28, ptr %loadgep_4.repack25, align 1, !tbaa !8
  store i8 2, ptr %loadgep_4.repack27, align 2, !tbaa !8
  store i8 0, ptr %loadgep_4.repack29, align 1, !tbaa !8
  store i64 1, ptr %loadgep_4.repack31, align 8, !tbaa !8
  store i64 %.unpack14.unpack.unpack16, ptr %loadgep_4.repack31.repack33, align 8, !tbaa !8
  store i64 8, ptr %loadgep_4.repack31.repack35, align 8, !tbaa !8
  %13 = sext i32 %8 to i64
  %14 = add nsw i64 %13, -1
  %15 = getelementptr double, ptr %.unpack, i64 %14
  store double %12, ptr %15, align 8, !tbaa !4
  store ptr %.unpack, ptr %loadgep_6, align 8, !tbaa !8
  store i64 8, ptr %loadgep_6.repack49, align 8, !tbaa !8
  store i32 20180515, ptr %loadgep_6.repack51, align 8, !tbaa !8
  store i8 1, ptr %loadgep_6.repack53, align 4, !tbaa !8
  store i8 28, ptr %loadgep_6.repack55, align 1, !tbaa !8
  store i8 2, ptr %loadgep_6.repack57, align 2, !tbaa !8
  store i8 0, ptr %loadgep_6.repack59, align 1, !tbaa !8
  store i64 1, ptr %loadgep_6.repack61, align 8, !tbaa !8
  store i64 %.unpack14.unpack.unpack16, ptr %loadgep_6.repack61.repack63, align 8, !tbaa !8
  store i64 8, ptr %loadgep_6.repack61.repack65, align 8, !tbaa !8
```
Adding result to local reduction variable, `%1`.
```llvm
  %16 = load double, ptr %1, align 8
  %17 = fadd contract double %16, %12
  store double %17, ptr %1, align 8
  %exitcond.not = icmp eq i32 %omp_loop.iv68, %reass.sub
  br i1 %exitcond.not, label %omp_loop.exit, label %omp_loop.body
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputReal64(ptr, double) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define internal void @.omp.reduction.func(ptr nocapture readonly %0, ptr nocapture readonly %1) #5 {
  %3 = load ptr, ptr %0, align 8
  %4 = load double, ptr %3, align 8
  %5 = load ptr, ptr %1, align 8
  %6 = load double, ptr %5, align 8
  %7 = fadd contract double %4, %6
  store double %7, ptr %3, align 8
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) local_unnamed_addr #4

; Function Attrs: nounwind
declare !callback !10 void @__kmpc_fork_call(ptr, i32, ptr, ...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #6

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { norecurse nounwind }
attributes #3 = { nounwind }
attributes #4 = { convergent nounwind }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 7, !"openmp", i32 11}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{!5, !5, i64 0}
!5 = !{!"any data access", !6, i64 0}
!6 = !{!"any access", !7, i64 0}
!7 = !{!"Flang Type TBAA Root"}
!8 = !{!9, !9, i64 0}
!9 = !{!"descriptor member", !6, i64 0}
!10 = !{!11}
!11 = !{i64 2, i64 -1, i64 -1, i1 true}
```
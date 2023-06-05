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

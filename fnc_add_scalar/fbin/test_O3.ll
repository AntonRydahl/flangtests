; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define void @_QMtestPadd_arr(ptr nocapture writeonly %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 1
  %4 = load i64, ptr %3, align 8, !tbaa !3
  %.not = icmp slt i64 %4, 1
  br i1 %.not, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %5 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 2
  %6 = load i64, ptr %5, align 8, !tbaa !3
  %7 = load ptr, ptr %1, align 8, !tbaa !3
  %xtraiter = and i64 %4, 3
  %8 = icmp ult i64 %4, 4
  br i1 %8, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i64 %4, -4
  br label %9

9:                                                ; preds = %9, %.lr.ph.new
  %10 = phi i64 [ 0, %.lr.ph.new ], [ %29, %9 ]
  %niter = phi i64 [ 0, %.lr.ph.new ], [ %niter.next.3, %9 ]
  %11 = or i64 %10, 1
  %12 = mul i64 %6, %10
  %13 = getelementptr i8, ptr %7, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !7
  %15 = add i32 %14, 27
  %16 = getelementptr i32, ptr %0, i64 %10
  store i32 %15, ptr %16, align 4, !tbaa !7
  %17 = or i64 %10, 2
  %18 = mul i64 %6, %11
  %19 = getelementptr i8, ptr %7, i64 %18
  %20 = load i32, ptr %19, align 4, !tbaa !7
  %21 = add i32 %20, 27
  %22 = getelementptr i32, ptr %0, i64 %11
  store i32 %21, ptr %22, align 4, !tbaa !7
  %23 = or i64 %10, 3
  %24 = mul i64 %6, %17
  %25 = getelementptr i8, ptr %7, i64 %24
  %26 = load i32, ptr %25, align 4, !tbaa !7
  %27 = add i32 %26, 27
  %28 = getelementptr i32, ptr %0, i64 %17
  store i32 %27, ptr %28, align 4, !tbaa !7
  %29 = add nuw nsw i64 %10, 4
  %30 = mul i64 %6, %23
  %31 = getelementptr i8, ptr %7, i64 %30
  %32 = load i32, ptr %31, align 4, !tbaa !7
  %33 = add i32 %32, 27
  %34 = getelementptr i32, ptr %0, i64 %23
  store i32 %33, ptr %34, align 4, !tbaa !7
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %9

._crit_edge.loopexit.unr-lcssa:                   ; preds = %9, %.lr.ph
  %.unr = phi i64 [ 0, %.lr.ph ], [ %29, %9 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.loopexit.unr-lcssa, %.epil.preheader
  %35 = phi i64 [ %36, %.epil.preheader ], [ %.unr, %._crit_edge.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %.epil.preheader ], [ 0, %._crit_edge.loopexit.unr-lcssa ]
  %36 = add nuw nsw i64 %35, 1
  %37 = mul i64 %6, %35
  %38 = getelementptr i8, ptr %7, i64 %37
  %39 = load i32, ptr %38, align 4, !tbaa !7
  %40 = add i32 %39, 27
  %41 = getelementptr i32, ptr %0, i64 %35
  store i32 %40, ptr %41, align 4, !tbaa !7
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.epil.preheader, !llvm.loop !9

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.epil.preheader, %2
  ret void
}

attributes #0 = { nofree nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"descriptor member", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang Type TBAA Root"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any data access", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}

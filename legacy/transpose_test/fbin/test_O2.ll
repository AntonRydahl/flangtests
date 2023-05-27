; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define void @_QMtestPtrans_open(ptr nocapture writeonly %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 1
  %4 = load i64, ptr %3, align 8, !tbaa !3
  %5 = tail call i64 @llvm.smax.i64(i64 %4, i64 0)
  %6 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 1
  %7 = load i64, ptr %6, align 8, !tbaa !3
  %.not = icmp slt i64 %7, 1
  br i1 %.not, label %._crit_edge1, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %2
  %.not2 = icmp slt i64 %4, 1
  %8 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 2
  %9 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 2
  %xtraiter = and i64 %5, 1
  %10 = icmp eq i64 %5, 1
  %unroll_iter = and i64 %5, 9223372036854775806
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %11 = phi i64 [ 0, %.preheader.lr.ph ], [ %38, %._crit_edge ]
  br i1 %.not2, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %12 = load i64, ptr %8, align 8, !tbaa !3
  %13 = mul i64 %12, %11
  %14 = load i64, ptr %9, align 8, !tbaa !3
  %15 = load ptr, ptr %1, align 8, !tbaa !3
  %16 = mul i64 %11, %5
  br i1 %10, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph, %.lr.ph.new
  %17 = phi i64 [ %25, %.lr.ph.new ], [ 0, %.lr.ph ]
  %niter = phi i64 [ %niter.next.1, %.lr.ph.new ], [ 0, %.lr.ph ]
  %18 = or i64 %17, 1
  %19 = mul i64 %14, %17
  %20 = add i64 %19, %13
  %21 = getelementptr i8, ptr %15, i64 %20
  %22 = load i32, ptr %21, align 4, !tbaa !7
  %23 = add i64 %17, %16
  %24 = getelementptr i32, ptr %0, i64 %23
  store i32 %22, ptr %24, align 4, !tbaa !7
  %25 = add nuw nsw i64 %17, 2
  %26 = mul i64 %14, %18
  %27 = add i64 %26, %13
  %28 = getelementptr i8, ptr %15, i64 %27
  %29 = load i32, ptr %28, align 4, !tbaa !7
  %30 = add i64 %18, %16
  %31 = getelementptr i32, ptr %0, i64 %30
  store i32 %29, ptr %31, align 4, !tbaa !7
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph.new

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph.new, %.lr.ph
  %.unr = phi i64 [ 0, %.lr.ph ], [ %25, %.lr.ph.new ]
  br i1 %lcmp.mod.not, label %._crit_edge, label %._crit_edge.loopexit.epilog-lcssa

._crit_edge.loopexit.epilog-lcssa:                ; preds = %._crit_edge.loopexit.unr-lcssa
  %32 = mul i64 %14, %.unr
  %33 = add i64 %32, %13
  %34 = getelementptr i8, ptr %15, i64 %33
  %35 = load i32, ptr %34, align 4, !tbaa !7
  %36 = add i64 %.unr, %16
  %37 = getelementptr i32, ptr %0, i64 %36
  store i32 %35, ptr %37, align 4, !tbaa !7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit.epilog-lcssa, %._crit_edge.loopexit.unr-lcssa, %.preheader
  %38 = add nuw i64 %11, 1
  %exitcond3.not = icmp eq i64 %38, %7
  br i1 %exitcond3.not, label %._crit_edge1, label %.preheader

._crit_edge1:                                     ; preds = %._crit_edge, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @_QMtestPtrans_closed(ptr nocapture writeonly %0, ptr nocapture readonly %1) local_unnamed_addr #1 {
.preheader:
  %2 = load i32, ptr %1, align 4, !tbaa !7
  store i32 %2, ptr %0, align 4, !tbaa !7
  %3 = getelementptr i32, ptr %1, i64 3
  %4 = load i32, ptr %3, align 4, !tbaa !7
  %5 = getelementptr i32, ptr %0, i64 1
  store i32 %4, ptr %5, align 4, !tbaa !7
  %6 = getelementptr i32, ptr %1, i64 6
  %7 = load i32, ptr %6, align 4, !tbaa !7
  %8 = getelementptr i32, ptr %0, i64 2
  store i32 %7, ptr %8, align 4, !tbaa !7
  %9 = getelementptr i32, ptr %1, i64 1
  %10 = load i32, ptr %9, align 4, !tbaa !7
  %11 = getelementptr i32, ptr %0, i64 3
  store i32 %10, ptr %11, align 4, !tbaa !7
  %12 = getelementptr i32, ptr %1, i64 4
  %13 = load i32, ptr %12, align 4, !tbaa !7
  %14 = getelementptr i32, ptr %0, i64 4
  store i32 %13, ptr %14, align 4, !tbaa !7
  %15 = getelementptr i32, ptr %1, i64 7
  %16 = load i32, ptr %15, align 4, !tbaa !7
  %17 = getelementptr i32, ptr %0, i64 5
  store i32 %16, ptr %17, align 4, !tbaa !7
  %18 = getelementptr i32, ptr %1, i64 2
  %19 = load i32, ptr %18, align 4, !tbaa !7
  %20 = getelementptr i32, ptr %0, i64 6
  store i32 %19, ptr %20, align 4, !tbaa !7
  %21 = getelementptr i32, ptr %1, i64 5
  %22 = load i32, ptr %21, align 4, !tbaa !7
  %23 = getelementptr i32, ptr %0, i64 7
  store i32 %22, ptr %23, align 4, !tbaa !7
  %24 = getelementptr i32, ptr %1, i64 8
  %25 = load i32, ptr %24, align 4, !tbaa !7
  %26 = getelementptr i32, ptr %0, i64 8
  store i32 %25, ptr %26, align 4, !tbaa !7
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @_QMtestPtrans_manual(ptr nocapture writeonly %0, ptr nocapture readonly %1) local_unnamed_addr #1 {
.preheader3.preheader:
  %2 = load i32, ptr %1, align 4, !tbaa !7
  store i32 %2, ptr %0, align 4, !tbaa !7
  %3 = getelementptr i32, ptr %1, i64 1
  %4 = load i32, ptr %3, align 4, !tbaa !7
  %5 = getelementptr i32, ptr %0, i64 3
  store i32 %4, ptr %5, align 4, !tbaa !7
  %6 = getelementptr i32, ptr %1, i64 2
  %7 = load i32, ptr %6, align 4, !tbaa !7
  %8 = getelementptr i32, ptr %0, i64 6
  store i32 %7, ptr %8, align 4, !tbaa !7
  %9 = getelementptr i32, ptr %1, i64 3
  %10 = load i32, ptr %9, align 4, !tbaa !7
  %11 = getelementptr i32, ptr %0, i64 1
  store i32 %10, ptr %11, align 4, !tbaa !7
  %12 = getelementptr i32, ptr %1, i64 4
  %13 = load i32, ptr %12, align 4, !tbaa !7
  %14 = getelementptr i32, ptr %0, i64 4
  store i32 %13, ptr %14, align 4, !tbaa !7
  %15 = getelementptr i32, ptr %1, i64 5
  %16 = load i32, ptr %15, align 4, !tbaa !7
  %17 = getelementptr i32, ptr %0, i64 7
  store i32 %16, ptr %17, align 4, !tbaa !7
  %18 = getelementptr i32, ptr %1, i64 6
  %19 = load i32, ptr %18, align 4, !tbaa !7
  %20 = getelementptr i32, ptr %0, i64 2
  store i32 %19, ptr %20, align 4, !tbaa !7
  %21 = getelementptr i32, ptr %1, i64 7
  %22 = load i32, ptr %21, align 4, !tbaa !7
  %23 = getelementptr i32, ptr %0, i64 5
  store i32 %22, ptr %23, align 4, !tbaa !7
  %24 = getelementptr i32, ptr %1, i64 8
  %25 = load i32, ptr %24, align 4, !tbaa !7
  %26 = getelementptr i32, ptr %0, i64 8
  store i32 %25, ptr %26, align 4, !tbaa !7
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #2

attributes #0 = { nofree nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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

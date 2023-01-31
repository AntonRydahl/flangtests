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
  %8 = tail call i64 @llvm.smax.i64(i64 %7, i64 0)
  %.not = icmp slt i64 %7, 1
  %.not2 = icmp slt i64 %4, 1
  %or.cond = select i1 %.not, i1 true, i1 %.not2
  br i1 %or.cond, label %._crit_edge1, label %.preheader.lr.ph.split.us

.preheader.lr.ph.split.us:                        ; preds = %2
  %9 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 2
  %10 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 2
  %11 = load i64, ptr %10, align 8, !tbaa !3
  %12 = load i64, ptr %9, align 8, !tbaa !3
  %13 = load ptr, ptr %1, align 8, !tbaa !3
  %xtraiter = and i64 %5, 1
  %14 = icmp eq i64 %5, 1
  %unroll_iter = and i64 %5, 9223372036854775806
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %15 = phi i64 [ 0, %.preheader.lr.ph.split.us ], [ %39, %._crit_edge.us ]
  %16 = mul i64 %11, %15
  %17 = mul i64 %15, %5
  br i1 %14, label %._crit_edge.us.unr-lcssa, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %18 = phi i64 [ %26, %.preheader.us.new ], [ 0, %.preheader.us ]
  %niter = phi i64 [ %niter.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %19 = or i64 %18, 1
  %20 = mul i64 %12, %18
  %21 = add i64 %20, %16
  %22 = getelementptr i8, ptr %13, i64 %21
  %23 = load i32, ptr %22, align 4, !tbaa !7
  %24 = add i64 %18, %17
  %25 = getelementptr i32, ptr %0, i64 %24
  store i32 %23, ptr %25, align 4, !tbaa !7
  %26 = add nuw nsw i64 %18, 2
  %27 = mul i64 %12, %19
  %28 = add i64 %27, %16
  %29 = getelementptr i8, ptr %13, i64 %28
  %30 = load i32, ptr %29, align 4, !tbaa !7
  %31 = add i64 %19, %17
  %32 = getelementptr i32, ptr %0, i64 %31
  store i32 %30, ptr %32, align 4, !tbaa !7
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge.us.unr-lcssa, label %.preheader.us.new

._crit_edge.us.unr-lcssa:                         ; preds = %.preheader.us.new, %.preheader.us
  %.unr = phi i64 [ 0, %.preheader.us ], [ %26, %.preheader.us.new ]
  br i1 %lcmp.mod.not, label %._crit_edge.us, label %._crit_edge.us.epilog-lcssa

._crit_edge.us.epilog-lcssa:                      ; preds = %._crit_edge.us.unr-lcssa
  %33 = mul i64 %12, %.unr
  %34 = add i64 %33, %16
  %35 = getelementptr i8, ptr %13, i64 %34
  %36 = load i32, ptr %35, align 4, !tbaa !7
  %37 = add i64 %.unr, %17
  %38 = getelementptr i32, ptr %0, i64 %37
  store i32 %36, ptr %38, align 4, !tbaa !7
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.unr-lcssa, %._crit_edge.us.epilog-lcssa
  %39 = add nuw nsw i64 %15, 1
  %exitcond4.not = icmp eq i64 %39, %8
  br i1 %exitcond4.not, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us, %2
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

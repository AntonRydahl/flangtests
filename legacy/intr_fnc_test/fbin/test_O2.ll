; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000 = linkonce constant [27 x i8] c"././intr_fnc_test/test.f90\00"

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #0

define i32 @_QMtestPmax_sum_open(ptr %0) local_unnamed_addr {
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  store ptr null, ptr %2, align 8, !tbaa !3
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !3
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !3
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep, align 4, !tbaa !3
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !3
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 5
  store i8 2, ptr %.fca.5.gep, align 2, !tbaa !3
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !3
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !3
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 1
  store i64 0, ptr %.fca.7.0.1.gep, align 8, !tbaa !3
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !3
  %3 = call {} @_FortranASumDim(ptr nonnull %2, ptr %0, i32 1, ptr nonnull @_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000, i32 6, ptr null)
  %.fca.0.load = load ptr, ptr %2, align 8, !tbaa !3
  %.fca.7.0.1.load = load i64, ptr %.fca.7.0.1.gep, align 8, !tbaa !3
  %4 = icmp sgt i64 %.fca.7.0.1.load, 0
  br i1 %4, label %.lr.ph.i.preheader, label %_FortranAMaxvalInteger4x1_contract_simplified.exit

.lr.ph.i.preheader:                               ; preds = %1
  %min.iters.check = icmp ult i64 %.fca.7.0.1.load, 8
  br i1 %min.iters.check, label %.lr.ph.i.preheader80, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.i.preheader
  %n.vec = and i64 %.fca.7.0.1.load, -8
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>, %vector.ph ], [ %8, %vector.body ]
  %vec.phi78 = phi <4 x i32> [ <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>, %vector.ph ], [ %9, %vector.body ]
  %5 = shl i64 %index, 2
  %6 = getelementptr i8, ptr %.fca.0.load, i64 %5
  %wide.load = load <4 x i32>, ptr %6, align 4, !tbaa !7
  %7 = getelementptr i32, ptr %6, i64 4
  %wide.load79 = load <4 x i32>, ptr %7, align 4, !tbaa !7
  %8 = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %wide.load, <4 x i32> %vec.phi)
  %9 = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %wide.load79, <4 x i32> %vec.phi78)
  %index.next = add nuw i64 %index, 8
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %rdx.minmax.select = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %8, <4 x i32> %9)
  %11 = call i32 @llvm.vector.reduce.smax.v4i32(<4 x i32> %rdx.minmax.select)
  %cmp.n = icmp eq i64 %.fca.7.0.1.load, %n.vec
  br i1 %cmp.n, label %_FortranAMaxvalInteger4x1_contract_simplified.exit, label %.lr.ph.i.preheader80

.lr.ph.i.preheader80:                             ; preds = %.lr.ph.i.preheader, %middle.block
  %.ph = phi i32 [ -2147483648, %.lr.ph.i.preheader ], [ %11, %middle.block ]
  %.ph81 = phi i64 [ 0, %.lr.ph.i.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader80, %.lr.ph.i
  %12 = phi i32 [ %17, %.lr.ph.i ], [ %.ph, %.lr.ph.i.preheader80 ]
  %13 = phi i64 [ %18, %.lr.ph.i ], [ %.ph81, %.lr.ph.i.preheader80 ]
  %14 = shl i64 %13, 2
  %15 = getelementptr i8, ptr %.fca.0.load, i64 %14
  %16 = load i32, ptr %15, align 4, !tbaa !7
  %17 = call i32 @llvm.smax.i32(i32 %16, i32 %12)
  %18 = add nuw nsw i64 %13, 1
  %exitcond.not.i = icmp eq i64 %18, %.fca.7.0.1.load
  br i1 %exitcond.not.i, label %_FortranAMaxvalInteger4x1_contract_simplified.exit, label %.lr.ph.i, !llvm.loop !12

_FortranAMaxvalInteger4x1_contract_simplified.exit: ; preds = %.lr.ph.i, %middle.block, %1
  %.lcssa.i = phi i32 [ -2147483648, %1 ], [ %11, %middle.block ], [ %17, %.lr.ph.i ]
  call void @free(ptr %.fca.0.load)
  ret i32 %.lcssa.i
}

define i32 @_QMtestPmax_sum_3x3(ptr %0) local_unnamed_addr {
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  store ptr %0, ptr %2, align 8, !tbaa !3
  %.fca.1.gep14 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep14, align 8, !tbaa !3
  %.fca.2.gep16 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep16, align 8, !tbaa !3
  %.fca.3.gep18 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 3
  store i8 2, ptr %.fca.3.gep18, align 4, !tbaa !3
  %.fca.4.gep20 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep20, align 1, !tbaa !3
  %.fca.5.gep22 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep22, align 2, !tbaa !3
  %.fca.6.gep24 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep24, align 1, !tbaa !3
  %.fca.7.0.0.gep26 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep26, align 8, !tbaa !3
  %.fca.7.0.1.gep28 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 1
  store i64 3, ptr %.fca.7.0.1.gep28, align 8, !tbaa !3
  %.fca.7.0.2.gep30 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep30, align 8, !tbaa !3
  %.fca.7.1.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 1, i64 0
  store i64 1, ptr %.fca.7.1.0.gep, align 8, !tbaa !3
  %.fca.7.1.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 1, i64 1
  store i64 3, ptr %.fca.7.1.1.gep, align 8, !tbaa !3
  %.fca.7.1.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 1, i64 2
  store i64 12, ptr %.fca.7.1.2.gep, align 8, !tbaa !3
  store ptr null, ptr %3, align 8, !tbaa !3
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !3
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !3
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep, align 4, !tbaa !3
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !3
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 5
  store i8 2, ptr %.fca.5.gep, align 2, !tbaa !3
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !3
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !3
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 1
  store i64 0, ptr %.fca.7.0.1.gep, align 8, !tbaa !3
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !3
  %4 = call {} @_FortranASumDim(ptr nonnull %3, ptr nonnull %2, i32 1, ptr nonnull @_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000, i32 12, ptr null)
  %.fca.0.load = load ptr, ptr %3, align 8, !tbaa !3
  %.fca.7.0.1.load = load i64, ptr %.fca.7.0.1.gep, align 8, !tbaa !3
  %5 = icmp sgt i64 %.fca.7.0.1.load, 0
  br i1 %5, label %.lr.ph.i.preheader, label %_FortranAMaxvalInteger4x1_contract_simplified.exit

.lr.ph.i.preheader:                               ; preds = %1
  %min.iters.check = icmp ult i64 %.fca.7.0.1.load, 8
  br i1 %min.iters.check, label %.lr.ph.i.preheader100, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.i.preheader
  %n.vec = and i64 %.fca.7.0.1.load, -8
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>, %vector.ph ], [ %9, %vector.body ]
  %vec.phi98 = phi <4 x i32> [ <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>, %vector.ph ], [ %10, %vector.body ]
  %6 = shl i64 %index, 2
  %7 = getelementptr i8, ptr %.fca.0.load, i64 %6
  %wide.load = load <4 x i32>, ptr %7, align 4, !tbaa !7
  %8 = getelementptr i32, ptr %7, i64 4
  %wide.load99 = load <4 x i32>, ptr %8, align 4, !tbaa !7
  %9 = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %wide.load, <4 x i32> %vec.phi)
  %10 = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %wide.load99, <4 x i32> %vec.phi98)
  %index.next = add nuw i64 %index, 8
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %rdx.minmax.select = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %9, <4 x i32> %10)
  %12 = call i32 @llvm.vector.reduce.smax.v4i32(<4 x i32> %rdx.minmax.select)
  %cmp.n = icmp eq i64 %.fca.7.0.1.load, %n.vec
  br i1 %cmp.n, label %_FortranAMaxvalInteger4x1_contract_simplified.exit, label %.lr.ph.i.preheader100

.lr.ph.i.preheader100:                            ; preds = %.lr.ph.i.preheader, %middle.block
  %.ph = phi i32 [ -2147483648, %.lr.ph.i.preheader ], [ %12, %middle.block ]
  %.ph101 = phi i64 [ 0, %.lr.ph.i.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader100, %.lr.ph.i
  %13 = phi i32 [ %18, %.lr.ph.i ], [ %.ph, %.lr.ph.i.preheader100 ]
  %14 = phi i64 [ %19, %.lr.ph.i ], [ %.ph101, %.lr.ph.i.preheader100 ]
  %15 = shl i64 %14, 2
  %16 = getelementptr i8, ptr %.fca.0.load, i64 %15
  %17 = load i32, ptr %16, align 4, !tbaa !7
  %18 = call i32 @llvm.smax.i32(i32 %17, i32 %13)
  %19 = add nuw nsw i64 %14, 1
  %exitcond.not.i = icmp eq i64 %19, %.fca.7.0.1.load
  br i1 %exitcond.not.i, label %_FortranAMaxvalInteger4x1_contract_simplified.exit, label %.lr.ph.i, !llvm.loop !14

_FortranAMaxvalInteger4x1_contract_simplified.exit: ; preds = %.lr.ph.i, %middle.block, %1
  %.lcssa.i = phi i32 [ -2147483648, %1 ], [ %12, %middle.block ], [ %18, %.lr.ph.i ]
  call void @free(ptr %.fca.0.load)
  ret i32 %.lcssa.i
}

declare {} @_FortranASumDim(ptr, ptr, i32, ptr, i32, ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smax.v4i32(<4 x i32>, <4 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v4i32(<4 x i32>) #3

attributes #0 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(none) }

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
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = distinct !{!12, !11, !10}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !11, !10}

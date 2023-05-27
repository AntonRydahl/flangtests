; ModuleID = './transpose_test/test.c'
source_filename = "./transpose_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @trans_open(i32* nocapture readonly %0, i32* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %6, label %22

6:                                                ; preds = %4
  %7 = icmp sgt i32 %3, 0
  %8 = zext i32 %2 to i64
  %9 = zext i32 %2 to i64
  %10 = zext i32 %3 to i64
  %11 = add nsw i64 %10, -1
  %12 = and i64 %10, 3
  %13 = icmp ult i64 %11, 3
  %14 = sub nsw i64 %10, %12
  %15 = icmp eq i64 %12, 0
  br label %16

16:                                               ; preds = %35, %6
  %17 = phi i64 [ 0, %6 ], [ %36, %35 ]
  br i1 %7, label %18, label %35

18:                                               ; preds = %16
  %19 = mul nsw i64 %17, %8
  %20 = getelementptr inbounds i32, i32* %0, i64 %19
  %21 = getelementptr inbounds i32, i32* %1, i64 %17
  br i1 %13, label %23, label %38

22:                                               ; preds = %35, %4
  ret void

23:                                               ; preds = %38, %18
  %24 = phi i64 [ 0, %18 ], [ %60, %38 ]
  br i1 %15, label %35, label %25

25:                                               ; preds = %23, %25
  %26 = phi i64 [ %32, %25 ], [ %24, %23 ]
  %27 = phi i64 [ %33, %25 ], [ %12, %23 ]
  %28 = getelementptr inbounds i32, i32* %20, i64 %26
  %29 = load i32, i32* %28, align 4, !tbaa !2
  %30 = mul nsw i64 %26, %8
  %31 = getelementptr inbounds i32, i32* %21, i64 %30
  store i32 %29, i32* %31, align 4, !tbaa !2
  %32 = add nuw nsw i64 %26, 1
  %33 = add i64 %27, -1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %35, label %25, !llvm.loop !6

35:                                               ; preds = %23, %25, %16
  %36 = add nuw nsw i64 %17, 1
  %37 = icmp eq i64 %36, %9
  br i1 %37, label %22, label %16

38:                                               ; preds = %18, %38
  %39 = phi i64 [ %60, %38 ], [ 0, %18 ]
  %40 = phi i64 [ %61, %38 ], [ %14, %18 ]
  %41 = getelementptr inbounds i32, i32* %20, i64 %39
  %42 = load i32, i32* %41, align 4, !tbaa !2
  %43 = mul nsw i64 %39, %8
  %44 = getelementptr inbounds i32, i32* %21, i64 %43
  store i32 %42, i32* %44, align 4, !tbaa !2
  %45 = or i64 %39, 1
  %46 = getelementptr inbounds i32, i32* %20, i64 %45
  %47 = load i32, i32* %46, align 4, !tbaa !2
  %48 = mul nsw i64 %45, %8
  %49 = getelementptr inbounds i32, i32* %21, i64 %48
  store i32 %47, i32* %49, align 4, !tbaa !2
  %50 = or i64 %39, 2
  %51 = getelementptr inbounds i32, i32* %20, i64 %50
  %52 = load i32, i32* %51, align 4, !tbaa !2
  %53 = mul nsw i64 %50, %8
  %54 = getelementptr inbounds i32, i32* %21, i64 %53
  store i32 %52, i32* %54, align 4, !tbaa !2
  %55 = or i64 %39, 3
  %56 = getelementptr inbounds i32, i32* %20, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !2
  %58 = mul nsw i64 %55, %8
  %59 = getelementptr inbounds i32, i32* %21, i64 %58
  store i32 %57, i32* %59, align 4, !tbaa !2
  %60 = add nuw nsw i64 %39, 4
  %61 = add i64 %40, -4
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %23, label %38
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @trans_closed([3 x i32]* nocapture readonly %0, [3 x i32]* nocapture %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 0
  %4 = load i32, i32* %3, align 4, !tbaa !2
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  store i32 %4, i32* %5, align 4, !tbaa !2
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 0
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %8 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1
  store i32 %7, i32* %8, align 4, !tbaa !2
  %9 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 0
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2
  store i32 %10, i32* %11, align 4, !tbaa !2
  %12 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 0
  store i32 %13, i32* %14, align 4, !tbaa !2
  %15 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 1
  store i32 %16, i32* %17, align 4, !tbaa !2
  %18 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 2
  store i32 %19, i32* %20, align 4, !tbaa !2
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 2
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 0
  store i32 %22, i32* %23, align 4, !tbaa !2
  %24 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !2
  %26 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 1
  store i32 %25, i32* %26, align 4, !tbaa !2
  %27 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 2
  store i32 %28, i32* %29, align 4, !tbaa !2
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @trans_manual([3 x i32]* nocapture readonly %0, [3 x i32]* nocapture %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 0
  %4 = load i32, i32* %3, align 4, !tbaa !2
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1
  store i32 %4, i32* %5, align 4, !tbaa !2
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 1
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %8 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 0
  store i32 %7, i32* %8, align 4, !tbaa !2
  %9 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 0
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2
  store i32 %10, i32* %11, align 4, !tbaa !2
  %12 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 2
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 0
  store i32 %13, i32* %14, align 4, !tbaa !2
  %15 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 2
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 1
  store i32 %16, i32* %17, align 4, !tbaa !2
  %18 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 2
  store i32 %19, i32* %20, align 4, !tbaa !2
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 0
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  store i32 %22, i32* %23, align 4, !tbaa !2
  %24 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 1
  %25 = load i32, i32* %24, align 4, !tbaa !2
  %26 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 1
  store i32 %25, i32* %26, align 4, !tbaa !2
  %27 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 2
  store i32 %28, i32* %29, align 4, !tbaa !2
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}

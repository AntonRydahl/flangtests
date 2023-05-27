; ModuleID = './transpose_test/test.c'
source_filename = "./transpose_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @trans_open(i32* nocapture readonly %0, i32* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %2, 0
  %6 = icmp sgt i32 %3, 0
  %7 = and i1 %5, %6
  br i1 %7, label %8, label %62

8:                                                ; preds = %4
  %9 = zext i32 %2 to i64
  %10 = zext i32 %2 to i64
  %11 = zext i32 %3 to i64
  %12 = add nsw i64 %11, -1
  %13 = and i64 %11, 3
  %14 = icmp ult i64 %12, 3
  %15 = sub nsw i64 %11, %13
  %16 = icmp eq i64 %13, 0
  br label %17

17:                                               ; preds = %59, %8
  %18 = phi i64 [ 0, %8 ], [ %60, %59 ]
  %19 = mul nsw i64 %18, %9
  %20 = getelementptr inbounds i32, i32* %0, i64 %19
  %21 = getelementptr inbounds i32, i32* %1, i64 %18
  br i1 %14, label %47, label %22

22:                                               ; preds = %17, %22
  %23 = phi i64 [ %44, %22 ], [ 0, %17 ]
  %24 = phi i64 [ %45, %22 ], [ %15, %17 ]
  %25 = getelementptr inbounds i32, i32* %20, i64 %23
  %26 = load i32, i32* %25, align 4, !tbaa !2
  %27 = mul nsw i64 %23, %9
  %28 = getelementptr inbounds i32, i32* %21, i64 %27
  store i32 %26, i32* %28, align 4, !tbaa !2
  %29 = or i64 %23, 1
  %30 = getelementptr inbounds i32, i32* %20, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %32 = mul nsw i64 %29, %9
  %33 = getelementptr inbounds i32, i32* %21, i64 %32
  store i32 %31, i32* %33, align 4, !tbaa !2
  %34 = or i64 %23, 2
  %35 = getelementptr inbounds i32, i32* %20, i64 %34
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = mul nsw i64 %34, %9
  %38 = getelementptr inbounds i32, i32* %21, i64 %37
  store i32 %36, i32* %38, align 4, !tbaa !2
  %39 = or i64 %23, 3
  %40 = getelementptr inbounds i32, i32* %20, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !2
  %42 = mul nsw i64 %39, %9
  %43 = getelementptr inbounds i32, i32* %21, i64 %42
  store i32 %41, i32* %43, align 4, !tbaa !2
  %44 = add nuw nsw i64 %23, 4
  %45 = add i64 %24, -4
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %22

47:                                               ; preds = %22, %17
  %48 = phi i64 [ 0, %17 ], [ %44, %22 ]
  br i1 %16, label %59, label %49

49:                                               ; preds = %47, %49
  %50 = phi i64 [ %56, %49 ], [ %48, %47 ]
  %51 = phi i64 [ %57, %49 ], [ %13, %47 ]
  %52 = getelementptr inbounds i32, i32* %20, i64 %50
  %53 = load i32, i32* %52, align 4, !tbaa !2
  %54 = mul nsw i64 %50, %9
  %55 = getelementptr inbounds i32, i32* %21, i64 %54
  store i32 %53, i32* %55, align 4, !tbaa !2
  %56 = add nuw nsw i64 %50, 1
  %57 = add i64 %51, -1
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %59, label %49, !llvm.loop !6

59:                                               ; preds = %49, %47
  %60 = add nuw nsw i64 %18, 1
  %61 = icmp eq i64 %60, %10
  br i1 %61, label %62, label %17

62:                                               ; preds = %59, %4
  ret void
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

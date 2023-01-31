; ModuleID = './intr_fnc_test/test.c'
source_filename = "./intr_fnc_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @mx_sum_3x3([3 x i32]* nocapture readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 0, i64 0
  %3 = load i32, i32* %2, align 4, !tbaa !2
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !2
  %6 = add nsw i32 %5, %3
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !2
  %9 = add nsw i32 %6, %8
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 1
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = add nsw i32 %11, %5
  %13 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 1, i64 2
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = add nsw i32 %12, %14
  %16 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 1
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %18 = add nsw i32 %17, %8
  %19 = getelementptr inbounds [3 x i32], [3 x i32]* %0, i64 2, i64 2
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = add nsw i32 %18, %20
  %22 = icmp sgt i32 %9, %15
  %23 = select i1 %22, i32 %9, i32 %15
  %24 = icmp sgt i32 %23, %21
  %25 = select i1 %24, i32 %23, i32 %21
  ret i32 %25
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @mx_sum_open(i32* nocapture readonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  %5 = icmp sgt i32 %1, 0
  %6 = and i1 %4, %5
  br i1 %6, label %7, label %67

7:                                                ; preds = %3
  %8 = zext i32 %1 to i64
  %9 = zext i32 %2 to i64
  %10 = zext i32 %1 to i64
  %11 = add nsw i64 %10, -1
  %12 = and i64 %10, 3
  %13 = icmp ult i64 %11, 3
  %14 = sub nsw i64 %10, %12
  %15 = icmp eq i64 %12, 0
  br label %16

16:                                               ; preds = %61, %7
  %17 = phi i64 [ 0, %7 ], [ %65, %61 ]
  %18 = phi i32 [ 0, %7 ], [ %64, %61 ]
  %19 = getelementptr inbounds i32, i32* %0, i64 %17
  br i1 %13, label %46, label %20

20:                                               ; preds = %16, %20
  %21 = phi i64 [ %43, %20 ], [ 0, %16 ]
  %22 = phi i32 [ %42, %20 ], [ 0, %16 ]
  %23 = phi i64 [ %44, %20 ], [ %14, %16 ]
  %24 = mul nsw i64 %21, %8
  %25 = getelementptr inbounds i32, i32* %19, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !2
  %27 = add nsw i32 %26, %22
  %28 = or i64 %21, 1
  %29 = mul nsw i64 %28, %8
  %30 = getelementptr inbounds i32, i32* %19, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %32 = add nsw i32 %31, %27
  %33 = or i64 %21, 2
  %34 = mul nsw i64 %33, %8
  %35 = getelementptr inbounds i32, i32* %19, i64 %34
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = add nsw i32 %36, %32
  %38 = or i64 %21, 3
  %39 = mul nsw i64 %38, %8
  %40 = getelementptr inbounds i32, i32* %19, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !2
  %42 = add nsw i32 %41, %37
  %43 = add nuw nsw i64 %21, 4
  %44 = add i64 %23, -4
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %46, label %20

46:                                               ; preds = %20, %16
  %47 = phi i32 [ undef, %16 ], [ %42, %20 ]
  %48 = phi i64 [ 0, %16 ], [ %43, %20 ]
  %49 = phi i32 [ 0, %16 ], [ %42, %20 ]
  br i1 %15, label %61, label %50

50:                                               ; preds = %46, %50
  %51 = phi i64 [ %58, %50 ], [ %48, %46 ]
  %52 = phi i32 [ %57, %50 ], [ %49, %46 ]
  %53 = phi i64 [ %59, %50 ], [ %12, %46 ]
  %54 = mul nsw i64 %51, %8
  %55 = getelementptr inbounds i32, i32* %19, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !2
  %57 = add nsw i32 %56, %52
  %58 = add nuw nsw i64 %51, 1
  %59 = add i64 %53, -1
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %61, label %50, !llvm.loop !6

61:                                               ; preds = %50, %46
  %62 = phi i32 [ %47, %46 ], [ %57, %50 ]
  %63 = icmp sgt i32 %18, %62
  %64 = select i1 %63, i32 %18, i32 %62
  %65 = add nuw nsw i64 %17, 1
  %66 = icmp eq i64 %65, %9
  br i1 %66, label %67, label %16

67:                                               ; preds = %61, %3
  %68 = phi i32 [ 0, %3 ], [ %64, %61 ]
  ret i32 %68
}

attributes #0 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

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

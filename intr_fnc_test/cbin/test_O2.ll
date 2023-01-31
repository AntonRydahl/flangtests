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
  br i1 %4, label %5, label %20

5:                                                ; preds = %3
  %6 = icmp sgt i32 %1, 0
  %7 = sext i32 %1 to i64
  %8 = zext i32 %2 to i64
  %9 = zext i32 %1 to i64
  %10 = add nsw i64 %9, -1
  %11 = and i64 %9, 3
  %12 = icmp ult i64 %10, 3
  %13 = sub nsw i64 %9, %11
  %14 = icmp eq i64 %11, 0
  br label %15

15:                                               ; preds = %37, %5
  %16 = phi i64 [ 0, %5 ], [ %41, %37 ]
  %17 = phi i32 [ 0, %5 ], [ %40, %37 ]
  br i1 %6, label %18, label %37

18:                                               ; preds = %15
  %19 = getelementptr inbounds i32, i32* %0, i64 %16
  br i1 %12, label %22, label %43

20:                                               ; preds = %37, %3
  %21 = phi i32 [ 0, %3 ], [ %40, %37 ]
  ret i32 %21

22:                                               ; preds = %43, %18
  %23 = phi i32 [ undef, %18 ], [ %65, %43 ]
  %24 = phi i64 [ 0, %18 ], [ %66, %43 ]
  %25 = phi i32 [ 0, %18 ], [ %65, %43 ]
  br i1 %14, label %37, label %26

26:                                               ; preds = %22, %26
  %27 = phi i64 [ %34, %26 ], [ %24, %22 ]
  %28 = phi i32 [ %33, %26 ], [ %25, %22 ]
  %29 = phi i64 [ %35, %26 ], [ %11, %22 ]
  %30 = mul nsw i64 %27, %7
  %31 = getelementptr inbounds i32, i32* %19, i64 %30
  %32 = load i32, i32* %31, align 4, !tbaa !2
  %33 = add nsw i32 %32, %28
  %34 = add nuw nsw i64 %27, 1
  %35 = add i64 %29, -1
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %26, !llvm.loop !6

37:                                               ; preds = %22, %26, %15
  %38 = phi i32 [ 0, %15 ], [ %23, %22 ], [ %33, %26 ]
  %39 = icmp sgt i32 %17, %38
  %40 = select i1 %39, i32 %17, i32 %38
  %41 = add nuw nsw i64 %16, 1
  %42 = icmp eq i64 %41, %8
  br i1 %42, label %20, label %15

43:                                               ; preds = %18, %43
  %44 = phi i64 [ %66, %43 ], [ 0, %18 ]
  %45 = phi i32 [ %65, %43 ], [ 0, %18 ]
  %46 = phi i64 [ %67, %43 ], [ %13, %18 ]
  %47 = mul nsw i64 %44, %7
  %48 = getelementptr inbounds i32, i32* %19, i64 %47
  %49 = load i32, i32* %48, align 4, !tbaa !2
  %50 = add nsw i32 %49, %45
  %51 = or i64 %44, 1
  %52 = mul nsw i64 %51, %7
  %53 = getelementptr inbounds i32, i32* %19, i64 %52
  %54 = load i32, i32* %53, align 4, !tbaa !2
  %55 = add nsw i32 %54, %50
  %56 = or i64 %44, 2
  %57 = mul nsw i64 %56, %7
  %58 = getelementptr inbounds i32, i32* %19, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !2
  %60 = add nsw i32 %59, %55
  %61 = or i64 %44, 3
  %62 = mul nsw i64 %61, %7
  %63 = getelementptr inbounds i32, i32* %19, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !2
  %65 = add nsw i32 %64, %60
  %66 = add nuw nsw i64 %44, 4
  %67 = add i64 %46, -4
  %68 = icmp eq i64 %67, 0
  br i1 %68, label %22, label %43
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

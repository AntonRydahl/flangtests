; ModuleID = './max_fnc_test/test.c'
source_filename = "./max_fnc_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @mval_open(i32* nocapture readonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %79

4:                                                ; preds = %2
  %5 = zext i32 %1 to i64
  %6 = icmp ult i32 %1, 8
  br i1 %6, label %7, label %10

7:                                                ; preds = %66, %4
  %8 = phi i64 [ 0, %4 ], [ %11, %66 ]
  %9 = phi i32 [ 0, %4 ], [ %77, %66 ]
  br label %81

10:                                               ; preds = %4
  %11 = and i64 %5, 4294967288
  %12 = add nsw i64 %11, -8
  %13 = lshr exact i64 %12, 3
  %14 = add nuw nsw i64 %13, 1
  %15 = and i64 %14, 1
  %16 = icmp eq i64 %12, 0
  br i1 %16, label %48, label %17

17:                                               ; preds = %10
  %18 = sub nuw nsw i64 %14, %15
  br label %19

19:                                               ; preds = %19, %17
  %20 = phi i64 [ 0, %17 ], [ %45, %19 ]
  %21 = phi <4 x i32> [ zeroinitializer, %17 ], [ %43, %19 ]
  %22 = phi <4 x i32> [ zeroinitializer, %17 ], [ %44, %19 ]
  %23 = phi i64 [ %18, %17 ], [ %46, %19 ]
  %24 = getelementptr inbounds i32, i32* %0, i64 %20
  %25 = bitcast i32* %24 to <4 x i32>*
  %26 = load <4 x i32>, <4 x i32>* %25, align 4, !tbaa !2
  %27 = getelementptr inbounds i32, i32* %24, i64 4
  %28 = bitcast i32* %27 to <4 x i32>*
  %29 = load <4 x i32>, <4 x i32>* %28, align 4, !tbaa !2
  %30 = icmp sgt <4 x i32> %21, %26
  %31 = icmp sgt <4 x i32> %22, %29
  %32 = select <4 x i1> %30, <4 x i32> %21, <4 x i32> %26
  %33 = select <4 x i1> %31, <4 x i32> %22, <4 x i32> %29
  %34 = or i64 %20, 8
  %35 = getelementptr inbounds i32, i32* %0, i64 %34
  %36 = bitcast i32* %35 to <4 x i32>*
  %37 = load <4 x i32>, <4 x i32>* %36, align 4, !tbaa !2
  %38 = getelementptr inbounds i32, i32* %35, i64 4
  %39 = bitcast i32* %38 to <4 x i32>*
  %40 = load <4 x i32>, <4 x i32>* %39, align 4, !tbaa !2
  %41 = icmp sgt <4 x i32> %32, %37
  %42 = icmp sgt <4 x i32> %33, %40
  %43 = select <4 x i1> %41, <4 x i32> %32, <4 x i32> %37
  %44 = select <4 x i1> %42, <4 x i32> %33, <4 x i32> %40
  %45 = add i64 %20, 16
  %46 = add i64 %23, -2
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %48, label %19, !llvm.loop !6

48:                                               ; preds = %19, %10
  %49 = phi <4 x i32> [ undef, %10 ], [ %43, %19 ]
  %50 = phi <4 x i32> [ undef, %10 ], [ %44, %19 ]
  %51 = phi i64 [ 0, %10 ], [ %45, %19 ]
  %52 = phi <4 x i32> [ zeroinitializer, %10 ], [ %43, %19 ]
  %53 = phi <4 x i32> [ zeroinitializer, %10 ], [ %44, %19 ]
  %54 = icmp eq i64 %15, 0
  br i1 %54, label %66, label %55

55:                                               ; preds = %48
  %56 = getelementptr inbounds i32, i32* %0, i64 %51
  %57 = bitcast i32* %56 to <4 x i32>*
  %58 = load <4 x i32>, <4 x i32>* %57, align 4, !tbaa !2
  %59 = getelementptr inbounds i32, i32* %56, i64 4
  %60 = bitcast i32* %59 to <4 x i32>*
  %61 = load <4 x i32>, <4 x i32>* %60, align 4, !tbaa !2
  %62 = icmp sgt <4 x i32> %53, %61
  %63 = select <4 x i1> %62, <4 x i32> %53, <4 x i32> %61
  %64 = icmp sgt <4 x i32> %52, %58
  %65 = select <4 x i1> %64, <4 x i32> %52, <4 x i32> %58
  br label %66

66:                                               ; preds = %48, %55
  %67 = phi <4 x i32> [ %49, %48 ], [ %65, %55 ]
  %68 = phi <4 x i32> [ %50, %48 ], [ %63, %55 ]
  %69 = icmp sgt <4 x i32> %67, %68
  %70 = select <4 x i1> %69, <4 x i32> %67, <4 x i32> %68
  %71 = shufflevector <4 x i32> %70, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %72 = icmp sgt <4 x i32> %70, %71
  %73 = select <4 x i1> %72, <4 x i32> %70, <4 x i32> %71
  %74 = shufflevector <4 x i32> %73, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %75 = icmp sgt <4 x i32> %73, %74
  %76 = select <4 x i1> %75, <4 x i32> %73, <4 x i32> %74
  %77 = extractelement <4 x i32> %76, i32 0
  %78 = icmp eq i64 %11, %5
  br i1 %78, label %79, label %7

79:                                               ; preds = %81, %66, %2
  %80 = phi i32 [ 0, %2 ], [ %77, %66 ], [ %87, %81 ]
  ret i32 %80

81:                                               ; preds = %7, %81
  %82 = phi i64 [ %88, %81 ], [ %8, %7 ]
  %83 = phi i32 [ %87, %81 ], [ %9, %7 ]
  %84 = getelementptr inbounds i32, i32* %0, i64 %82
  %85 = load i32, i32* %84, align 4, !tbaa !2
  %86 = icmp sgt i32 %83, %85
  %87 = select i1 %86, i32 %83, i32 %85
  %88 = add nuw nsw i64 %82, 1
  %89 = icmp eq i64 %88, %5
  br i1 %89, label %79, label %81, !llvm.loop !8
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @mval_closed(i32* nocapture readonly %0) local_unnamed_addr #0 {
  %2 = load i32, i32* %0, align 4, !tbaa !2
  %3 = getelementptr inbounds i32, i32* %0, i64 1
  %4 = load i32, i32* %3, align 4, !tbaa !2
  %5 = icmp sgt i32 %2, %4
  %6 = select i1 %5, i32 %2, i32 %4
  %7 = getelementptr inbounds i32, i32* %0, i64 2
  %8 = load i32, i32* %7, align 4, !tbaa !2
  %9 = icmp sgt i32 %6, %8
  %10 = select i1 %9, i32 %6, i32 %8
  ret i32 %10
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
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = distinct !{!8, !9, !7}
!9 = !{!"llvm.loop.unroll.runtime.disable"}

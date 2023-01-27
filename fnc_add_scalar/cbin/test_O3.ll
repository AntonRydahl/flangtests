; ModuleID = './fnc_add_scalar/test.c'
source_filename = "./fnc_add_scalar/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @add_arr(i32* nocapture readonly %0, i32* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %91

5:                                                ; preds = %3
  %6 = zext i32 %2 to i64
  %7 = icmp ult i32 %2, 8
  br i1 %7, label %8, label %27

8:                                                ; preds = %89, %27, %5
  %9 = phi i64 [ 0, %27 ], [ 0, %5 ], [ %34, %89 ]
  %10 = xor i64 %9, -1
  %11 = add nsw i64 %10, %6
  %12 = and i64 %6, 3
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %24, label %14

14:                                               ; preds = %8, %14
  %15 = phi i64 [ %21, %14 ], [ %9, %8 ]
  %16 = phi i64 [ %22, %14 ], [ %12, %8 ]
  %17 = getelementptr inbounds i32, i32* %0, i64 %15
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = add nsw i32 %18, 27
  %20 = getelementptr inbounds i32, i32* %1, i64 %15
  store i32 %19, i32* %20, align 4, !tbaa !2
  %21 = add nuw nsw i64 %15, 1
  %22 = add i64 %16, -1
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %24, label %14, !llvm.loop !6

24:                                               ; preds = %14, %8
  %25 = phi i64 [ %9, %8 ], [ %21, %14 ]
  %26 = icmp ult i64 %11, 3
  br i1 %26, label %91, label %92

27:                                               ; preds = %5
  %28 = getelementptr i32, i32* %1, i64 %6
  %29 = getelementptr i32, i32* %0, i64 %6
  %30 = icmp ugt i32* %29, %1
  %31 = icmp ugt i32* %28, %0
  %32 = and i1 %30, %31
  br i1 %32, label %8, label %33

33:                                               ; preds = %27
  %34 = and i64 %6, 4294967288
  %35 = add nsw i64 %34, -8
  %36 = lshr exact i64 %35, 3
  %37 = add nuw nsw i64 %36, 1
  %38 = and i64 %37, 1
  %39 = icmp eq i64 %35, 0
  br i1 %39, label %73, label %40

40:                                               ; preds = %33
  %41 = sub nuw nsw i64 %37, %38
  br label %42

42:                                               ; preds = %42, %40
  %43 = phi i64 [ 0, %40 ], [ %70, %42 ]
  %44 = phi i64 [ %41, %40 ], [ %71, %42 ]
  %45 = getelementptr inbounds i32, i32* %0, i64 %43
  %46 = bitcast i32* %45 to <4 x i32>*
  %47 = load <4 x i32>, <4 x i32>* %46, align 4, !tbaa !2, !alias.scope !8
  %48 = getelementptr inbounds i32, i32* %45, i64 4
  %49 = bitcast i32* %48 to <4 x i32>*
  %50 = load <4 x i32>, <4 x i32>* %49, align 4, !tbaa !2, !alias.scope !8
  %51 = add nsw <4 x i32> %47, <i32 27, i32 27, i32 27, i32 27>
  %52 = add nsw <4 x i32> %50, <i32 27, i32 27, i32 27, i32 27>
  %53 = getelementptr inbounds i32, i32* %1, i64 %43
  %54 = bitcast i32* %53 to <4 x i32>*
  store <4 x i32> %51, <4 x i32>* %54, align 4, !tbaa !2, !alias.scope !11, !noalias !8
  %55 = getelementptr inbounds i32, i32* %53, i64 4
  %56 = bitcast i32* %55 to <4 x i32>*
  store <4 x i32> %52, <4 x i32>* %56, align 4, !tbaa !2, !alias.scope !11, !noalias !8
  %57 = or i64 %43, 8
  %58 = getelementptr inbounds i32, i32* %0, i64 %57
  %59 = bitcast i32* %58 to <4 x i32>*
  %60 = load <4 x i32>, <4 x i32>* %59, align 4, !tbaa !2, !alias.scope !8
  %61 = getelementptr inbounds i32, i32* %58, i64 4
  %62 = bitcast i32* %61 to <4 x i32>*
  %63 = load <4 x i32>, <4 x i32>* %62, align 4, !tbaa !2, !alias.scope !8
  %64 = add nsw <4 x i32> %60, <i32 27, i32 27, i32 27, i32 27>
  %65 = add nsw <4 x i32> %63, <i32 27, i32 27, i32 27, i32 27>
  %66 = getelementptr inbounds i32, i32* %1, i64 %57
  %67 = bitcast i32* %66 to <4 x i32>*
  store <4 x i32> %64, <4 x i32>* %67, align 4, !tbaa !2, !alias.scope !11, !noalias !8
  %68 = getelementptr inbounds i32, i32* %66, i64 4
  %69 = bitcast i32* %68 to <4 x i32>*
  store <4 x i32> %65, <4 x i32>* %69, align 4, !tbaa !2, !alias.scope !11, !noalias !8
  %70 = add i64 %43, 16
  %71 = add i64 %44, -2
  %72 = icmp eq i64 %71, 0
  br i1 %72, label %73, label %42, !llvm.loop !13

73:                                               ; preds = %42, %33
  %74 = phi i64 [ 0, %33 ], [ %70, %42 ]
  %75 = icmp eq i64 %38, 0
  br i1 %75, label %89, label %76

76:                                               ; preds = %73
  %77 = getelementptr inbounds i32, i32* %0, i64 %74
  %78 = bitcast i32* %77 to <4 x i32>*
  %79 = load <4 x i32>, <4 x i32>* %78, align 4, !tbaa !2, !alias.scope !8
  %80 = getelementptr inbounds i32, i32* %77, i64 4
  %81 = bitcast i32* %80 to <4 x i32>*
  %82 = load <4 x i32>, <4 x i32>* %81, align 4, !tbaa !2, !alias.scope !8
  %83 = add nsw <4 x i32> %79, <i32 27, i32 27, i32 27, i32 27>
  %84 = add nsw <4 x i32> %82, <i32 27, i32 27, i32 27, i32 27>
  %85 = getelementptr inbounds i32, i32* %1, i64 %74
  %86 = bitcast i32* %85 to <4 x i32>*
  store <4 x i32> %83, <4 x i32>* %86, align 4, !tbaa !2, !alias.scope !11, !noalias !8
  %87 = getelementptr inbounds i32, i32* %85, i64 4
  %88 = bitcast i32* %87 to <4 x i32>*
  store <4 x i32> %84, <4 x i32>* %88, align 4, !tbaa !2, !alias.scope !11, !noalias !8
  br label %89

89:                                               ; preds = %73, %76
  %90 = icmp eq i64 %34, %6
  br i1 %90, label %91, label %8

91:                                               ; preds = %24, %92, %89, %3
  ret void

92:                                               ; preds = %24, %92
  %93 = phi i64 [ %113, %92 ], [ %25, %24 ]
  %94 = getelementptr inbounds i32, i32* %0, i64 %93
  %95 = load i32, i32* %94, align 4, !tbaa !2
  %96 = add nsw i32 %95, 27
  %97 = getelementptr inbounds i32, i32* %1, i64 %93
  store i32 %96, i32* %97, align 4, !tbaa !2
  %98 = add nuw nsw i64 %93, 1
  %99 = getelementptr inbounds i32, i32* %0, i64 %98
  %100 = load i32, i32* %99, align 4, !tbaa !2
  %101 = add nsw i32 %100, 27
  %102 = getelementptr inbounds i32, i32* %1, i64 %98
  store i32 %101, i32* %102, align 4, !tbaa !2
  %103 = add nuw nsw i64 %93, 2
  %104 = getelementptr inbounds i32, i32* %0, i64 %103
  %105 = load i32, i32* %104, align 4, !tbaa !2
  %106 = add nsw i32 %105, 27
  %107 = getelementptr inbounds i32, i32* %1, i64 %103
  store i32 %106, i32* %107, align 4, !tbaa !2
  %108 = add nuw nsw i64 %93, 3
  %109 = getelementptr inbounds i32, i32* %0, i64 %108
  %110 = load i32, i32* %109, align 4, !tbaa !2
  %111 = add nsw i32 %110, 27
  %112 = getelementptr inbounds i32, i32* %1, i64 %108
  store i32 %111, i32* %112, align 4, !tbaa !2
  %113 = add nuw nsw i64 %93, 4
  %114 = icmp eq i64 %113, %6
  br i1 %114, label %91, label %92, !llvm.loop !15
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = distinct !{!15, !14}

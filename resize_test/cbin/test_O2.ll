; ModuleID = './resize_test/test.c'
source_filename = "./resize_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @resh(i32* nocapture readonly %0, [3 x i32]* nocapture %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %0, align 4, !tbaa !2
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  store i32 %3, i32* %4, align 4, !tbaa !2
  %5 = getelementptr inbounds i32, i32* %0, i64 1
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1
  store i32 %6, i32* %7, align 4, !tbaa !2
  %8 = getelementptr inbounds i32, i32* %0, i64 2
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2
  store i32 %9, i32* %10, align 4, !tbaa !2
  %11 = getelementptr inbounds i32, i32* %0, i64 3
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 0
  store i32 %12, i32* %13, align 4, !tbaa !2
  %14 = getelementptr inbounds i32, i32* %0, i64 4
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 1
  store i32 %15, i32* %16, align 4, !tbaa !2
  %17 = getelementptr inbounds i32, i32* %0, i64 5
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 1, i64 2
  store i32 %18, i32* %19, align 4, !tbaa !2
  %20 = getelementptr inbounds i32, i32* %0, i64 6
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 0
  store i32 %21, i32* %22, align 4, !tbaa !2
  %23 = getelementptr inbounds i32, i32* %0, i64 7
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 1
  store i32 %24, i32* %25, align 4, !tbaa !2
  %26 = getelementptr inbounds i32, i32* %0, i64 8
  %27 = load i32, i32* %26, align 4, !tbaa !2
  %28 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 2, i64 2
  store i32 %27, i32* %28, align 4, !tbaa !2
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i64 [ 1, %0 ], [ %3, %1 ]
  %3 = add nuw nsw i64 %2, 25
  %4 = icmp eq i64 %3, 100001
  br i1 %4, label %5, label %1

5:                                                ; preds = %1
  %6 = trunc i64 %3 to i32
  %7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %6)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}

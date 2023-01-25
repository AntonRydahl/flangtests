; ModuleID = './fnc_add_arrays/test.c'
source_filename = "./fnc_add_arrays/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32* @add_arr(i32* returned %0, i32* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %1, align 4, !tbaa !2
  %4 = load i32, i32* %0, align 4, !tbaa !2
  %5 = add nsw i32 %4, %3
  store i32 %5, i32* %0, align 4, !tbaa !2
  %6 = getelementptr inbounds i32, i32* %1, i64 1
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %8 = getelementptr inbounds i32, i32* %0, i64 1
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %10 = add nsw i32 %9, %7
  store i32 %10, i32* %8, align 4, !tbaa !2
  %11 = getelementptr inbounds i32, i32* %1, i64 2
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = getelementptr inbounds i32, i32* %0, i64 2
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = add nsw i32 %14, %12
  store i32 %15, i32* %13, align 4, !tbaa !2
  ret i32* %0
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

; ModuleID = 'src/loop_reduction.c'
source_filename = "src/loop_reduction.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"The result of sum(arr[0:%d]) is %1.9lf\0A\00", align 1

; Function Attrs: nofree nounwind
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  %call3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1048575, double noundef %add.7)
  ret i32 0

for.body:                                         ; preds = %for.body, %entry
  %i.011 = phi i32 [ 0, %entry ], [ %inc.7, %for.body ]
  %sum.010 = phi double [ 0.000000e+00, %entry ], [ %add.7, %for.body ]
  %add = fadd double %sum.010, 0x3EB0000000000000
  %add.1 = fadd double %add, 0x3EB0000000000000
  %add.2 = fadd double %add.1, 0x3EB0000000000000
  %add.3 = fadd double %add.2, 0x3EB0000000000000
  %add.4 = fadd double %add.3, 0x3EB0000000000000
  %add.5 = fadd double %add.4, 0x3EB0000000000000
  %add.6 = fadd double %add.5, 0x3EB0000000000000
  %add.7 = fadd double %add.6, 0x3EB0000000000000
  %inc.7 = add nuw nsw i32 %i.011, 8
  %exitcond.not.7 = icmp eq i32 %inc.7, 1048576
  br i1 %exitcond.not.7, label %for.cond.cleanup, label %for.body, !llvm.loop !2
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

attributes #0 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2e4e218474320abf480c39d3b968a5a09477ad03)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}

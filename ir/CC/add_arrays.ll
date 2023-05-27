; ModuleID = 'src/add_arrays.c'
source_filename = "src/add_arrays.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 17, i32 27, i32 37], align 4
@__const.main.b = private unnamed_addr constant [3 x i32] [i32 44, i32 55, i32 66], align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [3 x i32], align 4
  %b = alloca [3 x i32], align 4
  %c = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i5 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %a, ptr align 4 @__const.main.a, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %b, ptr align 4 @__const.main.b, i64 12, i1 false)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr %a, i64 0, i64 %idxprom
  %2 = load i32, ptr %arrayidx, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %b, i64 0, i64 %idxprom1
  %4 = load i32, ptr %arrayidx2, align 4
  %add = add nsw i32 %2, %4
  %5 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %c, i64 0, i64 %idxprom3
  store i32 %add, ptr %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, ptr %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i5, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i32, ptr %i5, align 4
  %cmp7 = icmp slt i32 %7, 3
  br i1 %cmp7, label %for.body8, label %for.end13

for.body8:                                        ; preds = %for.cond6
  %8 = load i32, ptr %i5, align 4
  %idxprom9 = sext i32 %8 to i64
  %arrayidx10 = getelementptr inbounds [3 x i32], ptr %c, i64 0, i64 %idxprom9
  %9 = load i32, ptr %arrayidx10, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9)
  br label %for.inc11

for.inc11:                                        ; preds = %for.body8
  %10 = load i32, ptr %i5, align 4
  %inc12 = add nsw i32 %10, 1
  store i32 %inc12, ptr %i5, align 4
  br label %for.cond6, !llvm.loop !6

for.end13:                                        ; preds = %for.cond6
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git fca4e2add0f8b0471e4dbae5cf647006ec360bb2)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}

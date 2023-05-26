; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QMtestPadd_arr(ptr %0, ptr %1) {
  br label %3

3:                                                ; preds = %7, %2
  %4 = phi i64 [ %8, %7 ], [ 0, %2 ]
  %5 = phi i64 [ %22, %7 ], [ 3, %2 ]
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %23

7:                                                ; preds = %3
  %8 = add i64 %4, 1
  %9 = sub i64 %8, 1
  %10 = mul i64 %9, 1
  %11 = mul i64 %10, 1
  %12 = add i64 %11, 0
  %13 = getelementptr i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = sub i64 %8, 1
  %16 = mul i64 %15, 1
  %17 = mul i64 %16, 1
  %18 = add i64 %17, 0
  %19 = getelementptr i32, ptr %1, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = add i32 %14, %20
  store i32 %21, ptr %13, align 4
  %22 = sub i64 %5, 1
  br label %3

23:                                               ; preds = %3
  ret void
}

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

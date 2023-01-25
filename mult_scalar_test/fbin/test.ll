; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEa = internal global [3 x i32] [i32 1, i32 2, i32 3]
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  br label %1

1:                                                ; preds = %5, %0
  %2 = phi i64 [ %6, %5 ], [ 0, %0 ]
  %3 = phi i64 [ %14, %5 ], [ 3, %0 ]
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %15

5:                                                ; preds = %1
  %6 = add i64 %2, 1
  %7 = sub i64 %6, 1
  %8 = mul i64 %7, 1
  %9 = mul i64 %8, 1
  %10 = add i64 %9, 0
  %11 = getelementptr i32, ptr @_QFEa, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = mul i32 %12, 5
  store i32 %13, ptr %11, align 4
  %14 = sub i64 %3, 1
  br label %1

15:                                               ; preds = %1
  ret void
}

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

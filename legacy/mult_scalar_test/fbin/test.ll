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

define void @_QFPmult_scalar(ptr %0, ptr %1) {
  %3 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 0, i32 0
  %4 = load i64, ptr %3, align 8
  %5 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 0, i32 1
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = icmp sgt i64 %6, 0
  %10 = select i1 %9, i64 %6, i64 0
  br label %11

11:                                               ; preds = %15, %2
  %12 = phi i64 [ %16, %15 ], [ 0, %2 ]
  %13 = phi i64 [ %34, %15 ], [ %10, %2 ]
  %14 = icmp sgt i64 %13, 0
  br i1 %14, label %15, label %35

15:                                               ; preds = %11
  %16 = add i64 %12, 1
  %17 = sub i64 %16, 1
  %18 = mul i64 %17, 1
  %19 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i32 0, i32 7, i32 0, i32 2
  %20 = load i64, ptr %19, align 8
  %21 = mul i64 %18, %20
  %22 = add i64 %21, 0
  %23 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr i8, ptr %24, i64 %22
  %26 = load i32, ptr %25, align 4
  %27 = mul i32 %26, 27
  %28 = sub i64 %16, 1
  %29 = mul i64 %28, 1
  %30 = mul i64 %29, 1
  %31 = add i64 %30, 0
  %32 = mul i64 1, %10
  %33 = getelementptr i32, ptr %0, i64 %31
  store i32 %27, ptr %33, align 4
  %34 = sub i64 %13, 1
  br label %11

35:                                               ; preds = %11
  ret void
}

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

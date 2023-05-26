; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQro.3xi4.7f4c4044fd6a6d315c6d6ebd14f51c65 = internal constant [3 x i32] [i32 222, i32 48, i32 888]
@_QQcl.2E2F2E2F6469765F7363616C61725F746573742F746573742E66393000 = linkonce constant [29 x i8] c"././div_scalar_test/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca [3 x i32], i64 1, align 4
  br label %3

3:                                                ; preds = %7, %0
  %4 = phi i64 [ %8, %7 ], [ 0, %0 ]
  %5 = phi i64 [ %20, %7 ], [ 3, %0 ]
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %21

7:                                                ; preds = %3
  %8 = add i64 %4, 1
  %9 = sub i64 %8, 1
  %10 = mul i64 %9, 1
  %11 = mul i64 %10, 1
  %12 = add i64 %11, 0
  %13 = getelementptr i32, ptr @_QQro.3xi4.7f4c4044fd6a6d315c6d6ebd14f51c65, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = sub i64 %8, 1
  %16 = mul i64 %15, 1
  %17 = mul i64 %16, 1
  %18 = add i64 %17, 0
  %19 = getelementptr i32, ptr %2, i64 %18
  store i32 %14, ptr %19, align 4
  %20 = sub i64 %5, 1
  br label %3

21:                                               ; preds = %25, %3
  %22 = phi i64 [ %26, %25 ], [ 0, %3 ]
  %23 = phi i64 [ %34, %25 ], [ 3, %3 ]
  %24 = icmp sgt i64 %23, 0
  br i1 %24, label %25, label %35

25:                                               ; preds = %21
  %26 = add i64 %22, 1
  %27 = sub i64 %26, 1
  %28 = mul i64 %27, 1
  %29 = mul i64 %28, 1
  %30 = add i64 %29, 0
  %31 = getelementptr i32, ptr %2, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = sdiv i32 %32, 2
  store i32 %33, ptr %31, align 4
  %34 = sub i64 %23, 1
  br label %21

35:                                               ; preds = %21
  %36 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F6469765F7363616C61725F746573742F746573742E66393000, i32 5)
  %37 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %2, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %37, ptr %1, align 8
  %38 = call i1 @_FortranAioOutputDescriptor(ptr %36, ptr %1)
  %39 = call i32 @_FortranAioEndIoStatement(ptr %36)
  ret void
}

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputDescriptor(ptr, ptr)

declare i32 @_FortranAioEndIoStatement(ptr)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

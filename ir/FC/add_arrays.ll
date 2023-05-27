; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQro.3xi4.0 = internal constant [3 x i32] [i32 17, i32 27, i32 37]
@_QQro.3xi4.1 = internal constant [3 x i32] [i32 44, i32 55, i32 66]
@_QQcl.7ea792921c5b3640cb23b7fec8edc2e5 = internal constant [45 x i8] c"/g/g92/rydahl1/flangtests/src/add_arrays.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca [3 x i32], i64 1, align 4
  %3 = alloca [3 x i32], i64 1, align 4
  %4 = alloca [3 x i32], i64 1, align 4
  br label %5

5:                                                ; preds = %9, %0
  %6 = phi i64 [ %10, %9 ], [ 0, %0 ]
  %7 = phi i64 [ %22, %9 ], [ 3, %0 ]
  %8 = icmp sgt i64 %7, 0
  br i1 %8, label %9, label %23

9:                                                ; preds = %5
  %10 = add i64 %6, 1
  %11 = sub i64 %10, 1
  %12 = mul i64 %11, 1
  %13 = mul i64 %12, 1
  %14 = add i64 %13, 0
  %15 = getelementptr i32, ptr @_QQro.3xi4.0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = sub i64 %10, 1
  %18 = mul i64 %17, 1
  %19 = mul i64 %18, 1
  %20 = add i64 %19, 0
  %21 = getelementptr i32, ptr %2, i64 %20
  store i32 %16, ptr %21, align 4
  %22 = sub i64 %7, 1
  br label %5

23:                                               ; preds = %5
  br label %24

24:                                               ; preds = %28, %23
  %25 = phi i64 [ %29, %28 ], [ 0, %23 ]
  %26 = phi i64 [ %41, %28 ], [ 3, %23 ]
  %27 = icmp sgt i64 %26, 0
  br i1 %27, label %28, label %42

28:                                               ; preds = %24
  %29 = add i64 %25, 1
  %30 = sub i64 %29, 1
  %31 = mul i64 %30, 1
  %32 = mul i64 %31, 1
  %33 = add i64 %32, 0
  %34 = getelementptr i32, ptr @_QQro.3xi4.1, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = sub i64 %29, 1
  %37 = mul i64 %36, 1
  %38 = mul i64 %37, 1
  %39 = add i64 %38, 0
  %40 = getelementptr i32, ptr %3, i64 %39
  store i32 %35, ptr %40, align 4
  %41 = sub i64 %26, 1
  br label %24

42:                                               ; preds = %46, %24
  %43 = phi i64 [ %47, %46 ], [ 0, %24 ]
  %44 = phi i64 [ %66, %46 ], [ 3, %24 ]
  %45 = icmp sgt i64 %44, 0
  br i1 %45, label %46, label %67

46:                                               ; preds = %42
  %47 = add i64 %43, 1
  %48 = sub i64 %47, 1
  %49 = mul i64 %48, 1
  %50 = mul i64 %49, 1
  %51 = add i64 %50, 0
  %52 = getelementptr i32, ptr %2, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = sub i64 %47, 1
  %55 = mul i64 %54, 1
  %56 = mul i64 %55, 1
  %57 = add i64 %56, 0
  %58 = getelementptr i32, ptr %3, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = add i32 %53, %59
  %61 = sub i64 %47, 1
  %62 = mul i64 %61, 1
  %63 = mul i64 %62, 1
  %64 = add i64 %63, 0
  %65 = getelementptr i32, ptr %4, i64 %64
  store i32 %60, ptr %65, align 4
  %66 = sub i64 %44, 1
  br label %42

67:                                               ; preds = %42
  %68 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.7ea792921c5b3640cb23b7fec8edc2e5, i32 7)
  %69 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %4, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %69, ptr %1, align 8
  %70 = call i1 @_FortranAioOutputDescriptor(ptr %68, ptr %1)
  %71 = call i32 @_FortranAioEndIoStatement(ptr %68)
  ret void
}

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare zeroext i1 @_FortranAioOutputDescriptor(ptr, ptr)

declare i32 @_FortranAioEndIoStatement(ptr)

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

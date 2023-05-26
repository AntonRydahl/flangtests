; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQro.6xi4.e46c53dbdc08a15a46b5c2f5d95a14b0 = internal constant [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6]
@_QQcl.2E2F2E2F736372617463687061642F746573742E66393000 = linkonce constant [24 x i8] c"././scratchpad/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca i64, i64 1, align 8
  %3 = alloca i64, i64 1, align 8
  %4 = alloca [6 x i32], i64 1, align 4
  %5 = alloca [7 x i32], i64 1, align 4
  br label %6

6:                                                ; preds = %10, %0
  %7 = phi i64 [ %11, %10 ], [ 0, %0 ]
  %8 = phi i64 [ %23, %10 ], [ 6, %0 ]
  %9 = icmp sgt i64 %8, 0
  br i1 %9, label %10, label %24

10:                                               ; preds = %6
  %11 = add i64 %7, 1
  %12 = sub i64 %11, 1
  %13 = mul i64 %12, 1
  %14 = mul i64 %13, 1
  %15 = add i64 %14, 0
  %16 = getelementptr i32, ptr @_QQro.6xi4.e46c53dbdc08a15a46b5c2f5d95a14b0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = sub i64 %11, 1
  %19 = mul i64 %18, 1
  %20 = mul i64 %19, 1
  %21 = add i64 %20, 0
  %22 = getelementptr i32, ptr %4, i64 %21
  store i32 %17, ptr %22, align 4
  %23 = sub i64 %8, 1
  br label %6

24:                                               ; preds = %6
  store i64 0, ptr %2, align 8
  %25 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([7 x i32], ptr null, i32 1) to i64))
  store i64 7, ptr %3, align 8
  %26 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([6 x i32], ptr null, i32 1) to i64))
  br label %27

27:                                               ; preds = %31, %24
  %28 = phi i64 [ %32, %31 ], [ 0, %24 ]
  %29 = phi i64 [ %44, %31 ], [ 6, %24 ]
  %30 = icmp sgt i64 %29, 0
  br i1 %30, label %31, label %45

31:                                               ; preds = %27
  %32 = add i64 %28, 1
  %33 = sub i64 %32, 1
  %34 = mul i64 %33, 1
  %35 = mul i64 %34, 1
  %36 = add i64 %35, 0
  %37 = getelementptr i32, ptr %4, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = sub i64 %32, 1
  %40 = mul i64 %39, 1
  %41 = mul i64 %40, 1
  %42 = add i64 %41, 0
  %43 = getelementptr i32, ptr %26, i64 %42
  store i32 %38, ptr %43, align 4
  %44 = sub i64 %29, 1
  br label %27

45:                                               ; preds = %27
  %46 = load i64, ptr %2, align 8
  %47 = load i64, ptr %3, align 8
  %48 = add i64 %46, 6
  %49 = icmp sle i64 %47, %48
  br i1 %49, label %50, label %54

50:                                               ; preds = %45
  %51 = mul i64 %48, 2
  store i64 %51, ptr %3, align 8
  %52 = mul i64 %51, ptrtoint (ptr getelementptr ([7 x i32], ptr null, i32 0, i64 1) to i64)
  %53 = call ptr @realloc(ptr %25, i64 %52)
  br label %54

54:                                               ; preds = %50, %45
  %55 = phi ptr [ %53, %50 ], [ %25, %45 ]
  %56 = getelementptr [7 x i32], ptr %55, i32 0, i64 %46
  call void @llvm.memcpy.p0.p0.i64(ptr %56, ptr %26, i64 mul (i64 ptrtoint (ptr getelementptr ([7 x i32], ptr null, i32 0, i64 1) to i64), i64 6), i1 false)
  store i64 %48, ptr %2, align 8
  %57 = load i64, ptr %2, align 8
  %58 = load i64, ptr %3, align 8
  %59 = add i64 %57, 1
  %60 = icmp sle i64 %58, %59
  br i1 %60, label %61, label %65

61:                                               ; preds = %54
  %62 = mul i64 %59, 2
  store i64 %62, ptr %3, align 8
  %63 = mul i64 %62, ptrtoint (ptr getelementptr ([7 x i32], ptr null, i32 0, i64 1) to i64)
  %64 = call ptr @realloc(ptr %55, i64 %63)
  br label %65

65:                                               ; preds = %61, %54
  %66 = phi ptr [ %64, %61 ], [ %55, %54 ]
  %67 = getelementptr [7 x i32], ptr %66, i32 0, i64 %57
  store i32 7, ptr %67, align 4
  store i64 %59, ptr %2, align 8
  %68 = load i64, ptr %2, align 8
  br label %69

69:                                               ; preds = %73, %65
  %70 = phi i64 [ %74, %73 ], [ 0, %65 ]
  %71 = phi i64 [ %87, %73 ], [ 7, %65 ]
  %72 = icmp sgt i64 %71, 0
  br i1 %72, label %73, label %88

73:                                               ; preds = %69
  %74 = add i64 %70, 1
  %75 = sub i64 %74, 1
  %76 = mul i64 %75, 1
  %77 = mul i64 %76, 1
  %78 = add i64 %77, 0
  %79 = mul i64 1, %68
  %80 = getelementptr i32, ptr %66, i64 %78
  %81 = load i32, ptr %80, align 4
  %82 = sub i64 %74, 1
  %83 = mul i64 %82, 1
  %84 = mul i64 %83, 1
  %85 = add i64 %84, 0
  %86 = getelementptr i32, ptr %5, i64 %85
  store i32 %81, ptr %86, align 4
  %87 = sub i64 %71, 1
  br label %69

88:                                               ; preds = %69
  call void @free(ptr %66)
  call void @free(ptr %26)
  %89 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 9)
  %90 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 7, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %5, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %90, ptr %1, align 8
  %91 = call i1 @_FortranAioOutputDescriptor(ptr %89, ptr %1)
  %92 = call i32 @_FortranAioEndIoStatement(ptr %89)
  ret void
}

declare ptr @realloc(ptr, i64)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputDescriptor(ptr, ptr)

declare i32 @_FortranAioEndIoStatement(ptr)

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

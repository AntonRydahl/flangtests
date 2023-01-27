; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEflat = internal global [9 x i32] undef
@_QFEmat = internal global [3 x [3 x i32]] undef
@_QQcl.28493029 = linkonce constant [4 x i8] c"(I0)"
@_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000 = linkonce constant [25 x i8] c"././resize_test/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca [3 x [3 x i32]], i64 1, align 4
  %2 = alloca i64, i64 1, align 8
  %3 = alloca i64, i64 1, align 8
  %4 = alloca i32, i64 1, align 4
  %5 = alloca i32, i64 1, align 4
  %6 = alloca float, i64 1, align 4
  %7 = alloca float, i64 1, align 4
  %8 = call contract double @_FortranACpuTime()
  %9 = fptrunc double %8 to float
  store float %9, ptr %6, align 4
  br label %10

10:                                               ; preds = %95, %0
  %11 = phi i32 [ %97, %95 ], [ 1, %0 ]
  %12 = phi i64 [ %98, %95 ], [ 100000, %0 ]
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %14, label %99

14:                                               ; preds = %10
  store i32 %11, ptr %5, align 4
  store i64 0, ptr %2, align 8
  %15 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 1) to i64))
  store i64 9, ptr %3, align 8
  br label %16

16:                                               ; preds = %33, %14
  %17 = phi i64 [ %36, %33 ], [ 1, %14 ]
  %18 = phi ptr [ %34, %33 ], [ %15, %14 ]
  %19 = phi i64 [ %37, %33 ], [ 9, %14 ]
  %20 = icmp sgt i64 %19, 0
  br i1 %20, label %21, label %38

21:                                               ; preds = %16
  %22 = trunc i64 %17 to i32
  %23 = load i32, ptr %4, align 4
  %24 = add i32 %22, %23
  %25 = load i64, ptr %2, align 8
  %26 = load i64, ptr %3, align 8
  %27 = add i64 %25, 1
  %28 = icmp sle i64 %26, %27
  br i1 %28, label %29, label %33

29:                                               ; preds = %21
  %30 = mul i64 %27, 2
  store i64 %30, ptr %3, align 8
  %31 = mul i64 %30, ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 0, i64 1) to i64)
  %32 = call ptr @realloc(ptr %18, i64 %31)
  br label %33

33:                                               ; preds = %29, %21
  %34 = phi ptr [ %32, %29 ], [ %18, %21 ]
  %35 = getelementptr [9 x i32], ptr %34, i32 0, i64 %25
  store i32 %24, ptr %35, align 4
  store i64 %27, ptr %2, align 8
  %36 = add i64 %17, 1
  %37 = sub i64 %19, 1
  br label %16

38:                                               ; preds = %16
  %39 = load i64, ptr %2, align 8
  br label %40

40:                                               ; preds = %44, %38
  %41 = phi i64 [ %45, %44 ], [ 0, %38 ]
  %42 = phi i64 [ %58, %44 ], [ 9, %38 ]
  %43 = icmp sgt i64 %42, 0
  br i1 %43, label %44, label %59

44:                                               ; preds = %40
  %45 = add i64 %41, 1
  %46 = sub i64 %45, 1
  %47 = mul i64 %46, 1
  %48 = mul i64 %47, 1
  %49 = add i64 %48, 0
  %50 = mul i64 1, %39
  %51 = getelementptr i32, ptr %18, i64 %49
  %52 = load i32, ptr %51, align 4
  %53 = sub i64 %45, 1
  %54 = mul i64 %53, 1
  %55 = mul i64 %54, 1
  %56 = add i64 %55, 0
  %57 = getelementptr i32, ptr @_QFEflat, i64 %56
  store i32 %52, ptr %57, align 4
  %58 = sub i64 %42, 1
  br label %40

59:                                               ; preds = %40
  call void @free(ptr %18)
  %60 = call ptr @llvm.stacksave()
  call void @_QFPresh_manual(ptr %1, ptr @_QFEflat)
  br label %61

61:                                               ; preds = %92, %59
  %62 = phi i64 [ %93, %92 ], [ 0, %59 ]
  %63 = phi i64 [ %94, %92 ], [ 3, %59 ]
  %64 = icmp sgt i64 %63, 0
  br i1 %64, label %65, label %95

65:                                               ; preds = %69, %61
  %66 = phi i64 [ %70, %69 ], [ 0, %61 ]
  %67 = phi i64 [ %91, %69 ], [ 3, %61 ]
  %68 = icmp sgt i64 %67, 0
  br i1 %68, label %69, label %92

69:                                               ; preds = %65
  %70 = add i64 %66, 1
  %71 = add i64 %62, 1
  %72 = sub i64 %70, 1
  %73 = mul i64 %72, 1
  %74 = mul i64 %73, 1
  %75 = add i64 %74, 0
  %76 = sub i64 %71, 1
  %77 = mul i64 %76, 1
  %78 = mul i64 %77, 3
  %79 = add i64 %78, %75
  %80 = getelementptr i32, ptr %1, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = sub i64 %70, 1
  %83 = mul i64 %82, 1
  %84 = mul i64 %83, 1
  %85 = add i64 %84, 0
  %86 = sub i64 %71, 1
  %87 = mul i64 %86, 1
  %88 = mul i64 %87, 3
  %89 = add i64 %88, %85
  %90 = getelementptr i32, ptr @_QFEmat, i64 %89
  store i32 %81, ptr %90, align 4
  %91 = sub i64 %67, 1
  br label %65

92:                                               ; preds = %65
  %93 = add i64 %62, 1
  %94 = sub i64 %63, 1
  br label %61

95:                                               ; preds = %61
  call void @llvm.stackrestore(ptr %60)
  %96 = load i32, ptr %5, align 4
  %97 = add i32 %96, 1
  %98 = sub i64 %12, 1
  br label %10

99:                                               ; preds = %10
  store i32 %11, ptr %5, align 4
  %100 = call contract double @_FortranACpuTime()
  %101 = fptrunc double %100 to float
  store float %101, ptr %7, align 4
  %102 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr @_QQcl.28493029, i64 4, ptr null, i32 -1, ptr @_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000, i32 13)
  %103 = load i32, ptr @_QFEmat, align 4
  %104 = call i1 @_FortranAioOutputInteger32(ptr %102, i32 %103)
  %105 = call i32 @_FortranAioEndIoStatement(ptr %102)
  %106 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000, i32 14)
  %107 = load float, ptr %7, align 4
  %108 = load float, ptr %6, align 4
  %109 = fsub contract float %107, %108
  %110 = call i1 @_FortranAioOutputReal32(ptr %106, float %109)
  %111 = call i32 @_FortranAioEndIoStatement(ptr %106)
  ret void
}

define void @_QFPresh_manual(ptr %0, ptr %1) {
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
  %11 = add i64 %10, 0
  %12 = mul i64 %11, 1
  %13 = add i64 %12, 0
  %14 = getelementptr i32, ptr %1, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = sub i64 %8, 1
  %17 = mul i64 %16, 1
  %18 = add i64 %17, 0
  %19 = mul i64 %18, 3
  %20 = add i64 %19, 0
  %21 = getelementptr i32, ptr %0, i64 %20
  store i32 %15, ptr %21, align 4
  %22 = sub i64 %5, 1
  br label %3

23:                                               ; preds = %3
  br label %24

24:                                               ; preds = %28, %23
  %25 = phi i64 [ %29, %28 ], [ 0, %23 ]
  %26 = phi i64 [ %43, %28 ], [ 3, %23 ]
  %27 = icmp sgt i64 %26, 0
  br i1 %27, label %28, label %44

28:                                               ; preds = %24
  %29 = add i64 %25, 1
  %30 = sub i64 %29, 1
  %31 = mul i64 %30, 1
  %32 = add i64 %31, 3
  %33 = mul i64 %32, 1
  %34 = add i64 %33, 0
  %35 = getelementptr i32, ptr %1, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = sub i64 %29, 1
  %38 = mul i64 %37, 1
  %39 = add i64 %38, 0
  %40 = mul i64 %39, 3
  %41 = add i64 %40, 1
  %42 = getelementptr i32, ptr %0, i64 %41
  store i32 %36, ptr %42, align 4
  %43 = sub i64 %26, 1
  br label %24

44:                                               ; preds = %24
  br label %45

45:                                               ; preds = %49, %44
  %46 = phi i64 [ %50, %49 ], [ 0, %44 ]
  %47 = phi i64 [ %64, %49 ], [ 3, %44 ]
  %48 = icmp sgt i64 %47, 0
  br i1 %48, label %49, label %65

49:                                               ; preds = %45
  %50 = add i64 %46, 1
  %51 = sub i64 %50, 1
  %52 = mul i64 %51, 1
  %53 = add i64 %52, 6
  %54 = mul i64 %53, 1
  %55 = add i64 %54, 0
  %56 = getelementptr i32, ptr %1, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = sub i64 %50, 1
  %59 = mul i64 %58, 1
  %60 = add i64 %59, 0
  %61 = mul i64 %60, 3
  %62 = add i64 %61, 2
  %63 = getelementptr i32, ptr %0, i64 %62
  store i32 %57, ptr %63, align 4
  %64 = sub i64 %47, 1
  br label %45

65:                                               ; preds = %45
  ret void
}

declare double @_FortranACpuTime()

declare ptr @realloc(ptr, i64)

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #0

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32)

declare i1 @_FortranAioOutputInteger32(ptr, i32)

declare i32 @_FortranAioEndIoStatement(ptr)

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputReal32(ptr, float)

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

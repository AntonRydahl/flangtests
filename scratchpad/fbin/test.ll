; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEnums = internal global [3 x [3 x i32]] undef
@_QQro.2xi4.6cff4ff6f4002bd1fa86b17ec9335909 = internal constant [2 x i32] [i32 3, i32 3]
@_QQcl.2E2F2E2F736372617463687061642F746573742E66393000 = linkonce constant [24 x i8] c"././scratchpad/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %6 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %7 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %8 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %9 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, i64 1, align 8
  %10 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, i64 1, align 8
  %11 = alloca i64, i64 1, align 8
  %12 = alloca i64, i64 1, align 8
  %13 = alloca i32, i64 1, align 4
  %14 = alloca i32, i64 1, align 4
  %15 = alloca i32, i64 1, align 4
  br label %16

16:                                               ; preds = %144, %0
  %17 = phi i32 [ %166, %144 ], [ 1, %0 ]
  %18 = phi i64 [ %167, %144 ], [ 100000, %0 ]
  %19 = icmp sgt i64 %18, 0
  br i1 %19, label %20, label %168

20:                                               ; preds = %16
  store i32 %17, ptr %14, align 4
  store i64 0, ptr %11, align 8
  %21 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 1) to i64))
  store i64 9, ptr %12, align 8
  br label %22

22:                                               ; preds = %39, %20
  %23 = phi i64 [ %42, %39 ], [ 1, %20 ]
  %24 = phi ptr [ %40, %39 ], [ %21, %20 ]
  %25 = phi i64 [ %43, %39 ], [ 9, %20 ]
  %26 = icmp sgt i64 %25, 0
  br i1 %26, label %27, label %44

27:                                               ; preds = %22
  %28 = trunc i64 %23 to i32
  %29 = load i32, ptr %14, align 4
  %30 = mul i32 %28, %29
  %31 = load i64, ptr %11, align 8
  %32 = load i64, ptr %12, align 8
  %33 = add i64 %31, 1
  %34 = icmp sle i64 %32, %33
  br i1 %34, label %35, label %39

35:                                               ; preds = %27
  %36 = mul i64 %33, 2
  store i64 %36, ptr %12, align 8
  %37 = mul i64 %36, ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 0, i64 1) to i64)
  %38 = call ptr @realloc(ptr %24, i64 %37)
  br label %39

39:                                               ; preds = %35, %27
  %40 = phi ptr [ %38, %35 ], [ %24, %27 ]
  %41 = getelementptr [9 x i32], ptr %40, i32 0, i64 %31
  store i32 %30, ptr %41, align 4
  store i64 %33, ptr %11, align 8
  %42 = add i64 %23, 1
  %43 = sub i64 %25, 1
  br label %22

44:                                               ; preds = %22
  %45 = load i64, ptr %11, align 8
  %46 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 1) to i64))
  br label %47

47:                                               ; preds = %51, %44
  %48 = phi i64 [ %52, %51 ], [ 0, %44 ]
  %49 = phi i64 [ %65, %51 ], [ 9, %44 ]
  %50 = icmp sgt i64 %49, 0
  br i1 %50, label %51, label %66

51:                                               ; preds = %47
  %52 = add i64 %48, 1
  %53 = sub i64 %52, 1
  %54 = mul i64 %53, 1
  %55 = mul i64 %54, 1
  %56 = add i64 %55, 0
  %57 = mul i64 1, %45
  %58 = getelementptr i32, ptr %24, i64 %56
  %59 = load i32, ptr %58, align 4
  %60 = sub i64 %52, 1
  %61 = mul i64 %60, 1
  %62 = mul i64 %61, 1
  %63 = add i64 %62, 0
  %64 = getelementptr i32, ptr %46, i64 %63
  store i32 %59, ptr %64, align 4
  %65 = sub i64 %49, 1
  br label %47

66:                                               ; preds = %47
  %67 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 9, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %46, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %67, ptr %8, align 8
  %68 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([2 x i32], ptr null, i32 1) to i64))
  br label %69

69:                                               ; preds = %73, %66
  %70 = phi i64 [ %74, %73 ], [ 0, %66 ]
  %71 = phi i64 [ %86, %73 ], [ 2, %66 ]
  %72 = icmp sgt i64 %71, 0
  br i1 %72, label %73, label %87

73:                                               ; preds = %69
  %74 = add i64 %70, 1
  %75 = sub i64 %74, 1
  %76 = mul i64 %75, 1
  %77 = mul i64 %76, 1
  %78 = add i64 %77, 0
  %79 = getelementptr i32, ptr @_QQro.2xi4.6cff4ff6f4002bd1fa86b17ec9335909, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = sub i64 %74, 1
  %82 = mul i64 %81, 1
  %83 = mul i64 %82, 1
  %84 = add i64 %83, 0
  %85 = getelementptr i32, ptr %68, i64 %84
  store i32 %80, ptr %85, align 4
  %86 = sub i64 %71, 1
  br label %69

87:                                               ; preds = %69
  %88 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 2, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %68, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %88, ptr %7, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 2, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]] }, ptr %6, align 8
  %89 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %6, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %89, ptr %10, align 8
  %90 = call {} @_FortranAReshape(ptr %10, ptr %8, ptr %7, ptr null, ptr null, ptr @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 8)
  %91 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %10, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %91, ptr %5, align 8
  %92 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 7, i64 0, i32 0
  %93 = load i64, ptr %92, align 8
  %94 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 7, i64 0, i32 1
  %95 = load i64, ptr %94, align 8
  %96 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 7, i64 0, i32 2
  %97 = load i64, ptr %96, align 8
  %98 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 7, i64 1, i32 0
  %99 = load i64, ptr %98, align 8
  %100 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 7, i64 1, i32 1
  %101 = load i64, ptr %100, align 8
  %102 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 7, i64 1, i32 2
  %103 = load i64, ptr %102, align 8
  %104 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i32 0, i32 0
  %105 = load ptr, ptr %104, align 8
  br label %106

106:                                              ; preds = %141, %87
  %107 = phi i64 [ %142, %141 ], [ 0, %87 ]
  %108 = phi i64 [ %143, %141 ], [ 3, %87 ]
  %109 = icmp sgt i64 %108, 0
  br i1 %109, label %110, label %144

110:                                              ; preds = %114, %106
  %111 = phi i64 [ %129, %114 ], [ 0, %106 ]
  %112 = phi i64 [ %140, %114 ], [ 3, %106 ]
  %113 = icmp sgt i64 %112, 0
  br i1 %113, label %114, label %141

114:                                              ; preds = %110
  %115 = add i64 %111, %93
  %116 = add i64 %107, %99
  %117 = sub i64 %115, %93
  %118 = mul i64 %117, 1
  %119 = mul i64 %118, 1
  %120 = add i64 %119, 0
  %121 = mul i64 1, %95
  %122 = sub i64 %116, %99
  %123 = mul i64 %122, 1
  %124 = mul i64 %123, %121
  %125 = add i64 %124, %120
  %126 = mul i64 %121, %101
  %127 = getelementptr i32, ptr %105, i64 %125
  %128 = load i32, ptr %127, align 4
  %129 = add i64 %111, 1
  %130 = add i64 %107, 1
  %131 = sub i64 %129, 1
  %132 = mul i64 %131, 1
  %133 = mul i64 %132, 1
  %134 = add i64 %133, 0
  %135 = sub i64 %130, 1
  %136 = mul i64 %135, 1
  %137 = mul i64 %136, 3
  %138 = add i64 %137, %134
  %139 = getelementptr i32, ptr @_QFEnums, i64 %138
  store i32 %128, ptr %139, align 4
  %140 = sub i64 %112, 1
  br label %110

141:                                              ; preds = %110
  %142 = add i64 %107, 1
  %143 = sub i64 %108, 1
  br label %106

144:                                              ; preds = %106
  call void @free(ptr %105)
  call void @free(ptr %68)
  call void @free(ptr %46)
  call void @free(ptr %24)
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr @_QFEnums, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 0, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 3, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 3)]] }, ptr %4, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 2, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %3, align 8
  %145 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %145, ptr %9, align 8
  %146 = call {} @_FortranASumDim(ptr %9, ptr %4, i32 1, ptr @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 9, ptr null)
  %147 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %9, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %147, ptr %2, align 8
  %148 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 0, i32 0
  %149 = load i64, ptr %148, align 8
  %150 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 0, i32 1
  %151 = load i64, ptr %150, align 8
  %152 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 0, i32 2
  %153 = load i64, ptr %152, align 8
  %154 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i32 0, i32 0
  %155 = load ptr, ptr %154, align 8
  %156 = icmp eq i64 %151, 0
  %157 = select i1 %156, i64 1, i64 %149
  %158 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] undef }, i64 %157, 7, 0, 0
  %159 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %158, i64 %151, 7, 0, 1
  %160 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %159, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), 7, 0, 2
  %161 = mul i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), %151
  %162 = mul i64 1, %151
  %163 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %160, ptr %155, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %163, ptr %1, align 8
  %164 = call i32 @_FortranAMaxvalInteger4(ptr %1, ptr @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 9, i32 0, ptr null)
  store i32 %164, ptr %15, align 4
  call void @free(ptr %155)
  %165 = load i32, ptr %14, align 4
  %166 = add i32 %165, 1
  %167 = sub i64 %18, 1
  br label %16

168:                                              ; preds = %16
  store i32 %17, ptr %14, align 4
  %169 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 12)
  %170 = call i1 @_FortranAioOutputInteger32(ptr %169, i32 9)
  %171 = call i32 @_FortranAioEndIoStatement(ptr %169)
  ret void
}

define void @_QFPresh(ptr %0, ptr %1) {
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %6 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %7 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, i64 1, align 8
  %8 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 9, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %1, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %8, ptr %6, align 8
  %9 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([2 x i32], ptr null, i32 1) to i64))
  br label %10

10:                                               ; preds = %14, %2
  %11 = phi i64 [ %15, %14 ], [ 0, %2 ]
  %12 = phi i64 [ %27, %14 ], [ 2, %2 ]
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %14, label %28

14:                                               ; preds = %10
  %15 = add i64 %11, 1
  %16 = sub i64 %15, 1
  %17 = mul i64 %16, 1
  %18 = mul i64 %17, 1
  %19 = add i64 %18, 0
  %20 = getelementptr i32, ptr @_QQro.2xi4.6cff4ff6f4002bd1fa86b17ec9335909, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = sub i64 %15, 1
  %23 = mul i64 %22, 1
  %24 = mul i64 %23, 1
  %25 = add i64 %24, 0
  %26 = getelementptr i32, ptr %9, i64 %25
  store i32 %21, ptr %26, align 4
  %27 = sub i64 %12, 1
  br label %10

28:                                               ; preds = %10
  %29 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 2, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %9, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %29, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 2, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]] }, ptr %4, align 8
  %30 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %30, ptr %7, align 8
  %31 = call {} @_FortranAReshape(ptr %7, ptr %6, ptr %5, ptr null, ptr null, ptr @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 21)
  %32 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %7, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %32, ptr %3, align 8
  %33 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 0
  %34 = load i64, ptr %33, align 8
  %35 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 1
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 2
  %38 = load i64, ptr %37, align 8
  %39 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 0
  %40 = load i64, ptr %39, align 8
  %41 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 1
  %42 = load i64, ptr %41, align 8
  %43 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 2
  %44 = load i64, ptr %43, align 8
  %45 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  br label %47

47:                                               ; preds = %82, %28
  %48 = phi i64 [ %83, %82 ], [ 0, %28 ]
  %49 = phi i64 [ %84, %82 ], [ 3, %28 ]
  %50 = icmp sgt i64 %49, 0
  br i1 %50, label %51, label %85

51:                                               ; preds = %55, %47
  %52 = phi i64 [ %70, %55 ], [ 0, %47 ]
  %53 = phi i64 [ %81, %55 ], [ 3, %47 ]
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %55, label %82

55:                                               ; preds = %51
  %56 = add i64 %52, %34
  %57 = add i64 %48, %40
  %58 = sub i64 %56, %34
  %59 = mul i64 %58, 1
  %60 = mul i64 %59, 1
  %61 = add i64 %60, 0
  %62 = mul i64 1, %36
  %63 = sub i64 %57, %40
  %64 = mul i64 %63, 1
  %65 = mul i64 %64, %62
  %66 = add i64 %65, %61
  %67 = mul i64 %62, %42
  %68 = getelementptr i32, ptr %46, i64 %66
  %69 = load i32, ptr %68, align 4
  %70 = add i64 %52, 1
  %71 = add i64 %48, 1
  %72 = sub i64 %70, 1
  %73 = mul i64 %72, 1
  %74 = mul i64 %73, 1
  %75 = add i64 %74, 0
  %76 = sub i64 %71, 1
  %77 = mul i64 %76, 1
  %78 = mul i64 %77, 3
  %79 = add i64 %78, %75
  %80 = getelementptr i32, ptr %0, i64 %79
  store i32 %69, ptr %80, align 4
  %81 = sub i64 %53, 1
  br label %51

82:                                               ; preds = %51
  %83 = add i64 %48, 1
  %84 = sub i64 %49, 1
  br label %47

85:                                               ; preds = %47
  call void @free(ptr %46)
  call void @free(ptr %9)
  ret void
}

declare ptr @realloc(ptr, i64)

declare {} @_FortranAReshape(ptr, ptr, ptr, ptr, ptr, ptr, i32)

declare {} @_FortranASumDim(ptr, ptr, i32, ptr, i32, ptr)

declare i32 @_FortranAMaxvalInteger4(ptr, ptr, i32, i32, ptr)

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputInteger32(ptr, i32)

declare i32 @_FortranAioEndIoStatement(ptr)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

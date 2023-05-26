; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEm = internal global [3 x [3 x i32]] undef
@_QQro.2xi4.6cff4ff6f4002bd1fa86b17ec9335909 = internal constant [2 x i32] [i32 3, i32 3]
@_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000 = linkonce constant [30 x i8] c"././plain_shape_test/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %6 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %7 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %8 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, i64 1, align 8
  %9 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, i64 1, align 8
  %10 = alloca i32, i64 1, align 4
  %11 = alloca i64, i64 1, align 8
  %12 = alloca i64, i64 1, align 8
  %13 = alloca i32, i64 1, align 4
  store i64 0, ptr %11, align 8
  %14 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 1) to i64))
  store i64 9, ptr %12, align 8
  br label %15

15:                                               ; preds = %31, %0
  %16 = phi i64 [ %34, %31 ], [ 1, %0 ]
  %17 = phi ptr [ %32, %31 ], [ %14, %0 ]
  %18 = phi i64 [ %35, %31 ], [ 9, %0 ]
  %19 = icmp sgt i64 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = trunc i64 %16 to i32
  store i32 %21, ptr %10, align 4
  %22 = call i32 @special_rng_(ptr %10)
  %23 = load i64, ptr %11, align 8
  %24 = load i64, ptr %12, align 8
  %25 = add i64 %23, 1
  %26 = icmp sle i64 %24, %25
  br i1 %26, label %27, label %31

27:                                               ; preds = %20
  %28 = mul i64 %25, 2
  store i64 %28, ptr %12, align 8
  %29 = mul i64 %28, ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 0, i64 1) to i64)
  %30 = call ptr @realloc(ptr %17, i64 %29)
  br label %31

31:                                               ; preds = %27, %20
  %32 = phi ptr [ %30, %27 ], [ %17, %20 ]
  %33 = getelementptr [9 x i32], ptr %32, i32 0, i64 %23
  store i32 %22, ptr %33, align 4
  store i64 %25, ptr %11, align 8
  %34 = add i64 %16, 1
  %35 = sub i64 %18, 1
  br label %15

36:                                               ; preds = %15
  %37 = load i64, ptr %11, align 8
  %38 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([9 x i32], ptr null, i32 1) to i64))
  br label %39

39:                                               ; preds = %43, %36
  %40 = phi i64 [ %44, %43 ], [ 0, %36 ]
  %41 = phi i64 [ %57, %43 ], [ 9, %36 ]
  %42 = icmp sgt i64 %41, 0
  br i1 %42, label %43, label %58

43:                                               ; preds = %39
  %44 = add i64 %40, 1
  %45 = sub i64 %44, 1
  %46 = mul i64 %45, 1
  %47 = mul i64 %46, 1
  %48 = add i64 %47, 0
  %49 = mul i64 1, %37
  %50 = getelementptr i32, ptr %17, i64 %48
  %51 = load i32, ptr %50, align 4
  %52 = sub i64 %44, 1
  %53 = mul i64 %52, 1
  %54 = mul i64 %53, 1
  %55 = add i64 %54, 0
  %56 = getelementptr i32, ptr %38, i64 %55
  store i32 %51, ptr %56, align 4
  %57 = sub i64 %41, 1
  br label %39

58:                                               ; preds = %39
  %59 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 9, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %38, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %59, ptr %7, align 8
  %60 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([2 x i32], ptr null, i32 1) to i64))
  br label %61

61:                                               ; preds = %65, %58
  %62 = phi i64 [ %66, %65 ], [ 0, %58 ]
  %63 = phi i64 [ %78, %65 ], [ 2, %58 ]
  %64 = icmp sgt i64 %63, 0
  br i1 %64, label %65, label %79

65:                                               ; preds = %61
  %66 = add i64 %62, 1
  %67 = sub i64 %66, 1
  %68 = mul i64 %67, 1
  %69 = mul i64 %68, 1
  %70 = add i64 %69, 0
  %71 = getelementptr i32, ptr @_QQro.2xi4.6cff4ff6f4002bd1fa86b17ec9335909, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = sub i64 %66, 1
  %74 = mul i64 %73, 1
  %75 = mul i64 %74, 1
  %76 = add i64 %75, 0
  %77 = getelementptr i32, ptr %60, i64 %76
  store i32 %72, ptr %77, align 4
  %78 = sub i64 %63, 1
  br label %61

79:                                               ; preds = %61
  %80 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 2, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %60, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %80, ptr %6, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 2, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]] }, ptr %5, align 8
  %81 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %81, ptr %9, align 8
  %82 = call {} @_FortranAReshape(ptr %9, ptr %7, ptr %6, ptr null, ptr null, ptr @_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000, i32 11)
  %83 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %9, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %83, ptr %4, align 8
  %84 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 7, i64 0, i32 0
  %85 = load i64, ptr %84, align 8
  %86 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 7, i64 0, i32 1
  %87 = load i64, ptr %86, align 8
  %88 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 7, i64 0, i32 2
  %89 = load i64, ptr %88, align 8
  %90 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 7, i64 1, i32 0
  %91 = load i64, ptr %90, align 8
  %92 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 7, i64 1, i32 1
  %93 = load i64, ptr %92, align 8
  %94 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 7, i64 1, i32 2
  %95 = load i64, ptr %94, align 8
  %96 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i32 0, i32 0
  %97 = load ptr, ptr %96, align 8
  %98 = icmp eq i64 %87, 0
  %99 = select i1 %98, i64 1, i64 %85
  %100 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 0, i8 0, [2 x [3 x i64]] undef }, i64 %99, 7, 0, 0
  %101 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %100, i64 %87, 7, 0, 1
  %102 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %101, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), 7, 0, 2
  %103 = mul i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), %87
  %104 = mul i64 1, %87
  %105 = icmp eq i64 %93, 0
  %106 = select i1 %105, i64 1, i64 %91
  %107 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %102, i64 %106, 7, 1, 0
  %108 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %107, i64 %93, 7, 1, 1
  %109 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %108, i64 %103, 7, 1, 2
  %110 = mul i64 %103, %93
  %111 = mul i64 %104, %93
  %112 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %109, ptr %97, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %112, ptr %3, align 8
  %113 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %113, ptr %8, align 8
  %114 = call {} @_FortranATranspose(ptr %8, ptr %3, ptr @_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000, i32 11)
  %115 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %8, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %115, ptr %2, align 8
  %116 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 0, i32 0
  %117 = load i64, ptr %116, align 8
  %118 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 0, i32 1
  %119 = load i64, ptr %118, align 8
  %120 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 0, i32 2
  %121 = load i64, ptr %120, align 8
  %122 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 1, i32 0
  %123 = load i64, ptr %122, align 8
  %124 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 1, i32 1
  %125 = load i64, ptr %124, align 8
  %126 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 7, i64 1, i32 2
  %127 = load i64, ptr %126, align 8
  %128 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %2, i32 0, i32 0
  %129 = load ptr, ptr %128, align 8
  br label %130

130:                                              ; preds = %165, %79
  %131 = phi i64 [ %166, %165 ], [ 0, %79 ]
  %132 = phi i64 [ %167, %165 ], [ 3, %79 ]
  %133 = icmp sgt i64 %132, 0
  br i1 %133, label %134, label %168

134:                                              ; preds = %138, %130
  %135 = phi i64 [ %153, %138 ], [ 0, %130 ]
  %136 = phi i64 [ %164, %138 ], [ 3, %130 ]
  %137 = icmp sgt i64 %136, 0
  br i1 %137, label %138, label %165

138:                                              ; preds = %134
  %139 = add i64 %135, %117
  %140 = add i64 %131, %123
  %141 = sub i64 %139, %117
  %142 = mul i64 %141, 1
  %143 = mul i64 %142, 1
  %144 = add i64 %143, 0
  %145 = mul i64 1, %119
  %146 = sub i64 %140, %123
  %147 = mul i64 %146, 1
  %148 = mul i64 %147, %145
  %149 = add i64 %148, %144
  %150 = mul i64 %145, %125
  %151 = getelementptr i32, ptr %129, i64 %149
  %152 = load i32, ptr %151, align 4
  %153 = add i64 %135, 1
  %154 = add i64 %131, 1
  %155 = sub i64 %153, 1
  %156 = mul i64 %155, 1
  %157 = mul i64 %156, 1
  %158 = add i64 %157, 0
  %159 = sub i64 %154, 1
  %160 = mul i64 %159, 1
  %161 = mul i64 %160, 3
  %162 = add i64 %161, %158
  %163 = getelementptr i32, ptr @_QFEm, i64 %162
  store i32 %152, ptr %163, align 4
  %164 = sub i64 %136, 1
  br label %134

165:                                              ; preds = %134
  %166 = add i64 %131, 1
  %167 = sub i64 %132, 1
  br label %130

168:                                              ; preds = %130
  call void @free(ptr %129)
  call void @free(ptr %97)
  call void @free(ptr %60)
  call void @free(ptr %38)
  call void @free(ptr %17)
  %169 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000, i32 13)
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr @_QFEm, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 0, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 3, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 3)]] }, ptr %1, align 8
  %170 = call i1 @_FortranAioOutputDescriptor(ptr %169, ptr %1)
  %171 = call i32 @_FortranAioEndIoStatement(ptr %169)
  ret void
}

declare i32 @special_rng_(ptr)

declare ptr @realloc(ptr, i64)

declare {} @_FortranAReshape(ptr, ptr, ptr, ptr, ptr, ptr, i32)

declare {} @_FortranATranspose(ptr, ptr, ptr, i32)

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputDescriptor(ptr, ptr)

declare i32 @_FortranAioEndIoStatement(ptr)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

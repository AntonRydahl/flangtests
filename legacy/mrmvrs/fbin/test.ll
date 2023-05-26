; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEnums = internal global [3 x [3 x i32]] undef
@_QQcl.28493029 = linkonce constant [4 x i8] c"(I0)"
@_QQcl.2E2F2E2F6D726D7672732F746573742E66393000 = linkonce constant [20 x i8] c"././mrmvrs/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %2 = alloca i64, i64 1, align 8
  %3 = alloca i64, i64 1, align 8
  %4 = alloca i64, i64 1, align 8
  %5 = alloca i64, i64 1, align 8
  %6 = alloca i64, i64 1, align 8
  %7 = alloca i64, i64 1, align 8
  %8 = alloca i32, i64 1, align 4
  %9 = alloca i32, i64 1, align 4
  %10 = alloca i32, i64 1, align 4
  %11 = alloca float, i64 1, align 4
  %12 = alloca float, i64 1, align 4
  %13 = call contract double @_FortranACpuTime()
  %14 = fptrunc double %13 to float
  store float %14, ptr %11, align 4
  br label %15

15:                                               ; preds = %160, %0
  %16 = phi i32 [ %162, %160 ], [ 1, %0 ]
  %17 = phi i64 [ %163, %160 ], [ 10000000, %0 ]
  %18 = icmp sgt i64 %17, 0
  br i1 %18, label %19, label %164

19:                                               ; preds = %15
  store i32 %16, ptr %9, align 4
  store i64 0, ptr %6, align 8
  %20 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([3 x i32], ptr null, i32 1) to i64))
  store i64 3, ptr %7, align 8
  br label %21

21:                                               ; preds = %39, %19
  %22 = phi i64 [ %42, %39 ], [ 1, %19 ]
  %23 = phi ptr [ %40, %39 ], [ %20, %19 ]
  %24 = phi i64 [ %43, %39 ], [ 3, %19 ]
  %25 = icmp sgt i64 %24, 0
  br i1 %25, label %26, label %44

26:                                               ; preds = %21
  %27 = trunc i64 %22 to i32
  %28 = load i32, ptr %9, align 4
  %29 = mul i32 %27, %28
  %30 = mul i32 %29, 2
  %31 = load i64, ptr %6, align 8
  %32 = load i64, ptr %7, align 8
  %33 = add i64 %31, 1
  %34 = icmp sle i64 %32, %33
  br i1 %34, label %35, label %39

35:                                               ; preds = %26
  %36 = mul i64 %33, 2
  store i64 %36, ptr %7, align 8
  %37 = mul i64 %36, ptrtoint (ptr getelementptr ([3 x i32], ptr null, i32 0, i64 1) to i64)
  %38 = call ptr @realloc(ptr %23, i64 %37)
  br label %39

39:                                               ; preds = %35, %26
  %40 = phi ptr [ %38, %35 ], [ %23, %26 ]
  %41 = getelementptr [3 x i32], ptr %40, i32 0, i64 %31
  store i32 %30, ptr %41, align 4
  store i64 %33, ptr %6, align 8
  %42 = add i64 %22, 1
  %43 = sub i64 %24, 1
  br label %21

44:                                               ; preds = %21
  %45 = load i64, ptr %6, align 8
  br label %46

46:                                               ; preds = %50, %44
  %47 = phi i64 [ %51, %50 ], [ 0, %44 ]
  %48 = phi i64 [ %65, %50 ], [ 3, %44 ]
  %49 = icmp sgt i64 %48, 0
  br i1 %49, label %50, label %66

50:                                               ; preds = %46
  %51 = add i64 %47, 1
  %52 = sub i64 %51, 1
  %53 = mul i64 %52, 1
  %54 = mul i64 %53, 1
  %55 = add i64 %54, 0
  %56 = mul i64 1, %45
  %57 = getelementptr i32, ptr %23, i64 %55
  %58 = load i32, ptr %57, align 4
  %59 = sub i64 %51, 1
  %60 = mul i64 %59, 1
  %61 = add i64 %60, 0
  %62 = mul i64 %61, 3
  %63 = add i64 %62, 0
  %64 = getelementptr i32, ptr @_QFEnums, i64 %63
  store i32 %58, ptr %64, align 4
  %65 = sub i64 %48, 1
  br label %46

66:                                               ; preds = %46
  call void @free(ptr %23)
  store i64 0, ptr %4, align 8
  %67 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([3 x i32], ptr null, i32 1) to i64))
  store i64 3, ptr %5, align 8
  br label %68

68:                                               ; preds = %86, %66
  %69 = phi i64 [ %89, %86 ], [ 4, %66 ]
  %70 = phi ptr [ %87, %86 ], [ %67, %66 ]
  %71 = phi i64 [ %90, %86 ], [ 3, %66 ]
  %72 = icmp sgt i64 %71, 0
  br i1 %72, label %73, label %91

73:                                               ; preds = %68
  %74 = trunc i64 %69 to i32
  %75 = load i32, ptr %9, align 4
  %76 = mul i32 %74, %75
  %77 = mul i32 %76, 2
  %78 = load i64, ptr %4, align 8
  %79 = load i64, ptr %5, align 8
  %80 = add i64 %78, 1
  %81 = icmp sle i64 %79, %80
  br i1 %81, label %82, label %86

82:                                               ; preds = %73
  %83 = mul i64 %80, 2
  store i64 %83, ptr %5, align 8
  %84 = mul i64 %83, ptrtoint (ptr getelementptr ([3 x i32], ptr null, i32 0, i64 1) to i64)
  %85 = call ptr @realloc(ptr %70, i64 %84)
  br label %86

86:                                               ; preds = %82, %73
  %87 = phi ptr [ %85, %82 ], [ %70, %73 ]
  %88 = getelementptr [3 x i32], ptr %87, i32 0, i64 %78
  store i32 %77, ptr %88, align 4
  store i64 %80, ptr %4, align 8
  %89 = add i64 %69, 1
  %90 = sub i64 %71, 1
  br label %68

91:                                               ; preds = %68
  %92 = load i64, ptr %4, align 8
  br label %93

93:                                               ; preds = %97, %91
  %94 = phi i64 [ %98, %97 ], [ 0, %91 ]
  %95 = phi i64 [ %112, %97 ], [ 3, %91 ]
  %96 = icmp sgt i64 %95, 0
  br i1 %96, label %97, label %113

97:                                               ; preds = %93
  %98 = add i64 %94, 1
  %99 = sub i64 %98, 1
  %100 = mul i64 %99, 1
  %101 = mul i64 %100, 1
  %102 = add i64 %101, 0
  %103 = mul i64 1, %92
  %104 = getelementptr i32, ptr %70, i64 %102
  %105 = load i32, ptr %104, align 4
  %106 = sub i64 %98, 1
  %107 = mul i64 %106, 1
  %108 = add i64 %107, 0
  %109 = mul i64 %108, 3
  %110 = add i64 %109, 1
  %111 = getelementptr i32, ptr @_QFEnums, i64 %110
  store i32 %105, ptr %111, align 4
  %112 = sub i64 %95, 1
  br label %93

113:                                              ; preds = %93
  call void @free(ptr %70)
  store i64 0, ptr %2, align 8
  %114 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([3 x i32], ptr null, i32 1) to i64))
  store i64 3, ptr %3, align 8
  br label %115

115:                                              ; preds = %133, %113
  %116 = phi i64 [ %136, %133 ], [ 7, %113 ]
  %117 = phi ptr [ %134, %133 ], [ %114, %113 ]
  %118 = phi i64 [ %137, %133 ], [ 3, %113 ]
  %119 = icmp sgt i64 %118, 0
  br i1 %119, label %120, label %138

120:                                              ; preds = %115
  %121 = trunc i64 %116 to i32
  %122 = load i32, ptr %9, align 4
  %123 = mul i32 %121, %122
  %124 = mul i32 %123, 2
  %125 = load i64, ptr %2, align 8
  %126 = load i64, ptr %3, align 8
  %127 = add i64 %125, 1
  %128 = icmp sle i64 %126, %127
  br i1 %128, label %129, label %133

129:                                              ; preds = %120
  %130 = mul i64 %127, 2
  store i64 %130, ptr %3, align 8
  %131 = mul i64 %130, ptrtoint (ptr getelementptr ([3 x i32], ptr null, i32 0, i64 1) to i64)
  %132 = call ptr @realloc(ptr %117, i64 %131)
  br label %133

133:                                              ; preds = %129, %120
  %134 = phi ptr [ %132, %129 ], [ %117, %120 ]
  %135 = getelementptr [3 x i32], ptr %134, i32 0, i64 %125
  store i32 %124, ptr %135, align 4
  store i64 %127, ptr %2, align 8
  %136 = add i64 %116, 1
  %137 = sub i64 %118, 1
  br label %115

138:                                              ; preds = %115
  %139 = load i64, ptr %2, align 8
  br label %140

140:                                              ; preds = %144, %138
  %141 = phi i64 [ %145, %144 ], [ 0, %138 ]
  %142 = phi i64 [ %159, %144 ], [ 3, %138 ]
  %143 = icmp sgt i64 %142, 0
  br i1 %143, label %144, label %160

144:                                              ; preds = %140
  %145 = add i64 %141, 1
  %146 = sub i64 %145, 1
  %147 = mul i64 %146, 1
  %148 = mul i64 %147, 1
  %149 = add i64 %148, 0
  %150 = mul i64 1, %139
  %151 = getelementptr i32, ptr %117, i64 %149
  %152 = load i32, ptr %151, align 4
  %153 = sub i64 %145, 1
  %154 = mul i64 %153, 1
  %155 = add i64 %154, 0
  %156 = mul i64 %155, 3
  %157 = add i64 %156, 2
  %158 = getelementptr i32, ptr @_QFEnums, i64 %157
  store i32 %152, ptr %158, align 4
  %159 = sub i64 %142, 1
  br label %140

160:                                              ; preds = %140
  call void @free(ptr %117)
  %161 = load i32, ptr %9, align 4
  %162 = add i32 %161, 1
  %163 = sub i64 %17, 1
  br label %15

164:                                              ; preds = %15
  store i32 %16, ptr %9, align 4
  %165 = call contract double @_FortranACpuTime()
  %166 = fptrunc double %165 to float
  store float %166, ptr %12, align 4
  %167 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr @_QQcl.28493029, i64 4, ptr null, i32 -1, ptr @_QQcl.2E2F2E2F6D726D7672732F746573742E66393000, i32 19)
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr @_QFEnums, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 0, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 3, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 3)]] }, ptr %1, align 8
  %168 = call i1 @_FortranAioOutputDescriptor(ptr %167, ptr %1)
  %169 = call i32 @_FortranAioEndIoStatement(ptr %167)
  %170 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F6D726D7672732F746573742E66393000, i32 20)
  %171 = load float, ptr %12, align 4
  %172 = load float, ptr %11, align 4
  %173 = fsub contract float %171, %172
  %174 = call i1 @_FortranAioOutputReal32(ptr %170, float %173)
  %175 = call i32 @_FortranAioEndIoStatement(ptr %170)
  ret void
}

declare double @_FortranACpuTime()

declare ptr @realloc(ptr, i64)

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32)

declare i1 @_FortranAioOutputDescriptor(ptr, ptr)

declare i32 @_FortranAioEndIoStatement(ptr)

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputReal32(ptr, float)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

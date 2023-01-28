; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QMrhofuncECdp = constant i32 8
@_QFECa = internal constant double 1.000000e-02
@_QFECdp = internal constant i32 8
@_QFECepsilon0 = internal constant double 8.850000e-12
@_QFECm = internal constant i32 300
@_QFEphi = internal global [300 x [300 x double]] undef
@_QFEphiprime = internal global [300 x [300 x double]] undef
@_QFErhoarr = internal global [300 x [300 x double]] undef
@_QFECtarget = internal constant double 0x3EB0C6F7A0B5ED8D
@_QQcl.2E2F2E2F72686F2F746573742E66393000 = linkonce constant [17 x i8] c"././rho/test.f90\00"
@_QQEnvironmentDefaults = constant ptr null

declare ptr @malloc(i64)

declare void @free(ptr)

define double @_QMrhofuncPrho(ptr %0, ptr %1) {
  %3 = alloca double, i64 1, align 8
  %4 = load double, ptr %0, align 8
  %5 = fcmp ogt double %4, 6.000000e-01
  %6 = fcmp olt double %4, 8.000000e-01
  %7 = and i1 %5, %6
  %8 = load double, ptr %1, align 8
  %9 = fcmp ogt double %8, 6.000000e-01
  %10 = and i1 %7, %9
  %11 = fcmp olt double %8, 8.000000e-01
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store double 1.000000e+00, ptr %3, align 8
  br label %26

14:                                               ; preds = %2
  %15 = load double, ptr %0, align 8
  %16 = fcmp ogt double %15, 2.000000e-01
  %17 = fcmp olt double %15, 4.000000e-01
  %18 = and i1 %16, %17
  %19 = load double, ptr %1, align 8
  %20 = fcmp ogt double %19, 2.000000e-01
  %21 = and i1 %18, %20
  %22 = fcmp olt double %19, 4.000000e-01
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %25

24:                                               ; preds = %14
  store double -1.000000e+00, ptr %3, align 8
  br label %26

25:                                               ; preds = %14
  store double 0.000000e+00, ptr %3, align 8
  br label %26

26:                                               ; preds = %13, %24, %25
  %27 = load double, ptr %3, align 8
  ret double %27
}

define void @_QQmain() {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %2 = alloca double, i64 1, align 8
  %3 = alloca double, i64 1, align 8
  %4 = alloca double, i64 1, align 8
  %5 = alloca double, i64 1, align 8
  %6 = alloca double, i64 1, align 8
  %7 = alloca double, i64 1, align 8
  %8 = alloca i32, i64 1, align 4
  %9 = alloca i32, i64 1, align 4
  %10 = alloca i32, i64 1, align 4
  store double 1.000000e+00, ptr %6, align 8
  store i32 0, ptr %9, align 4
  %11 = call contract double @_FortranACpuTime()
  store double %11, ptr %5, align 8
  br label %12

12:                                               ; preds = %35, %0
  %13 = phi i64 [ %36, %35 ], [ 0, %0 ]
  %14 = phi i64 [ %37, %35 ], [ 300, %0 ]
  %15 = icmp sgt i64 %14, 0
  br i1 %15, label %16, label %38

16:                                               ; preds = %20, %12
  %17 = phi i64 [ %21, %20 ], [ 0, %12 ]
  %18 = phi i64 [ %34, %20 ], [ 300, %12 ]
  %19 = icmp sgt i64 %18, 0
  br i1 %19, label %20, label %35

20:                                               ; preds = %16
  %21 = add i64 %17, 1
  %22 = add i64 %13, 1
  %23 = sub i64 %21, 1
  %24 = mul i64 %23, 1
  %25 = add i64 %24, 0
  %26 = mul i64 %25, 1
  %27 = add i64 %26, 0
  %28 = sub i64 %22, 1
  %29 = mul i64 %28, 1
  %30 = add i64 %29, 0
  %31 = mul i64 %30, 300
  %32 = add i64 %31, %27
  %33 = getelementptr double, ptr @_QFEphiprime, i64 %32
  store double 0.000000e+00, ptr %33, align 8
  %34 = sub i64 %18, 1
  br label %16

35:                                               ; preds = %16
  %36 = add i64 %13, 1
  %37 = sub i64 %14, 1
  br label %12

38:                                               ; preds = %61, %12
  %39 = phi i64 [ %62, %61 ], [ 0, %12 ]
  %40 = phi i64 [ %63, %61 ], [ 300, %12 ]
  %41 = icmp sgt i64 %40, 0
  br i1 %41, label %42, label %64

42:                                               ; preds = %46, %38
  %43 = phi i64 [ %47, %46 ], [ 0, %38 ]
  %44 = phi i64 [ %60, %46 ], [ 300, %38 ]
  %45 = icmp sgt i64 %44, 0
  br i1 %45, label %46, label %61

46:                                               ; preds = %42
  %47 = add i64 %43, 1
  %48 = add i64 %39, 1
  %49 = sub i64 %47, 1
  %50 = mul i64 %49, 1
  %51 = add i64 %50, 0
  %52 = mul i64 %51, 1
  %53 = add i64 %52, 0
  %54 = sub i64 %48, 1
  %55 = mul i64 %54, 1
  %56 = add i64 %55, 0
  %57 = mul i64 %56, 300
  %58 = add i64 %57, %53
  %59 = getelementptr double, ptr @_QFEphi, i64 %58
  store double 0.000000e+00, ptr %59, align 8
  %60 = sub i64 %44, 1
  br label %42

61:                                               ; preds = %42
  %62 = add i64 %39, 1
  %63 = sub i64 %40, 1
  br label %38

64:                                               ; preds = %38
  br label %65

65:                                               ; preds = %92, %64
  %66 = phi i32 [ %94, %92 ], [ 1, %64 ]
  %67 = phi i64 [ %95, %92 ], [ 300, %64 ]
  %68 = icmp sgt i64 %67, 0
  br i1 %68, label %69, label %96

69:                                               ; preds = %65
  store i32 %66, ptr %8, align 4
  br label %70

70:                                               ; preds = %74, %69
  %71 = phi i32 [ %90, %74 ], [ 1, %69 ]
  %72 = phi i64 [ %91, %74 ], [ 300, %69 ]
  %73 = icmp sgt i64 %72, 0
  br i1 %73, label %74, label %92

74:                                               ; preds = %70
  store i32 %71, ptr %10, align 4
  %75 = load i32, ptr %8, align 4
  %76 = sitofp i32 %75 to double
  %77 = fmul contract double %76, 1.000000e-02
  store double %77, ptr %3, align 8
  %78 = load i32, ptr %10, align 4
  %79 = sitofp i32 %78 to double
  %80 = fmul contract double %79, 1.000000e-02
  store double %80, ptr %2, align 8
  %81 = call contract double @_QMrhofuncPrho(ptr %3, ptr %2)
  %82 = load i32, ptr %8, align 4
  %83 = sext i32 %82 to i64
  %84 = sub i64 %83, 1
  %85 = load i32, ptr %10, align 4
  %86 = sext i32 %85 to i64
  %87 = sub i64 %86, 1
  %88 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i32 0, i64 %87, i64 %84
  store double %81, ptr %88, align 8
  %89 = load i32, ptr %10, align 4
  %90 = add i32 %89, 1
  %91 = sub i64 %72, 1
  br label %70

92:                                               ; preds = %70
  store i32 %71, ptr %10, align 4
  %93 = load i32, ptr %8, align 4
  %94 = add i32 %93, 1
  %95 = sub i64 %67, 1
  br label %65

96:                                               ; preds = %65
  store i32 %66, ptr %8, align 4
  br label %97

97:                                               ; preds = %209, %96
  %98 = load double, ptr %6, align 8
  %99 = fcmp ogt double %98, 0x3EB0C6F7A0B5ED8D
  br i1 %99, label %100, label %243

100:                                              ; preds = %97
  %101 = load i32, ptr %9, align 4
  %102 = add i32 %101, 1
  store i32 %102, ptr %9, align 4
  store double 1.000000e-04, ptr %4, align 8
  br label %103

103:                                              ; preds = %154, %100
  %104 = phi i32 [ %156, %154 ], [ 2, %100 ]
  %105 = phi i64 [ %157, %154 ], [ 298, %100 ]
  %106 = icmp sgt i64 %105, 0
  br i1 %106, label %107, label %158

107:                                              ; preds = %103
  store i32 %104, ptr %8, align 4
  br label %108

108:                                              ; preds = %112, %107
  %109 = phi i32 [ %152, %112 ], [ 2, %107 ]
  %110 = phi i64 [ %153, %112 ], [ 298, %107 ]
  %111 = icmp sgt i64 %110, 0
  br i1 %111, label %112, label %154

112:                                              ; preds = %108
  store i32 %109, ptr %10, align 4
  %113 = load i32, ptr %8, align 4
  %114 = add i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = sub i64 %115, 1
  %117 = load i32, ptr %10, align 4
  %118 = sext i32 %117 to i64
  %119 = sub i64 %118, 1
  %120 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i32 0, i64 %119, i64 %116
  %121 = load double, ptr %120, align 8
  %122 = sub i32 %113, 1
  %123 = sext i32 %122 to i64
  %124 = sub i64 %123, 1
  %125 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i32 0, i64 %119, i64 %124
  %126 = load double, ptr %125, align 8
  %127 = fadd contract double %121, %126
  %128 = sext i32 %113 to i64
  %129 = sub i64 %128, 1
  %130 = add i32 %117, 1
  %131 = sext i32 %130 to i64
  %132 = sub i64 %131, 1
  %133 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i32 0, i64 %132, i64 %129
  %134 = load double, ptr %133, align 8
  %135 = fadd contract double %127, %134
  %136 = sub i32 %117, 1
  %137 = sext i32 %136 to i64
  %138 = sub i64 %137, 1
  %139 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i32 0, i64 %138, i64 %129
  %140 = load double, ptr %139, align 8
  %141 = fadd contract double %135, %140
  %142 = fdiv contract double %141, 4.000000e+00
  %143 = load double, ptr %4, align 8
  %144 = fdiv contract double %143, 4.000000e+00
  %145 = fdiv contract double %144, 8.850000e-12
  %146 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i32 0, i64 %119, i64 %129
  %147 = load double, ptr %146, align 8
  %148 = fmul contract double %145, %147
  %149 = fadd contract double %142, %148
  %150 = getelementptr [300 x [300 x double]], ptr @_QFEphiprime, i32 0, i64 %119, i64 %129
  store double %149, ptr %150, align 8
  %151 = load i32, ptr %10, align 4
  %152 = add i32 %151, 1
  %153 = sub i64 %110, 1
  br label %108

154:                                              ; preds = %108
  store i32 %109, ptr %10, align 4
  %155 = load i32, ptr %8, align 4
  %156 = add i32 %155, 1
  %157 = sub i64 %105, 1
  br label %103

158:                                              ; preds = %103
  store i32 %104, ptr %8, align 4
  %159 = call ptr @malloc(i64 ptrtoint (ptr getelementptr ([300 x [300 x double]], ptr null, i32 1) to i64))
  br label %160

160:                                              ; preds = %203, %158
  %161 = phi i64 [ %204, %203 ], [ 0, %158 ]
  %162 = phi i64 [ %205, %203 ], [ 300, %158 ]
  %163 = icmp sgt i64 %162, 0
  br i1 %163, label %164, label %206

164:                                              ; preds = %168, %160
  %165 = phi i64 [ %169, %168 ], [ 0, %160 ]
  %166 = phi i64 [ %202, %168 ], [ 300, %160 ]
  %167 = icmp sgt i64 %166, 0
  br i1 %167, label %168, label %203

168:                                              ; preds = %164
  %169 = add i64 %165, 1
  %170 = add i64 %161, 1
  %171 = sub i64 %169, 1
  %172 = mul i64 %171, 1
  %173 = mul i64 %172, 1
  %174 = add i64 %173, 0
  %175 = sub i64 %170, 1
  %176 = mul i64 %175, 1
  %177 = mul i64 %176, 300
  %178 = add i64 %177, %174
  %179 = getelementptr double, ptr @_QFEphiprime, i64 %178
  %180 = load double, ptr %179, align 8
  %181 = sub i64 %169, 1
  %182 = mul i64 %181, 1
  %183 = mul i64 %182, 1
  %184 = add i64 %183, 0
  %185 = sub i64 %170, 1
  %186 = mul i64 %185, 1
  %187 = mul i64 %186, 300
  %188 = add i64 %187, %184
  %189 = getelementptr double, ptr @_QFEphi, i64 %188
  %190 = load double, ptr %189, align 8
  %191 = fsub contract double %180, %190
  %192 = call contract double @llvm.fabs.f64(double %191)
  %193 = sub i64 %169, 1
  %194 = mul i64 %193, 1
  %195 = mul i64 %194, 1
  %196 = add i64 %195, 0
  %197 = sub i64 %170, 1
  %198 = mul i64 %197, 1
  %199 = mul i64 %198, 300
  %200 = add i64 %199, %196
  %201 = getelementptr double, ptr %159, i64 %200
  store double %192, ptr %201, align 8
  %202 = sub i64 %166, 1
  br label %164

203:                                              ; preds = %164
  %204 = add i64 %161, 1
  %205 = sub i64 %162, 1
  br label %160

206:                                              ; preds = %160
  %207 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 28, i8 0, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 300, i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 300, i64 mul (i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), i64 300)]] }, ptr %159, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %207, ptr %1, align 8
  %208 = call contract double @_FortranAMaxvalReal8(ptr %1, ptr @_QQcl.2E2F2E2F72686F2F746573742E66393000, i32 50, i32 0, ptr null)
  store double %208, ptr %6, align 8
  call void @free(ptr %159)
  br label %209

209:                                              ; preds = %240, %206
  %210 = phi i64 [ %241, %240 ], [ 0, %206 ]
  %211 = phi i64 [ %242, %240 ], [ 300, %206 ]
  %212 = icmp sgt i64 %211, 0
  br i1 %212, label %213, label %97

213:                                              ; preds = %217, %209
  %214 = phi i64 [ %218, %217 ], [ 0, %209 ]
  %215 = phi i64 [ %239, %217 ], [ 300, %209 ]
  %216 = icmp sgt i64 %215, 0
  br i1 %216, label %217, label %240

217:                                              ; preds = %213
  %218 = add i64 %214, 1
  %219 = add i64 %210, 1
  %220 = sub i64 %218, 1
  %221 = mul i64 %220, 1
  %222 = mul i64 %221, 1
  %223 = add i64 %222, 0
  %224 = sub i64 %219, 1
  %225 = mul i64 %224, 1
  %226 = mul i64 %225, 300
  %227 = add i64 %226, %223
  %228 = getelementptr double, ptr @_QFEphiprime, i64 %227
  %229 = load double, ptr %228, align 8
  %230 = sub i64 %218, 1
  %231 = mul i64 %230, 1
  %232 = mul i64 %231, 1
  %233 = add i64 %232, 0
  %234 = sub i64 %219, 1
  %235 = mul i64 %234, 1
  %236 = mul i64 %235, 300
  %237 = add i64 %236, %233
  %238 = getelementptr double, ptr @_QFEphi, i64 %237
  store double %229, ptr %238, align 8
  %239 = sub i64 %215, 1
  br label %213

240:                                              ; preds = %213
  %241 = add i64 %210, 1
  %242 = sub i64 %211, 1
  br label %209

243:                                              ; preds = %97
  %244 = call contract double @_FortranACpuTime()
  store double %244, ptr %7, align 8
  %245 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr @_QQcl.2E2F2E2F72686F2F746573742E66393000, i32 56)
  %246 = load double, ptr %7, align 8
  %247 = load double, ptr %5, align 8
  %248 = fsub contract double %246, %247
  %249 = call i1 @_FortranAioOutputReal64(ptr %245, double %248)
  %250 = load i32, ptr %9, align 4
  %251 = call i1 @_FortranAioOutputInteger32(ptr %245, i32 %250)
  %252 = call i32 @_FortranAioEndIoStatement(ptr %245)
  ret void
}

declare double @_FortranACpuTime()

declare double @_FortranAMaxvalReal8(ptr, ptr, i32, i32, ptr)

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare i1 @_FortranAioOutputReal64(ptr, double)

declare i1 @_FortranAioOutputInteger32(ptr, i32)

declare i32 @_FortranAioEndIoStatement(ptr)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

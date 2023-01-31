; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000 = linkonce constant [27 x i8] c"././intr_fnc_test/test.f90\00"

declare ptr @malloc(i64)

declare void @free(ptr)

define i32 @_QMtestPmax_sum_open(ptr %0) {
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, i64 1, align 8
  %6 = alloca i32, i64 1, align 4
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 2, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %4, align 8
  %7 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %7, ptr %5, align 8
  %8 = call {} @_FortranASumDim(ptr %5, ptr %0, i32 1, ptr @_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000, i32 6, ptr null)
  %9 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %9, ptr %3, align 8
  %10 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 0
  %11 = load i64, ptr %10, align 8
  %12 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 2
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = icmp eq i64 %13, 0
  %19 = select i1 %18, i64 1, i64 %11
  %20 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] undef }, i64 %19, 7, 0, 0
  %21 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %20, i64 %13, 7, 0, 1
  %22 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %21, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), 7, 0, 2
  %23 = mul i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), %13
  %24 = mul i64 1, %13
  %25 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %22, ptr %17, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %25, ptr %2, align 8
  %26 = call i32 @_FortranAMaxvalInteger4(ptr %2, ptr @_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000, i32 6, i32 0, ptr null)
  store i32 %26, ptr %6, align 4
  call void @free(ptr %17)
  %27 = load i32, ptr %6, align 4
  ret i32 %27
}

define i32 @_QMtestPmax_sum_3x3(ptr %0) {
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %6 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, i64 1, align 8
  %7 = alloca i32, i64 1, align 4
  %8 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 0, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 3, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 3)]] }, ptr %0, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %8, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 2, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %4, align 8
  %9 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %9, ptr %6, align 8
  %10 = call {} @_FortranASumDim(ptr %6, ptr %5, i32 1, ptr @_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000, i32 12, ptr null)
  %11 = load { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %6, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %11, ptr %3, align 8
  %12 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 0
  %13 = load i64, ptr %12, align 8
  %14 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 2
  %17 = load i64, ptr %16, align 8
  %18 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = icmp eq i64 %15, 0
  %21 = select i1 %20, i64 1, i64 %13
  %22 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] undef }, i64 %21, 7, 0, 0
  %23 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %22, i64 %15, 7, 0, 1
  %24 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %23, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), 7, 0, 2
  %25 = mul i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), %15
  %26 = mul i64 1, %15
  %27 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %24, ptr %19, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %27, ptr %2, align 8
  %28 = call i32 @_FortranAMaxvalInteger4(ptr %2, ptr @_QQcl.2E2F2E2F696E74725F666E635F746573742F746573742E66393000, i32 12, i32 0, ptr null)
  store i32 %28, ptr %7, align 4
  call void @free(ptr %19)
  %29 = load i32, ptr %7, align 4
  ret i32 %29
}

declare {} @_FortranASumDim(ptr, ptr, i32, ptr, i32, ptr)

declare i32 @_FortranAMaxvalInteger4(ptr, ptr, i32, i32, ptr)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

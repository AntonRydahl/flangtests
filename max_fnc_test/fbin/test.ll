; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQcl.2E2F2E2F6D61785F666E635F746573742F746573742E66393000 = linkonce constant [26 x i8] c"././max_fnc_test/test.f90\00"

declare ptr @malloc(i64)

declare void @free(ptr)

define i32 @_QMtestPmval_open(ptr %0) {
  %2 = alloca i32, i64 1, align 4
  %3 = call i32 @_FortranAMaxvalInteger4(ptr %0, ptr @_QQcl.2E2F2E2F6D61785F666E635F746573742F746573742E66393000, i32 7, i32 0, ptr null)
  store i32 %3, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  ret i32 %4
}

define i32 @_QMtestPmval_closed(ptr %0) {
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca i32, i64 1, align 4
  %4 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 1, i8 9, i8 0, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)]] }, ptr %0, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } %4, ptr %2, align 8
  %5 = call i32 @_FortranAMaxvalInteger4(ptr %2, ptr @_QQcl.2E2F2E2F6D61785F666E635F746573742F746573742E66393000, i32 13, i32 0, ptr null)
  store i32 %5, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  ret i32 %6
}

declare i32 @_FortranAMaxvalInteger4(ptr, ptr, i32, i32, ptr)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

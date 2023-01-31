; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQcl.2E2F2E2F7472616E73706F73655F746573742F746573742E66393000 = linkonce constant [28 x i8] c"././transpose_test/test.f90\00"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @_QMtestPtrans_open(ptr %0, ptr %1) {
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, i64 1, align 8
  %6 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 0, i32 0
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 0, i32 1
  %9 = load i64, ptr %8, align 8
  %10 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = icmp sgt i64 %9, 0
  %13 = select i1 %12, i64 %9, i64 0
  %14 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 1, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 1, i32 1
  %17 = load i64, ptr %16, align 8
  %18 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i32 0, i32 7, i64 1, i32 2
  %19 = load i64, ptr %18, align 8
  %20 = icmp sgt i64 %17, 0
  %21 = select i1 %20, i64 %17, i64 0
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 2, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]] }, ptr %4, align 8
  %22 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %22, ptr %5, align 8
  %23 = call {} @_FortranATranspose(ptr %5, ptr %1, ptr @_QQcl.2E2F2E2F7472616E73706F73655F746573742F746573742E66393000, i32 8)
  %24 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %24, ptr %3, align 8
  %25 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 0
  %26 = load i64, ptr %25, align 8
  %27 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 1
  %28 = load i64, ptr %27, align 8
  %29 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 2
  %30 = load i64, ptr %29, align 8
  %31 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 0
  %32 = load i64, ptr %31, align 8
  %33 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 1
  %34 = load i64, ptr %33, align 8
  %35 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 2
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 0
  %38 = load ptr, ptr %37, align 8
  br label %39

39:                                               ; preds = %76, %2
  %40 = phi i64 [ %77, %76 ], [ 0, %2 ]
  %41 = phi i64 [ %78, %76 ], [ %21, %2 ]
  %42 = icmp sgt i64 %41, 0
  br i1 %42, label %43, label %79

43:                                               ; preds = %47, %39
  %44 = phi i64 [ %62, %47 ], [ 0, %39 ]
  %45 = phi i64 [ %75, %47 ], [ %13, %39 ]
  %46 = icmp sgt i64 %45, 0
  br i1 %46, label %47, label %76

47:                                               ; preds = %43
  %48 = add i64 %44, %26
  %49 = add i64 %40, %32
  %50 = sub i64 %48, %26
  %51 = mul i64 %50, 1
  %52 = mul i64 %51, 1
  %53 = add i64 %52, 0
  %54 = mul i64 1, %28
  %55 = sub i64 %49, %32
  %56 = mul i64 %55, 1
  %57 = mul i64 %56, %54
  %58 = add i64 %57, %53
  %59 = mul i64 %54, %34
  %60 = getelementptr i32, ptr %38, i64 %58
  %61 = load i32, ptr %60, align 4
  %62 = add i64 %44, 1
  %63 = add i64 %40, 1
  %64 = sub i64 %62, 1
  %65 = mul i64 %64, 1
  %66 = mul i64 %65, 1
  %67 = add i64 %66, 0
  %68 = mul i64 1, %13
  %69 = sub i64 %63, 1
  %70 = mul i64 %69, 1
  %71 = mul i64 %70, %68
  %72 = add i64 %71, %67
  %73 = mul i64 %68, %21
  %74 = getelementptr i32, ptr %0, i64 %72
  store i32 %61, ptr %74, align 4
  %75 = sub i64 %45, 1
  br label %43

76:                                               ; preds = %43
  %77 = add i64 %40, 1
  %78 = sub i64 %41, 1
  br label %39

79:                                               ; preds = %39
  call void @free(ptr %38)
  ret void
}

define void @_QMtestPtrans_closed(ptr %0, ptr %1) {
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %6 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, i64 1, align 8
  %7 = insertvalue { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr undef, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 0, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 3, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 3, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 3)]] }, ptr %1, 0
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %7, ptr %5, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } { ptr null, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i32 20180515, i8 2, i8 9, i8 2, i8 0, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)], [3 x i64] [i64 1, i64 0, i64 0]] }, ptr %4, align 8
  %8 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %8, ptr %6, align 8
  %9 = call {} @_FortranATranspose(ptr %6, ptr %5, ptr @_QQcl.2E2F2E2F7472616E73706F73655F746573742F746573742E66393000, i32 15)
  %10 = load { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %6, align 8
  store { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] } %10, ptr %3, align 8
  %11 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 0
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 1
  %14 = load i64, ptr %13, align 8
  %15 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 0, i32 2
  %16 = load i64, ptr %15, align 8
  %17 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 0
  %18 = load i64, ptr %17, align 8
  %19 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 1
  %20 = load i64, ptr %19, align 8
  %21 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 7, i64 1, i32 2
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  br label %25

25:                                               ; preds = %60, %2
  %26 = phi i64 [ %61, %60 ], [ 0, %2 ]
  %27 = phi i64 [ %62, %60 ], [ 3, %2 ]
  %28 = icmp sgt i64 %27, 0
  br i1 %28, label %29, label %63

29:                                               ; preds = %33, %25
  %30 = phi i64 [ %48, %33 ], [ 0, %25 ]
  %31 = phi i64 [ %59, %33 ], [ 3, %25 ]
  %32 = icmp sgt i64 %31, 0
  br i1 %32, label %33, label %60

33:                                               ; preds = %29
  %34 = add i64 %30, %12
  %35 = add i64 %26, %18
  %36 = sub i64 %34, %12
  %37 = mul i64 %36, 1
  %38 = mul i64 %37, 1
  %39 = add i64 %38, 0
  %40 = mul i64 1, %14
  %41 = sub i64 %35, %18
  %42 = mul i64 %41, 1
  %43 = mul i64 %42, %40
  %44 = add i64 %43, %39
  %45 = mul i64 %40, %20
  %46 = getelementptr i32, ptr %24, i64 %44
  %47 = load i32, ptr %46, align 4
  %48 = add i64 %30, 1
  %49 = add i64 %26, 1
  %50 = sub i64 %48, 1
  %51 = mul i64 %50, 1
  %52 = mul i64 %51, 1
  %53 = add i64 %52, 0
  %54 = sub i64 %49, 1
  %55 = mul i64 %54, 1
  %56 = mul i64 %55, 3
  %57 = add i64 %56, %53
  %58 = getelementptr i32, ptr %0, i64 %57
  store i32 %47, ptr %58, align 4
  %59 = sub i64 %31, 1
  br label %29

60:                                               ; preds = %29
  %61 = add i64 %26, 1
  %62 = sub i64 %27, 1
  br label %25

63:                                               ; preds = %25
  call void @free(ptr %24)
  ret void
}

define void @_QMtestPtrans_manual(ptr %0, ptr %1) {
  br label %3

3:                                                ; preds = %7, %2
  %4 = phi i64 [ %8, %7 ], [ 0, %2 ]
  %5 = phi i64 [ %23, %7 ], [ 3, %2 ]
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %24

7:                                                ; preds = %3
  %8 = add i64 %4, 1
  %9 = sub i64 %8, 1
  %10 = mul i64 %9, 1
  %11 = add i64 %10, 0
  %12 = mul i64 %11, 1
  %13 = add i64 %12, 0
  %14 = add i64 0, %13
  %15 = getelementptr i32, ptr %1, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = sub i64 %8, 1
  %18 = mul i64 %17, 1
  %19 = add i64 %18, 0
  %20 = mul i64 %19, 3
  %21 = add i64 %20, 0
  %22 = getelementptr i32, ptr %0, i64 %21
  store i32 %16, ptr %22, align 4
  %23 = sub i64 %5, 1
  br label %3

24:                                               ; preds = %3
  br label %25

25:                                               ; preds = %29, %24
  %26 = phi i64 [ %30, %29 ], [ 0, %24 ]
  %27 = phi i64 [ %45, %29 ], [ 3, %24 ]
  %28 = icmp sgt i64 %27, 0
  br i1 %28, label %29, label %46

29:                                               ; preds = %25
  %30 = add i64 %26, 1
  %31 = sub i64 %30, 1
  %32 = mul i64 %31, 1
  %33 = add i64 %32, 0
  %34 = mul i64 %33, 1
  %35 = add i64 %34, 0
  %36 = add i64 3, %35
  %37 = getelementptr i32, ptr %1, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = sub i64 %30, 1
  %40 = mul i64 %39, 1
  %41 = add i64 %40, 0
  %42 = mul i64 %41, 3
  %43 = add i64 %42, 1
  %44 = getelementptr i32, ptr %0, i64 %43
  store i32 %38, ptr %44, align 4
  %45 = sub i64 %27, 1
  br label %25

46:                                               ; preds = %25
  br label %47

47:                                               ; preds = %51, %46
  %48 = phi i64 [ %52, %51 ], [ 0, %46 ]
  %49 = phi i64 [ %67, %51 ], [ 3, %46 ]
  %50 = icmp sgt i64 %49, 0
  br i1 %50, label %51, label %68

51:                                               ; preds = %47
  %52 = add i64 %48, 1
  %53 = sub i64 %52, 1
  %54 = mul i64 %53, 1
  %55 = add i64 %54, 0
  %56 = mul i64 %55, 1
  %57 = add i64 %56, 0
  %58 = add i64 6, %57
  %59 = getelementptr i32, ptr %1, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = sub i64 %52, 1
  %62 = mul i64 %61, 1
  %63 = add i64 %62, 0
  %64 = mul i64 %63, 3
  %65 = add i64 %64, 2
  %66 = getelementptr i32, ptr %0, i64 %65
  store i32 %60, ptr %66, align 4
  %67 = sub i64 %49, 1
  br label %47

68:                                               ; preds = %47
  ret void
}

declare {} @_FortranATranspose(ptr, ptr, ptr, i32)

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}

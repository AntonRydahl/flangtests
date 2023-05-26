; ModuleID = './intr_fnc_test/test.c'
source_filename = "./intr_fnc_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mx_sum_3x3([3 x i32]* %0) #0 {
  %2 = alloca [3 x i32]*, align 8
  %3 = alloca [3 x i32], align 4
  store [3 x i32]* %0, [3 x i32]** %2, align 8
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 0
  %5 = load [3 x i32]*, [3 x i32]** %2, align 8
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %5, i64 0
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 0, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = load [3 x i32]*, [3 x i32]** %2, align 8
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 1
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 0, i64 0
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %8, %12
  %14 = load [3 x i32]*, [3 x i32]** %2, align 8
  %15 = getelementptr inbounds [3 x i32], [3 x i32]* %14, i64 2
  %16 = getelementptr inbounds [3 x i32], [3 x i32]* %15, i64 0, i64 0
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %13, %17
  store i32 %18, i32* %4, align 4
  %19 = getelementptr inbounds i32, i32* %4, i64 1
  %20 = load [3 x i32]*, [3 x i32]** %2, align 8
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %20, i64 1
  %22 = getelementptr inbounds [3 x i32], [3 x i32]* %21, i64 0, i64 0
  %23 = load i32, i32* %22, align 4
  %24 = load [3 x i32]*, [3 x i32]** %2, align 8
  %25 = getelementptr inbounds [3 x i32], [3 x i32]* %24, i64 1
  %26 = getelementptr inbounds [3 x i32], [3 x i32]* %25, i64 0, i64 1
  %27 = load i32, i32* %26, align 4
  %28 = add nsw i32 %23, %27
  %29 = load [3 x i32]*, [3 x i32]** %2, align 8
  %30 = getelementptr inbounds [3 x i32], [3 x i32]* %29, i64 1
  %31 = getelementptr inbounds [3 x i32], [3 x i32]* %30, i64 0, i64 2
  %32 = load i32, i32* %31, align 4
  %33 = add nsw i32 %28, %32
  store i32 %33, i32* %19, align 4
  %34 = getelementptr inbounds i32, i32* %19, i64 1
  %35 = load [3 x i32]*, [3 x i32]** %2, align 8
  %36 = getelementptr inbounds [3 x i32], [3 x i32]* %35, i64 2
  %37 = getelementptr inbounds [3 x i32], [3 x i32]* %36, i64 0, i64 0
  %38 = load i32, i32* %37, align 4
  %39 = load [3 x i32]*, [3 x i32]** %2, align 8
  %40 = getelementptr inbounds [3 x i32], [3 x i32]* %39, i64 2
  %41 = getelementptr inbounds [3 x i32], [3 x i32]* %40, i64 0, i64 1
  %42 = load i32, i32* %41, align 4
  %43 = add nsw i32 %38, %42
  %44 = load [3 x i32]*, [3 x i32]** %2, align 8
  %45 = getelementptr inbounds [3 x i32], [3 x i32]* %44, i64 2
  %46 = getelementptr inbounds [3 x i32], [3 x i32]* %45, i64 0, i64 2
  %47 = load i32, i32* %46, align 4
  %48 = add nsw i32 %43, %47
  store i32 %48, i32* %34, align 4
  %49 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 0
  %50 = load i32, i32* %49, align 4
  %51 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 1
  %52 = load i32, i32* %51, align 4
  %53 = icmp sgt i32 %50, %52
  br i1 %53, label %54, label %57

54:                                               ; preds = %1
  %55 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 0
  %56 = load i32, i32* %55, align 4
  br label %60

57:                                               ; preds = %1
  %58 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 1
  %59 = load i32, i32* %58, align 4
  br label %60

60:                                               ; preds = %57, %54
  %61 = phi i32 [ %56, %54 ], [ %59, %57 ]
  %62 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 2
  %63 = load i32, i32* %62, align 4
  %64 = icmp sgt i32 %61, %63
  br i1 %64, label %65, label %79

65:                                               ; preds = %60
  %66 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 0
  %67 = load i32, i32* %66, align 4
  %68 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 1
  %69 = load i32, i32* %68, align 4
  %70 = icmp sgt i32 %67, %69
  br i1 %70, label %71, label %74

71:                                               ; preds = %65
  %72 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 0
  %73 = load i32, i32* %72, align 4
  br label %77

74:                                               ; preds = %65
  %75 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 1
  %76 = load i32, i32* %75, align 4
  br label %77

77:                                               ; preds = %74, %71
  %78 = phi i32 [ %73, %71 ], [ %76, %74 ]
  br label %82

79:                                               ; preds = %60
  %80 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 2
  %81 = load i32, i32* %80, align 4
  br label %82

82:                                               ; preds = %79, %77
  %83 = phi i32 [ %78, %77 ], [ %81, %79 ]
  ret i32 %83
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mx_sum_open(i32* %0, i32 %1, i32 %2) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  br label %11

11:                                               ; preds = %46, %3
  %12 = load i32, i32* %8, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %49

15:                                               ; preds = %11
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %16

16:                                               ; preds = %33, %15
  %17 = load i32, i32* %10, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %36

20:                                               ; preds = %16
  %21 = load i32*, i32** %4, align 8
  %22 = load i32, i32* %10, align 4
  %23 = load i32, i32* %5, align 4
  %24 = mul nsw i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %21, i64 %25
  %27 = load i32, i32* %8, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %26, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %9, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, i32* %9, align 4
  br label %33

33:                                               ; preds = %20
  %34 = load i32, i32* %10, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %10, align 4
  br label %16

36:                                               ; preds = %16
  %37 = load i32, i32* %7, align 4
  %38 = load i32, i32* %9, align 4
  %39 = icmp sgt i32 %37, %38
  br i1 %39, label %40, label %42

40:                                               ; preds = %36
  %41 = load i32, i32* %7, align 4
  br label %44

42:                                               ; preds = %36
  %43 = load i32, i32* %9, align 4
  br label %44

44:                                               ; preds = %42, %40
  %45 = phi i32 [ %41, %40 ], [ %43, %42 ]
  store i32 %45, i32* %7, align 4
  br label %46

46:                                               ; preds = %44
  %47 = load i32, i32* %8, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %8, align 4
  br label %11

49:                                               ; preds = %11
  %50 = load i32, i32* %7, align 4
  ret i32 %50
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

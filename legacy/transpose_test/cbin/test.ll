; ModuleID = './transpose_test/test.c'
source_filename = "./transpose_test/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @trans_open(i32* %0, i32* %1, i32 %2, i32 %3) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %11

11:                                               ; preds = %44, %4
  %12 = load i32, i32* %9, align 4
  %13 = load i32, i32* %7, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %47

15:                                               ; preds = %11
  store i32 0, i32* %10, align 4
  br label %16

16:                                               ; preds = %40, %15
  %17 = load i32, i32* %10, align 4
  %18 = load i32, i32* %8, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %43

20:                                               ; preds = %16
  %21 = load i32*, i32** %5, align 8
  %22 = load i32, i32* %9, align 4
  %23 = load i32, i32* %7, align 4
  %24 = mul nsw i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %21, i64 %25
  %27 = load i32, i32* %10, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %26, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = load i32*, i32** %6, align 8
  %32 = load i32, i32* %9, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32* %31, i64 %33
  %35 = load i32, i32* %10, align 4
  %36 = load i32, i32* %7, align 4
  %37 = mul nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %34, i64 %38
  store i32 %30, i32* %39, align 4
  br label %40

40:                                               ; preds = %20
  %41 = load i32, i32* %10, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %10, align 4
  br label %16

43:                                               ; preds = %16
  br label %44

44:                                               ; preds = %43
  %45 = load i32, i32* %9, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %9, align 4
  br label %11

47:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @trans_closed([3 x i32]* %0, [3 x i32]* %1) #0 {
  %3 = alloca [3 x i32]*, align 8
  %4 = alloca [3 x i32]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store [3 x i32]* %0, [3 x i32]** %3, align 8
  store [3 x i32]* %1, [3 x i32]** %4, align 8
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %34, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %37

10:                                               ; preds = %7
  store i32 0, i32* %6, align 4
  br label %11

11:                                               ; preds = %30, %10
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %12, 3
  br i1 %13, label %14, label %33

14:                                               ; preds = %11
  %15 = load [3 x i32]*, [3 x i32]** %3, align 8
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [3 x i32], [3 x i32]* %15, i64 %17
  %19 = load i32, i32* %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = load [3 x i32]*, [3 x i32]** %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [3 x i32], [3 x i32]* %23, i64 %25
  %27 = load i32, i32* %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [3 x i32], [3 x i32]* %26, i64 0, i64 %28
  store i32 %22, i32* %29, align 4
  br label %30

30:                                               ; preds = %14
  %31 = load i32, i32* %6, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %6, align 4
  br label %11

33:                                               ; preds = %11
  br label %34

34:                                               ; preds = %33
  %35 = load i32, i32* %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %5, align 4
  br label %7

37:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @trans_manual([3 x i32]* %0, [3 x i32]* %1) #0 {
  %3 = alloca [3 x i32]*, align 8
  %4 = alloca [3 x i32]*, align 8
  store [3 x i32]* %0, [3 x i32]** %3, align 8
  store [3 x i32]* %1, [3 x i32]** %4, align 8
  %5 = load [3 x i32]*, [3 x i32]** %3, align 8
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %5, i64 1
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %6, i64 0, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = load [3 x i32]*, [3 x i32]** %4, align 8
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 0
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 0, i64 1
  store i32 %8, i32* %11, align 4
  %12 = load [3 x i32]*, [3 x i32]** %3, align 8
  %13 = getelementptr inbounds [3 x i32], [3 x i32]* %12, i64 0
  %14 = getelementptr inbounds [3 x i32], [3 x i32]* %13, i64 0, i64 1
  %15 = load i32, i32* %14, align 4
  %16 = load [3 x i32]*, [3 x i32]** %4, align 8
  %17 = getelementptr inbounds [3 x i32], [3 x i32]* %16, i64 1
  %18 = getelementptr inbounds [3 x i32], [3 x i32]* %17, i64 0, i64 0
  store i32 %15, i32* %18, align 4
  %19 = load [3 x i32]*, [3 x i32]** %3, align 8
  %20 = getelementptr inbounds [3 x i32], [3 x i32]* %19, i64 2
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %20, i64 0, i64 0
  %22 = load i32, i32* %21, align 4
  %23 = load [3 x i32]*, [3 x i32]** %4, align 8
  %24 = getelementptr inbounds [3 x i32], [3 x i32]* %23, i64 0
  %25 = getelementptr inbounds [3 x i32], [3 x i32]* %24, i64 0, i64 2
  store i32 %22, i32* %25, align 4
  %26 = load [3 x i32]*, [3 x i32]** %3, align 8
  %27 = getelementptr inbounds [3 x i32], [3 x i32]* %26, i64 0
  %28 = getelementptr inbounds [3 x i32], [3 x i32]* %27, i64 0, i64 2
  %29 = load i32, i32* %28, align 4
  %30 = load [3 x i32]*, [3 x i32]** %4, align 8
  %31 = getelementptr inbounds [3 x i32], [3 x i32]* %30, i64 2
  %32 = getelementptr inbounds [3 x i32], [3 x i32]* %31, i64 0, i64 0
  store i32 %29, i32* %32, align 4
  %33 = load [3 x i32]*, [3 x i32]** %3, align 8
  %34 = getelementptr inbounds [3 x i32], [3 x i32]* %33, i64 1
  %35 = getelementptr inbounds [3 x i32], [3 x i32]* %34, i64 0, i64 2
  %36 = load i32, i32* %35, align 4
  %37 = load [3 x i32]*, [3 x i32]** %4, align 8
  %38 = getelementptr inbounds [3 x i32], [3 x i32]* %37, i64 2
  %39 = getelementptr inbounds [3 x i32], [3 x i32]* %38, i64 0, i64 1
  store i32 %36, i32* %39, align 4
  %40 = load [3 x i32]*, [3 x i32]** %3, align 8
  %41 = getelementptr inbounds [3 x i32], [3 x i32]* %40, i64 2
  %42 = getelementptr inbounds [3 x i32], [3 x i32]* %41, i64 0, i64 1
  %43 = load i32, i32* %42, align 4
  %44 = load [3 x i32]*, [3 x i32]** %4, align 8
  %45 = getelementptr inbounds [3 x i32], [3 x i32]* %44, i64 1
  %46 = getelementptr inbounds [3 x i32], [3 x i32]* %45, i64 0, i64 2
  store i32 %43, i32* %46, align 4
  %47 = load [3 x i32]*, [3 x i32]** %3, align 8
  %48 = getelementptr inbounds [3 x i32], [3 x i32]* %47, i64 0
  %49 = getelementptr inbounds [3 x i32], [3 x i32]* %48, i64 0, i64 0
  %50 = load i32, i32* %49, align 4
  %51 = load [3 x i32]*, [3 x i32]** %4, align 8
  %52 = getelementptr inbounds [3 x i32], [3 x i32]* %51, i64 0
  %53 = getelementptr inbounds [3 x i32], [3 x i32]* %52, i64 0, i64 0
  store i32 %50, i32* %53, align 4
  %54 = load [3 x i32]*, [3 x i32]** %3, align 8
  %55 = getelementptr inbounds [3 x i32], [3 x i32]* %54, i64 1
  %56 = getelementptr inbounds [3 x i32], [3 x i32]* %55, i64 0, i64 1
  %57 = load i32, i32* %56, align 4
  %58 = load [3 x i32]*, [3 x i32]** %4, align 8
  %59 = getelementptr inbounds [3 x i32], [3 x i32]* %58, i64 1
  %60 = getelementptr inbounds [3 x i32], [3 x i32]* %59, i64 0, i64 1
  store i32 %57, i32* %60, align 4
  %61 = load [3 x i32]*, [3 x i32]** %3, align 8
  %62 = getelementptr inbounds [3 x i32], [3 x i32]* %61, i64 2
  %63 = getelementptr inbounds [3 x i32], [3 x i32]* %62, i64 0, i64 2
  %64 = load i32, i32* %63, align 4
  %65 = load [3 x i32]*, [3 x i32]** %4, align 8
  %66 = getelementptr inbounds [3 x i32], [3 x i32]* %65, i64 2
  %67 = getelementptr inbounds [3 x i32], [3 x i32]* %66, i64 0, i64 2
  store i32 %64, i32* %67, align 4
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

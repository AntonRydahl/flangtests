# The Basics of LLVM IR
The following example code 
```C
#include <stdio.h>

int main() {
    int a = 100;
    int b = 20;
    long long c = a + b;
    int d = (int) c;
    printf("%d\n",d);
    return 0;
}
```
can be compiled with
```bash
clang -std=c99 -emit-llvm -S -fno-dwarf2-cfi-asm -fno-asynchronous-unwind-tables add_scalars.c -o add_scalars.ll
```
to yield the following LLVM IR
```llvm
; ModuleID = 'add_scalars.c'
;source_filename = "add_scalars.c"
;target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
;target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  ; Three variables, a,b, and c, are allocated on the current stack frame
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  ; The value of a is set to -100
  store i32 -100, ptr %a, align 4
  ; The value of b is set to the value of a
  %0 = load i32, ptr %a, align 4
  store i32 %0, ptr %b, align 4
  ; Three virtual registers are used to compute a + b
  %1 = load i32, ptr %a, align 4
  %2 = load i32, ptr %b, align 4
  ; No signed wrap is used to avoid overflow checks
  %3 = add nsw i32 %1, %2
  ; c is set to a + b
  store i32 %3, ptr %c, align 4
  ; c=a+b=a+a=-200 is printed to the standard output
  %4 = load i32, ptr %c, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %4)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
```
The above LLVM IR can be compiled into a program by the following commands
```bash
llc -filetype=obj add_scalars.ll -o .o
clang add_scalars.o -Ofast -o add_scalars
./add_scalars
```

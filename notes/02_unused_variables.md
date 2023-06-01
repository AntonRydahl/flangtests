# Unused Variables
In this test, two small programs with an unused variable are compiled with `clang` and `flang-new`. The unnecessary variable is removed at optimization level three for both compilers.
<br>
The test can be compiled with the following command:
```bash
make APP=unused_variables OPT=<-O0,-O3>
```
## `clang`
### Optimization Level 0
```llvmir
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  ; The following stack allocation is unnecessary
  %d = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 9, ptr %a, align 4
  store i32 11, ptr %b, align 4
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %mul = mul nsw i32 %0, %1
  store i32 %mul, ptr %c, align 4
  %2 = load i32, ptr %c, align 4
  %3 = load i32, ptr %a, align 4
  %mul1 = mul nsw i32 %2, %3
  ; This region should ideally be eliminated
  %4 = load i32, ptr %b, align 4
  %mul2 = mul nsw i32 %mul1, %4
  store i32 %mul2, ptr %d, align 4
  ; The above store is never used again
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %b, align 4
  %7 = load i32, ptr %c, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5, i32 noundef %6, i32 noundef %7)
  ret i32 0
}
```

### Optimization Level 3
```llvmir
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 11, i32 noundef 99)
  ret i32 0
}
```

## `flang-new`
### Optimization Level 0
```llvmir
define void @_QQmain() {
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  ; The following stack allocation is unnecessary
  %4 = alloca i32, i64 1, align 4
  store i32 9, ptr %1, align 4
  store i32 11, ptr %2, align 4
  %5 = load i32, ptr %1, align 4
  %6 = load i32, ptr %2, align 4
  %7 = mul i32 %5, %6
  store i32 %7, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = mul i32 %8, %9
  ; This region should ideally be eliminated
  %11 = load i32, ptr %2, align 4
  %12 = mul i32 %10, %11
  store i32 %12, ptr %4, align 4
  ; The above store is never referenced again
  %13 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr @_QQcl.28612C69312C612C69322C612C693229, i64 16, ptr null, i32 -1, ptr @_QQcl.e785c8b6910eca214959dafb9952487f, i32 16)
  %14 = call i1 @_FortranAioOutputAscii(ptr %13, ptr @_QQcl.54686520726573756C74206F6620, i64 14)
  %15 = load i32, ptr %1, align 4
  %16 = call i1 @_FortranAioOutputInteger32(ptr %13, i32 %15)
  %17 = call i1 @_FortranAioOutputAscii(ptr %13, ptr @_QQcl.202A20, i64 3)
  %18 = load i32, ptr %2, align 4
  %19 = call i1 @_FortranAioOutputInteger32(ptr %13, i32 %18)
  %20 = call i1 @_FortranAioOutputAscii(ptr %13, ptr @_QQcl.20697320, i64 4)
  %21 = load i32, ptr %3, align 4
  %22 = call i1 @_FortranAioOutputInteger32(ptr %13, i32 %21)
  %23 = call i32 @_FortranAioEndIoStatement(ptr %13)
  ret void
}
```


### Optimization Level 3
```llvmir
define void @_QQmain() local_unnamed_addr {
  %1 = tail call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69312C612C69322C612C693229, i64 16, ptr null, i32 -1, ptr nonnull @_QQcl.e785c8b6910eca214959dafb9952487f, i32 16)
  %2 = tail call i1 @_FortranAioOutputAscii(ptr %1, ptr nonnull @_QQcl.54686520726573756C74206F6620, i64 14)
  %3 = tail call i1 @_FortranAioOutputInteger32(ptr %1, i32 9)
  %4 = tail call i1 @_FortranAioOutputAscii(ptr %1, ptr nonnull @_QQcl.202A20, i64 3)
  %5 = tail call i1 @_FortranAioOutputInteger32(ptr %1, i32 11)
  %6 = tail call i1 @_FortranAioOutputAscii(ptr %1, ptr nonnull @_QQcl.20697320, i64 4)
  %7 = tail call i1 @_FortranAioOutputInteger32(ptr %1, i32 99)
  %8 = tail call i32 @_FortranAioEndIoStatement(ptr %1)
  ret void
}
```

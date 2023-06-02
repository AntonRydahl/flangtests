# How `num_threads(n)` Impacts the Code

The examples were compiled with
```bash
make APP=parallel_loop OPT=-O3 OMP=1
```
and
```bash
make APP=num_threads OPT=-O3 OMP=1
```

## `clang`

### Without `num_threads(n)`

```llvm
; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %length = alloca i32, align 4
  %arr = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %length) #4
  store i32 1048576, ptr %length, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %arr) #4
  %call = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #8
  store ptr %call, ptr %arr, align 8, !tbaa !9
```
<span style="color:red">The number of threads is not specified before forking a parallel region:</span>.
```llvm
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @2, i32 2, ptr nonnull @main.omp_outlined, ptr nonnull %length, ptr nonnull %arr)
  %0 = load ptr, ptr %arr, align 8, !tbaa !9
  %1 = load double, ptr %0, align 8, !tbaa !11
  %arrayidx1 = getelementptr inbounds double, ptr %0, i64 1048575
  %2 = load double, ptr %arrayidx1, align 8, !tbaa !11
  %add = fadd double %1, %2
  %call2 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1048575, double noundef %add)
  %3 = load ptr, ptr %arr, align 8, !tbaa !9
  call void @free(ptr noundef %3) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %arr) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %length) #4
  ret i32 0
}
```
### With `num_threads(n)`

```llvm
; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %length = alloca i32, align 4
  %arr = alloca ptr, align 8
  %0 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @2)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %length) #4
  store i32 1048576, ptr %length, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %arr) #4
  %call = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #8
  store ptr %call, ptr %arr, align 8, !tbaa !9
```
<span style="color:red">The number of threads is specified with a call to `__kmpc_push_num_threads()`:</span>.
```llvm
  tail call void @__kmpc_push_num_threads(ptr nonnull @2, i32 %0, i32 24)
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @2, i32 2, ptr nonnull @main.omp_outlined, ptr nonnull %length, ptr nonnull %arr)
  %1 = load ptr, ptr %arr, align 8, !tbaa !9
  %2 = load double, ptr %1, align 8, !tbaa !11
  %arrayidx1 = getelementptr inbounds double, ptr %1, i64 1048575
  %3 = load double, ptr %arrayidx1, align 8, !tbaa !11
  %add = fadd double %2, %3
  %call2 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1048575, double noundef %add)
  %4 = load ptr, ptr %arr, align 8, !tbaa !9
  call void @free(ptr noundef %4) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %arr) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %length) #4
  ret i32 0
}
```

## `flang-new`
### Without `num_threads(n)`
```llvm
define void @_QQmain() local_unnamed_addr {
entry:
  %structArg = alloca { ptr, ptr }, align 8
  %0 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %1 = alloca i32, align 4
  store i32 1048576, ptr %1, align 4, !tbaa !4
  %2 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %2, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 true, ptr @_QFEarr.8, align 1
  %omp_global_thread_num = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  store ptr %1, ptr %structArg, align 8
  %gep_5 = getelementptr inbounds { ptr, ptr }, ptr %structArg, i64 0, i32 1
  store ptr %0, ptr %gep_5, align 8
```
<span style="color:red">The number of threads is not specified before forking a parallel region:</span>.
```llvm
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QQmain..omp_par, ptr nonnull %structArg)
  %3 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6631302E3929, i64 14, ptr null, i32 -1, ptr nonnull @_QQcl.412af3a0d982698e911d95b829b2040$
  %4 = call i1 @_FortranAioOutputAscii(ptr %3, ptr nonnull @_QQcl.54686520726573756C74206F6620617272283129203D2061727228, i64 27)
  %5 = load i32, ptr %1, align 4, !tbaa !4
  %6 = call i1 @_FortranAioOutputInteger32(ptr %3, i32 %5)
  %7 = call i1 @_FortranAioOutputAscii(ptr %3, ptr nonnull @_QQcl.2920697320, i64 5)
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  %8 = load double, ptr %.unpack, align 8, !tbaa !4
  %9 = load i32, ptr %1, align 4, !tbaa !4
  %10 = sext i32 %9 to i64
  %11 = add nsw i64 %10, -1
  %12 = getelementptr double, ptr %.unpack, i64 %11
  %13 = load double, ptr %12, align 8, !tbaa !4
  %14 = fadd contract double %8, %13
  %15 = call i1 @_FortranAioOutputReal64(ptr %3, double %14)
  %16 = call i32 @_FortranAioEndIoStatement(ptr %3)
  %.unpack100 = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  call void @free(ptr %.unpack100)
  store ptr null, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 false, ptr @_QFEarr.8, align 1
  ret void
}
```

### With `num_threads(n)`
```llvm
define void @_QQmain() local_unnamed_addr {
entry:
  %structArg = alloca { ptr, ptr }, align 8
  %0 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %1 = alloca i32, align 4
  store i32 1048576, ptr %1, align 4, !tbaa !4
  %2 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %2, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 true, ptr @_QFEarr.8, align 1
  %omp_global_thread_num = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
```
<span style="color:red">The number of threads is specified with a call to `__kmpc_push_num_threads()`:</span>.
```llvm
  tail call void @__kmpc_push_num_threads(ptr nonnull @1, i32 %omp_global_thread_num, i32 24)
  store ptr %1, ptr %structArg, align 8
  %gep_5 = getelementptr inbounds { ptr, ptr }, ptr %structArg, i64 0, i32 1
  store ptr %0, ptr %gep_5, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QQmain..omp_par, ptr nonnull %structArg)
  %3 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6631302E3929, i64 14, ptr null, i32 -1, ptr nonnull @_QQcl.82ac67a3df5ef3e9715de432a416cea$
  %4 = call i1 @_FortranAioOutputAscii(ptr %3, ptr nonnull @_QQcl.54686520726573756C74206F6620617272283129203D2061727228, i64 27)
  %5 = load i32, ptr %1, align 4, !tbaa !4
  %6 = call i1 @_FortranAioOutputInteger32(ptr %3, i32 %5)
  %7 = call i1 @_FortranAioOutputAscii(ptr %3, ptr nonnull @_QQcl.2920697320, i64 5)
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  %8 = load double, ptr %.unpack, align 8, !tbaa !4
  %9 = load i32, ptr %1, align 4, !tbaa !4
  %10 = sext i32 %9 to i64
  %11 = add nsw i64 %10, -1
  %12 = getelementptr double, ptr %.unpack, i64 %11
  %13 = load double, ptr %12, align 8, !tbaa !4
  %14 = fadd contract double %8, %13
  %15 = call i1 @_FortranAioOutputReal64(ptr %3, double %14)
  %16 = call i32 @_FortranAioEndIoStatement(ptr %3)
  %.unpack100 = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  call void @free(ptr %.unpack100)
  store ptr null, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 false, ptr @_QFEarr.8, align 1
  ret void
}
```

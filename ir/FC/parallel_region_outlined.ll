; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QQcl.28612C69372C612C6531332E36653229 = internal constant [16 x i8] c"(a,i7,a,e13.6e2)"
@_QQcl.e8a0ac9186c064ac8543d822e9060d96 = internal constant [59 x i8] c"/g/g92/rydahl1/flangtests/src/parallel_region_outlined.f90\00"
@_QQcl.54686520726573756C74206F6620286172722831292B61727228 = internal constant [26 x i8] c"The result of (arr(1)+arr("
@_QQcl.2920697320 = internal constant [5 x i8] c") is "
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
  %structArg.i = alloca { ptr, ptr, ptr, ptr, ptr }, align 8
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca { ptr, ptr }, align 8
  store ptr %4, ptr %6, align 8, !tbaa !4
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i64 0, i32 1
  store ptr %5, ptr %7, align 8, !tbaa !4
  store i32 1048576, ptr %4, align 4, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %structArg.i)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %2)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %3)
  %.fca.1.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 1
  %.fca.2.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 2
  %.fca.3.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 3
  %.fca.4.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 4
  %.fca.5.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 5
  %.fca.6.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 6
  %.fca.7.0.0.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 2
  %8 = call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %8, ptr %3, align 8, !tbaa !8
  store i64 8, ptr %.fca.1.gep.i, align 8, !tbaa !8
  store i32 20180515, ptr %.fca.2.gep.i, align 8, !tbaa !8
  store i8 1, ptr %.fca.3.gep.i, align 4, !tbaa !8
  store i8 28, ptr %.fca.4.gep.i, align 1, !tbaa !8
  store i8 2, ptr %.fca.5.gep.i, align 2, !tbaa !8
  store i8 0, ptr %.fca.6.gep.i, align 1, !tbaa !8
  store i64 1, ptr %.fca.7.0.0.gep.i, align 8, !tbaa !8
  store i64 1048576, ptr %.fca.7.0.1.gep.i, align 8, !tbaa !8
  store i64 8, ptr %.fca.7.0.2.gep.i, align 8, !tbaa !8
  %omp_global_thread_num.i = call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  store ptr %4, ptr %structArg.i, align 8
  %gep_5.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 1
  store ptr %3, ptr %gep_5.i, align 8
  %gep_6.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 2
  store ptr %2, ptr %gep_6.i, align 8
  %gep_7.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 3
  store ptr %1, ptr %gep_7.i, align 8
  %gep_8.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 4
  store ptr %6, ptr %gep_8.i, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QFPomp_subroutine..omp_par, ptr nonnull %structArg.i)
  %.fca.0.load.i = load ptr, ptr %3, align 8, !tbaa !8
  %.fca.7.0.0.load.i = load i64, ptr %.fca.7.0.0.gep.i, align 8, !tbaa !8
  %9 = sub i64 1, %.fca.7.0.0.load.i
  %10 = getelementptr double, ptr %.fca.0.load.i, i64 %9
  %11 = load double, ptr %10, align 8, !tbaa !4
  %12 = load i32, ptr %4, align 4, !tbaa !4
  %13 = sext i32 %12 to i64
  %14 = sub i64 %13, %.fca.7.0.0.load.i
  %15 = getelementptr double, ptr %.fca.0.load.i, i64 %14
  %16 = load double, ptr %15, align 8, !tbaa !4
  %17 = fadd contract double %11, %16
  call void @free(ptr %.fca.0.load.i)
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %structArg.i)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %2)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %3)
  %18 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6531332E36653229, i64 16, ptr null, i32 -1, ptr nonnull @_QQcl.e8a0ac9186c064ac8543d822e9060d96, i32 10)
  %19 = call i1 @_FortranAioOutputAscii(ptr %18, ptr nonnull @_QQcl.54686520726573756C74206F6620286172722831292B61727228, i64 26)
  %20 = load i32, ptr %4, align 4, !tbaa !4
  %21 = call i1 @_FortranAioOutputInteger32(ptr %18, i32 %20)
  %22 = call i1 @_FortranAioOutputAscii(ptr %18, ptr nonnull @_QQcl.2920697320, i64 5)
  %23 = call i1 @_FortranAioOutputReal64(ptr %18, double %17)
  %24 = call i32 @_FortranAioEndIoStatement(ptr %18)
  ret void
}

; Function Attrs: nounwind
define void @_QFPomp_subroutine(ptr %0, ptr nocapture writeonly %1, ptr nest %2) local_unnamed_addr #2 {
entry:
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 1
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 2
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 3
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 4
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 5
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 6
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 0, i64 2
  %6 = load i32, ptr %0, align 4, !tbaa !4
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = zext i32 %7 to i64
  %9 = shl nuw nsw i64 %8, 3
  %10 = tail call ptr @malloc(i64 %9)
  store ptr %10, ptr %5, align 8, !tbaa !8
  store i64 8, ptr %.fca.1.gep, align 8, !tbaa !8
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !8
  store i8 1, ptr %.fca.3.gep, align 4, !tbaa !8
  store i8 28, ptr %.fca.4.gep, align 1, !tbaa !8
  store i8 2, ptr %.fca.5.gep, align 2, !tbaa !8
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !8
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !8
  store i64 %8, ptr %.fca.7.0.1.gep, align 8, !tbaa !8
  store i64 8, ptr %.fca.7.0.2.gep, align 8, !tbaa !8
  %omp_global_thread_num = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  store ptr %0, ptr %structArg, align 8
  %gep_5 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 1
  store ptr %5, ptr %gep_5, align 8
  %gep_6 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 2
  store ptr %4, ptr %gep_6, align 8
  %gep_7 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 3
  store ptr %3, ptr %gep_7, align 8
  %gep_8 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 4
  store ptr %2, ptr %gep_8, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QFPomp_subroutine..omp_par, ptr nonnull %structArg)
  %.fca.0.load = load ptr, ptr %5, align 8, !tbaa !8
  %.fca.7.0.0.load = load i64, ptr %.fca.7.0.0.gep, align 8, !tbaa !8
  %11 = sub i64 1, %.fca.7.0.0.load
  %12 = getelementptr double, ptr %.fca.0.load, i64 %11
  %13 = load double, ptr %12, align 8, !tbaa !4
  %14 = load i32, ptr %0, align 4, !tbaa !4
  %15 = sext i32 %14 to i64
  %16 = sub i64 %15, %.fca.7.0.0.load
  %17 = getelementptr double, ptr %.fca.0.load, i64 %16
  %18 = load double, ptr %17, align 8, !tbaa !4
  %19 = fadd contract double %13, %18
  store double %19, ptr %1, align 8, !tbaa !4
  call void @free(ptr %.fca.0.load)
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @_QFPomp_subroutine..omp_par(ptr noalias nocapture readnone %tid.addr, ptr noalias nocapture readnone %zero.addr, ptr nocapture readonly %0) #3 {
omp.par.entry:
  %loadgep_ = load ptr, ptr %0, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %gep_5 = getelementptr { ptr, ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 3
  %loadgep_6 = load ptr, ptr %gep_5, align 8
  %gep_7 = getelementptr { ptr, ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 4
  %loadgep_8 = load ptr, ptr %gep_7, align 8
  %1 = tail call i32 @omp_get_thread_num()
  %2 = tail call i32 @omp_get_num_threads()
  %3 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %4 = sdiv i32 %3, %2
  %5 = mul i32 %4, %1
  %6 = add i32 %5, 1
  %7 = add i32 %2, -1
  %8 = icmp eq i32 %1, %7
  %9 = add i32 %6, %4
  %spec.select = select i1 %8, i32 %3, i32 %9
  %.unpack = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %.elt14 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 1
  %.unpack15 = load i64, ptr %.elt14, align 8, !tbaa !8
  %.elt16 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 2
  %.unpack17 = load i32, ptr %.elt16, align 8, !tbaa !8
  %.elt18 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 3
  %.unpack19 = load i8, ptr %.elt18, align 4, !tbaa !8
  %.elt20 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 4
  %.unpack21 = load i8, ptr %.elt20, align 1, !tbaa !8
  %.elt22 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 5
  %.unpack23 = load i8, ptr %.elt22, align 2, !tbaa !8
  %.elt24 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 6
  %.unpack25 = load i8, ptr %.elt24, align 1, !tbaa !8
  %.elt26 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7
  %.unpack27.unpack.unpack = load i64, ptr %.elt26, align 8, !tbaa !8
  %.unpack27.unpack.elt29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 1
  %.unpack27.unpack.unpack30 = load i64, ptr %.unpack27.unpack.elt29, align 8, !tbaa !8
  %.unpack27.unpack.elt31 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 2
  %.unpack27.unpack.unpack32 = load i64, ptr %.unpack27.unpack.elt31, align 8, !tbaa !8
  store ptr %.unpack, ptr %loadgep_4, align 8, !tbaa !8
  %loadgep_4.repack34 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 1
  store i64 %.unpack15, ptr %loadgep_4.repack34, align 8, !tbaa !8
  %loadgep_4.repack36 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 2
  store i32 %.unpack17, ptr %loadgep_4.repack36, align 8, !tbaa !8
  %loadgep_4.repack38 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 3
  store i8 %.unpack19, ptr %loadgep_4.repack38, align 4, !tbaa !8
  %loadgep_4.repack40 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 4
  store i8 %.unpack21, ptr %loadgep_4.repack40, align 1, !tbaa !8
  %loadgep_4.repack42 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 5
  store i8 %.unpack23, ptr %loadgep_4.repack42, align 2, !tbaa !8
  %loadgep_4.repack44 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 6
  store i8 %.unpack25, ptr %loadgep_4.repack44, align 1, !tbaa !8
  %loadgep_4.repack46 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7
  store i64 %.unpack27.unpack.unpack, ptr %loadgep_4.repack46, align 8, !tbaa !8
  %loadgep_4.repack46.repack48 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 1
  store i64 %.unpack27.unpack.unpack30, ptr %loadgep_4.repack46.repack48, align 8, !tbaa !8
  %loadgep_4.repack46.repack50 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 2
  store i64 %.unpack27.unpack.unpack32, ptr %loadgep_4.repack46.repack50, align 8, !tbaa !8
  %10 = icmp eq i64 %.unpack27.unpack.unpack30, 0
  %11 = select i1 %10, i64 1, i64 %.unpack27.unpack.unpack
  store ptr %.unpack, ptr %loadgep_6, align 8, !tbaa !8
  %loadgep_6.repack52 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 1
  store i64 8, ptr %loadgep_6.repack52, align 8, !tbaa !8
  %loadgep_6.repack54 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 2
  store i32 20180515, ptr %loadgep_6.repack54, align 8, !tbaa !8
  %loadgep_6.repack56 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 3
  store i8 1, ptr %loadgep_6.repack56, align 4, !tbaa !8
  %loadgep_6.repack58 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 4
  store i8 28, ptr %loadgep_6.repack58, align 1, !tbaa !8
  %loadgep_6.repack60 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 5
  store i8 0, ptr %loadgep_6.repack60, align 2, !tbaa !8
  %loadgep_6.repack62 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 6
  store i8 0, ptr %loadgep_6.repack62, align 1, !tbaa !8
  %loadgep_6.repack64 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7
  store i64 %11, ptr %loadgep_6.repack64, align 8, !tbaa !8
  %loadgep_6.repack64.repack66 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 1
  store i64 %.unpack27.unpack.unpack30, ptr %loadgep_6.repack64.repack66, align 8, !tbaa !8
  %loadgep_6.repack64.repack68 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 2
  store i64 8, ptr %loadgep_6.repack64.repack68, align 8, !tbaa !8
  %12 = load ptr, ptr %loadgep_8, align 8, !tbaa !4
  %13 = getelementptr { ptr, ptr }, ptr %loadgep_8, i64 0, i32 1
  %14 = load ptr, ptr %13, align 8, !tbaa !4
  %15 = sext i32 %6 to i64
  %16 = sext i32 %spec.select to i64
  %reass.sub9.i = sub nsw i64 %16, %15
  %17 = icmp sgt i64 %reass.sub9.i, -1
  br i1 %17, label %.lr.ph8.preheader.i, label %_QFPloop.exit

.lr.ph8.preheader.i:                              ; preds = %omp.par.entry
  %18 = add nsw i64 %reass.sub9.i, 1
  %19 = add nsw i64 %16, 2
  %20 = icmp ne i64 %18, 0
  %umin82.neg = sext i1 %20 to i64
  %21 = add nsw i64 %19, %umin82.neg
  %22 = sub nsw i64 %21, %15
  %min.iters.check = icmp ult i64 %22, 8
  br i1 %min.iters.check, label %.lr.ph8.i.preheader, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %.lr.ph8.preheader.i
  %23 = add nsw i64 %16, 1
  %24 = icmp ne i64 %18, 0
  %umin.neg = sext i1 %24 to i64
  %25 = add nsw i64 %23, %umin.neg
  %26 = sub nsw i64 %25, %15
  %27 = trunc i64 %26 to i32
  %28 = add i32 %6, %27
  %29 = icmp slt i32 %28, %6
  %30 = icmp ugt i64 %26, 4294967295
  %31 = or i1 %29, %30
  br i1 %31, label %.lr.ph8.i.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %scevgep = getelementptr i8, ptr %14, i64 8
  %scevgep71 = getelementptr i8, ptr %12, i64 4
  %32 = shl nsw i64 %15, 3
  %33 = add nsw i64 %32, -8
  %scevgep72 = getelementptr i8, ptr %.unpack, i64 %33
  %34 = shl nsw i64 %16, 3
  %35 = add nsw i64 %34, 8
  %.not = icmp eq i64 %18, 0
  %36 = select i1 %.not, i64 %35, i64 %34
  %scevgep74 = getelementptr i8, ptr %.unpack, i64 %36
  %bound0 = icmp ult ptr %14, %scevgep71
  %bound1 = icmp ult ptr %12, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound075 = icmp ult ptr %14, %scevgep74
  %bound176 = icmp ult ptr %scevgep72, %scevgep
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx = or i1 %found.conflict, %found.conflict77
  %bound078 = icmp ult ptr %12, %scevgep74
  %bound179 = icmp ult ptr %scevgep72, %scevgep71
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx81 = or i1 %conflict.rdx, %found.conflict80
  br i1 %conflict.rdx81, label %.lr.ph8.i.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %22, -2
  %ind.end = sub nsw i64 %18, %n.vec
  %.cast = trunc i64 %n.vec to i32
  %ind.end83 = add i32 %6, %.cast
  %37 = load i32, ptr %12, align 4, !tbaa !4, !alias.scope !10, !noalias !13
  %broadcast.splatinsert = insertelement <2 x i32> poison, i32 %37, i64 0
  %38 = sitofp <2 x i32> %broadcast.splatinsert to <2 x float>
  %39 = fdiv contract <2 x float> <float 1.000000e+00, float poison>, %38
  %40 = shufflevector <2 x float> %39, <2 x float> poison, <2 x i32> zeroinitializer
  %41 = fpext <2 x float> %40 to <2 x double>
  %42 = extractelement <2 x double> %41, i64 1
  store double %42, ptr %14, align 8, !tbaa !4, !alias.scope !15, !noalias !17
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %.cast85 = trunc i64 %index to i32
  %offset.idx = add i32 %6, %.cast85
  %43 = sext i32 %offset.idx to i64
  %44 = add nsw i64 %43, -1
  %45 = getelementptr double, ptr %.unpack, i64 %44
  store <2 x double> %41, ptr %45, align 8, !tbaa !4, !alias.scope !13
  %index.next = add nuw i64 %index, 2
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %22, %n.vec
  br i1 %cmp.n, label %_QFPloop.exit, label %.lr.ph8.i.preheader

.lr.ph8.i.preheader:                              ; preds = %vector.memcheck, %vector.scevcheck, %.lr.ph8.preheader.i, %middle.block
  %.ph = phi i64 [ %18, %vector.memcheck ], [ %18, %vector.scevcheck ], [ %18, %.lr.ph8.preheader.i ], [ %ind.end, %middle.block ]
  %.ph86 = phi i32 [ %6, %vector.memcheck ], [ %6, %vector.scevcheck ], [ %6, %.lr.ph8.preheader.i ], [ %ind.end83, %middle.block ]
  br label %.lr.ph8.i

.lr.ph8.i:                                        ; preds = %.lr.ph8.i.preheader, %.lr.ph8.i
  %47 = phi i64 [ %57, %.lr.ph8.i ], [ %.ph, %.lr.ph8.i.preheader ]
  %48 = phi i32 [ %56, %.lr.ph8.i ], [ %.ph86, %.lr.ph8.i.preheader ]
  %49 = load i32, ptr %12, align 4, !tbaa !4
  %50 = sitofp i32 %49 to float
  %51 = fdiv contract float 1.000000e+00, %50
  %52 = fpext float %51 to double
  %53 = sext i32 %48 to i64
  %54 = add nsw i64 %53, -1
  %55 = getelementptr double, ptr %.unpack, i64 %54
  store double %52, ptr %55, align 8, !tbaa !4
  store double %52, ptr %14, align 8, !tbaa !4
  %56 = add i32 %48, 1
  %57 = add nsw i64 %47, -1
  %58 = icmp ugt i64 %47, 1
  br i1 %58, label %.lr.ph8.i, label %_QFPloop.exit, !llvm.loop !21

_QFPloop.exit:                                    ; preds = %.lr.ph8.i, %middle.block, %omp.par.entry
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define void @_QFPloop(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nest nocapture readonly %3) local_unnamed_addr #4 {
  %5 = load ptr, ptr %3, align 8, !tbaa !4
  %6 = getelementptr { ptr, ptr }, ptr %3, i64 0, i32 1
  %7 = load ptr, ptr %6, align 8, !tbaa !4
  %8 = load i32, ptr %0, align 4, !tbaa !4
  %9 = sext i32 %8 to i64
  %10 = load i32, ptr %1, align 4, !tbaa !4
  %11 = sext i32 %10 to i64
  %12 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 2
  %13 = load i64, ptr %12, align 8, !tbaa !8
  %14 = icmp eq i64 %13, 8
  br i1 %14, label %15, label %59

15:                                               ; preds = %4
  %16 = load ptr, ptr %2, align 8, !tbaa !8
  %reass.sub9 = sub nsw i64 %11, %9
  %17 = icmp sgt i64 %reass.sub9, -1
  br i1 %17, label %.lr.ph8.preheader, label %.loopexit

.lr.ph8.preheader:                                ; preds = %15
  %18 = add nsw i64 %reass.sub9, 1
  %19 = add nsw i64 %11, 2
  %20 = icmp ne i64 %18, 0
  %umin24.neg = sext i1 %20 to i64
  %21 = add nsw i64 %19, %umin24.neg
  %22 = sub nsw i64 %21, %9
  %min.iters.check = icmp ult i64 %22, 8
  br i1 %min.iters.check, label %.lr.ph8.preheader28, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %.lr.ph8.preheader
  %23 = add nsw i64 %11, 1
  %24 = icmp ne i64 %18, 0
  %umin.neg = sext i1 %24 to i64
  %25 = add nsw i64 %23, %umin.neg
  %26 = sub nsw i64 %25, %9
  %27 = trunc i64 %26 to i32
  %28 = add i32 %8, %27
  %29 = icmp slt i32 %28, %8
  %30 = icmp ugt i64 %26, 4294967295
  %31 = or i1 %29, %30
  br i1 %31, label %.lr.ph8.preheader28, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %scevgep = getelementptr i8, ptr %7, i64 8
  %scevgep13 = getelementptr i8, ptr %5, i64 4
  %32 = shl nsw i64 %9, 3
  %33 = add nsw i64 %32, -8
  %scevgep14 = getelementptr i8, ptr %16, i64 %33
  %34 = shl nsw i64 %11, 3
  %35 = add nsw i64 %34, 8
  %.not = icmp eq i64 %18, 0
  %36 = select i1 %.not, i64 %35, i64 %34
  %scevgep16 = getelementptr i8, ptr %16, i64 %36
  %bound0 = icmp ult ptr %7, %scevgep13
  %bound1 = icmp ult ptr %5, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound017 = icmp ult ptr %7, %scevgep16
  %bound118 = icmp ult ptr %scevgep14, %scevgep
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx = or i1 %found.conflict, %found.conflict19
  %bound020 = icmp ult ptr %5, %scevgep16
  %bound121 = icmp ult ptr %scevgep14, %scevgep13
  %found.conflict22 = and i1 %bound020, %bound121
  %conflict.rdx23 = or i1 %conflict.rdx, %found.conflict22
  br i1 %conflict.rdx23, label %.lr.ph8.preheader28, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %22, -2
  %ind.end = sub nsw i64 %18, %n.vec
  %.cast = trunc i64 %n.vec to i32
  %ind.end25 = add i32 %8, %.cast
  %37 = load i32, ptr %5, align 4, !tbaa !4, !alias.scope !22, !noalias !25
  %broadcast.splatinsert = insertelement <2 x i32> poison, i32 %37, i64 0
  %38 = sitofp <2 x i32> %broadcast.splatinsert to <2 x float>
  %39 = fdiv contract <2 x float> <float 1.000000e+00, float poison>, %38
  %40 = shufflevector <2 x float> %39, <2 x float> poison, <2 x i32> zeroinitializer
  %41 = fpext <2 x float> %40 to <2 x double>
  %42 = extractelement <2 x double> %41, i64 1
  store double %42, ptr %7, align 8, !tbaa !4, !alias.scope !27, !noalias !29
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %.cast27 = trunc i64 %index to i32
  %offset.idx = add i32 %8, %.cast27
  %43 = sext i32 %offset.idx to i64
  %44 = add nsw i64 %43, -1
  %45 = getelementptr double, ptr %16, i64 %44
  store <2 x double> %41, ptr %45, align 8, !tbaa !4, !alias.scope !25
  %index.next = add nuw i64 %index, 2
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !30

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %22, %n.vec
  br i1 %cmp.n, label %.loopexit, label %.lr.ph8.preheader28

.lr.ph8.preheader28:                              ; preds = %vector.memcheck, %vector.scevcheck, %.lr.ph8.preheader, %middle.block
  %.ph = phi i64 [ %18, %vector.memcheck ], [ %18, %vector.scevcheck ], [ %18, %.lr.ph8.preheader ], [ %ind.end, %middle.block ]
  %.ph29 = phi i32 [ %8, %vector.memcheck ], [ %8, %vector.scevcheck ], [ %8, %.lr.ph8.preheader ], [ %ind.end25, %middle.block ]
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8.preheader28, %.lr.ph8
  %47 = phi i64 [ %57, %.lr.ph8 ], [ %.ph, %.lr.ph8.preheader28 ]
  %48 = phi i32 [ %56, %.lr.ph8 ], [ %.ph29, %.lr.ph8.preheader28 ]
  %49 = load i32, ptr %5, align 4, !tbaa !4
  %50 = sitofp i32 %49 to float
  %51 = fdiv contract float 1.000000e+00, %50
  %52 = fpext float %51 to double
  %53 = sext i32 %48 to i64
  %54 = add nsw i64 %53, -1
  %55 = getelementptr double, ptr %16, i64 %54
  store double %52, ptr %55, align 8, !tbaa !4
  store double %52, ptr %7, align 8, !tbaa !4
  %56 = add i32 %48, 1
  %57 = add nsw i64 %47, -1
  %58 = icmp ugt i64 %47, 1
  br i1 %58, label %.lr.ph8, label %.loopexit, !llvm.loop !31

59:                                               ; preds = %4
  %reass.sub = sub nsw i64 %11, %9
  %60 = icmp sgt i64 %reass.sub, -1
  br i1 %60, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %59
  %61 = add nuw nsw i64 %reass.sub, 1
  %62 = load ptr, ptr %2, align 8, !tbaa !8
  br label %63

63:                                               ; preds = %.lr.ph, %63
  %64 = phi i64 [ %61, %.lr.ph ], [ %75, %63 ]
  %65 = phi i32 [ %8, %.lr.ph ], [ %74, %63 ]
  %66 = load i32, ptr %5, align 4, !tbaa !4
  %67 = sitofp i32 %66 to float
  %68 = fdiv contract float 1.000000e+00, %67
  %69 = fpext float %68 to double
  %70 = sext i32 %65 to i64
  %71 = add nsw i64 %70, -1
  %72 = mul i64 %71, %13
  %73 = getelementptr i8, ptr %62, i64 %72
  store double %69, ptr %73, align 8, !tbaa !4
  store double %69, ptr %7, align 8, !tbaa !4
  %74 = add i32 %65, 1
  %75 = add nsw i64 %64, -1
  %76 = icmp ugt i64 %64, 1
  br i1 %76, label %63, label %.loopexit

.loopexit:                                        ; preds = %63, %.lr.ph8, %middle.block, %59, %15
  ret void
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputReal64(ptr, double) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

; Function Attrs: nounwind
declare i32 @omp_get_thread_num() local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @omp_get_num_threads() local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) local_unnamed_addr #2

; Function Attrs: nounwind
declare !callback !32 void @__kmpc_fork_call(ptr, i32, ptr, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #6

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { nounwind }
attributes #3 = { norecurse nounwind }
attributes #4 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 7, !"openmp", i32 11}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{!5, !5, i64 0}
!5 = !{!"any data access", !6, i64 0}
!6 = !{!"any access", !7, i64 0}
!7 = !{!"Flang Type TBAA Root"}
!8 = !{!9, !9, i64 0}
!9 = !{!"descriptor member", !6, i64 0}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = !{!16}
!16 = distinct !{!16, !12}
!17 = !{!11, !14}
!18 = distinct !{!18, !19, !20}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !19}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = !{!28}
!28 = distinct !{!28, !24}
!29 = !{!23, !26}
!30 = distinct !{!30, !19, !20}
!31 = distinct !{!31, !19}
!32 = !{!33}
!33 = !{i64 2, i64 -1, i64 -1, i1 true}

; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QQcl.28612C69372C612C6531332E36653229 = internal constant [16 x i8] c"(a,i7,a,e13.6e2)"
@_QQcl.21557d42704c5c1f18a68415065290ee = internal constant [50 x i8] c"/g/g92/rydahl1/flangtests/src/parallel_region.f90\00"
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
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  store i32 1048576, ptr %5, align 4, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %structArg.i)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %2)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %3)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4)
  %.fca.1.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 1
  %.fca.2.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 2
  %.fca.3.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 3
  %.fca.4.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 4
  %.fca.5.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 5
  %.fca.6.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 6
  %.fca.7.0.0.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep.i = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 2
  %6 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %6, ptr %3, align 8, !tbaa !8
  store i64 8, ptr %.fca.1.gep.i, align 8, !tbaa !8
  store i32 20180515, ptr %.fca.2.gep.i, align 8, !tbaa !8
  store i8 1, ptr %.fca.3.gep.i, align 4, !tbaa !8
  store i8 28, ptr %.fca.4.gep.i, align 1, !tbaa !8
  store i8 2, ptr %.fca.5.gep.i, align 2, !tbaa !8
  store i8 0, ptr %.fca.6.gep.i, align 1, !tbaa !8
  store i64 1, ptr %.fca.7.0.0.gep.i, align 8, !tbaa !8
  store i64 1048576, ptr %.fca.7.0.1.gep.i, align 8, !tbaa !8
  store i64 8, ptr %.fca.7.0.2.gep.i, align 8, !tbaa !8
  %omp_global_thread_num.i = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  store ptr %5, ptr %structArg.i, align 8
  %gep_8.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 1
  store ptr %3, ptr %gep_8.i, align 8
  %gep_9.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 2
  store ptr %2, ptr %gep_9.i, align 8
  %gep_10.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 3
  store ptr %1, ptr %gep_10.i, align 8
  %gep_11.i = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg.i, i64 0, i32 4
  store ptr %4, ptr %gep_11.i, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QFPomp_subroutine..omp_par, ptr nonnull %structArg.i)
  %.fca.0.load.i = load ptr, ptr %3, align 8, !tbaa !8
  %.fca.7.0.0.load.i = load i64, ptr %.fca.7.0.0.gep.i, align 8, !tbaa !8
  %7 = sub i64 1, %.fca.7.0.0.load.i
  %8 = getelementptr double, ptr %.fca.0.load.i, i64 %7
  %9 = load double, ptr %8, align 8, !tbaa !4
  %10 = load i32, ptr %5, align 4, !tbaa !4
  %11 = sext i32 %10 to i64
  %12 = sub i64 %11, %.fca.7.0.0.load.i
  %13 = getelementptr double, ptr %.fca.0.load.i, i64 %12
  %14 = load double, ptr %13, align 8, !tbaa !4
  %15 = fadd contract double %9, %14
  call void @free(ptr %.fca.0.load.i)
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %structArg.i)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %2)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %3)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4)
  %16 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6531332E36653229, i64 16, ptr null, i32 -1, ptr nonnull @_QQcl.21557d42704c5c1f18a68415065290ee, i32 10)
  %17 = call i1 @_FortranAioOutputAscii(ptr %16, ptr nonnull @_QQcl.54686520726573756C74206F6620286172722831292B61727228, i64 26)
  %18 = load i32, ptr %5, align 4, !tbaa !4
  %19 = call i1 @_FortranAioOutputInteger32(ptr %16, i32 %18)
  %20 = call i1 @_FortranAioOutputAscii(ptr %16, ptr nonnull @_QQcl.2920697320, i64 5)
  %21 = call i1 @_FortranAioOutputReal64(ptr %16, double %15)
  %22 = call i32 @_FortranAioEndIoStatement(ptr %16)
  ret void
}

; Function Attrs: nounwind
define void @_QFPomp_subroutine(ptr %0, ptr nocapture writeonly %1) local_unnamed_addr #2 {
entry:
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 1
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 2
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 3
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 4
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 5
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 6
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 2
  %5 = alloca double, align 8
  %6 = load i32, ptr %0, align 4, !tbaa !4
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = zext i32 %7 to i64
  %9 = shl nuw nsw i64 %8, 3
  %10 = tail call ptr @malloc(i64 %9)
  store ptr %10, ptr %4, align 8, !tbaa !8
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
  %gep_8 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 1
  store ptr %4, ptr %gep_8, align 8
  %gep_9 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 2
  store ptr %3, ptr %gep_9, align 8
  %gep_10 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 3
  store ptr %2, ptr %gep_10, align 8
  %gep_11 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 4
  store ptr %5, ptr %gep_11, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QFPomp_subroutine..omp_par, ptr nonnull %structArg)
  %.fca.0.load = load ptr, ptr %4, align 8, !tbaa !8
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
  %.0 = select i1 %8, i32 %3, i32 %9
  %10 = sext i32 %6 to i64
  %11 = sext i32 %.0 to i64
  %reass.sub = sub nsw i64 %11, %10
  %12 = icmp sgt i64 %reass.sub, -1
  br i1 %12, label %omp.par.region6.lr.ph, label %omp.par.region7

omp.par.region6.lr.ph:                            ; preds = %omp.par.entry
  %13 = add nuw nsw i64 %reass.sub, 1
  %.elt21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 1
  %.elt23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 2
  %.elt25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 3
  %.elt27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 4
  %.elt29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 5
  %.elt31 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 6
  %.elt33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7
  %.unpack34.unpack.elt36 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 1
  %.unpack34.unpack.elt38 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_2, i64 0, i32 7, i64 0, i64 2
  %loadgep_4.repack41 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 1
  %loadgep_4.repack43 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 2
  %loadgep_4.repack45 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 3
  %loadgep_4.repack47 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 4
  %loadgep_4.repack49 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 5
  %loadgep_4.repack51 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 6
  %loadgep_4.repack53 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7
  %loadgep_4.repack53.repack55 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 1
  %loadgep_4.repack53.repack57 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 2
  %loadgep_6.repack80 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 1
  %loadgep_6.repack82 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 2
  %loadgep_6.repack84 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 3
  %loadgep_6.repack86 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 4
  %loadgep_6.repack88 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 5
  %loadgep_6.repack90 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 6
  %loadgep_6.repack92 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7
  %loadgep_6.repack92.repack94 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 1
  %loadgep_6.repack92.repack96 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 2
  br label %omp.par.region6

omp.par.region7:                                  ; preds = %omp.par.region6, %omp.par.entry
  ret void

omp.par.region6:                                  ; preds = %omp.par.region6.lr.ph, %omp.par.region6
  %14 = phi i64 [ %13, %omp.par.region6.lr.ph ], [ %27, %omp.par.region6 ]
  %15 = phi i32 [ %6, %omp.par.region6.lr.ph ], [ %26, %omp.par.region6 ]
  %16 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %17 = sitofp i32 %16 to float
  %18 = fdiv contract float 1.000000e+00, %17
  %19 = fpext float %18 to double
  %.unpack = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %.unpack22 = load i64, ptr %.elt21, align 8, !tbaa !8
  %.unpack24 = load i32, ptr %.elt23, align 8, !tbaa !8
  %.unpack26 = load i8, ptr %.elt25, align 4, !tbaa !8
  %.unpack28 = load i8, ptr %.elt27, align 1, !tbaa !8
  %.unpack30 = load i8, ptr %.elt29, align 2, !tbaa !8
  %.unpack32 = load i8, ptr %.elt31, align 1, !tbaa !8
  %.unpack34.unpack.unpack = load i64, ptr %.elt33, align 8, !tbaa !8
  %.unpack34.unpack.unpack37 = load i64, ptr %.unpack34.unpack.elt36, align 8, !tbaa !8
  %.unpack34.unpack.unpack39 = load i64, ptr %.unpack34.unpack.elt38, align 8, !tbaa !8
  store ptr %.unpack, ptr %loadgep_4, align 8, !tbaa !8
  store i64 %.unpack22, ptr %loadgep_4.repack41, align 8, !tbaa !8
  store i32 %.unpack24, ptr %loadgep_4.repack43, align 8, !tbaa !8
  store i8 %.unpack26, ptr %loadgep_4.repack45, align 4, !tbaa !8
  store i8 %.unpack28, ptr %loadgep_4.repack47, align 1, !tbaa !8
  store i8 %.unpack30, ptr %loadgep_4.repack49, align 2, !tbaa !8
  store i8 %.unpack32, ptr %loadgep_4.repack51, align 1, !tbaa !8
  store i64 %.unpack34.unpack.unpack, ptr %loadgep_4.repack53, align 8, !tbaa !8
  store i64 %.unpack34.unpack.unpack37, ptr %loadgep_4.repack53.repack55, align 8, !tbaa !8
  store i64 %.unpack34.unpack.unpack39, ptr %loadgep_4.repack53.repack57, align 8, !tbaa !8
  %20 = sext i32 %15 to i64
  %21 = sub i64 %20, %.unpack34.unpack.unpack
  %22 = getelementptr double, ptr %.unpack, i64 %21
  store double %19, ptr %22, align 8, !tbaa !4
  %.unpack59 = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %.unpack61 = load i64, ptr %.elt21, align 8, !tbaa !8
  %.unpack63 = load i32, ptr %.elt23, align 8, !tbaa !8
  %.unpack65 = load i8, ptr %.elt25, align 4, !tbaa !8
  %.unpack67 = load i8, ptr %.elt27, align 1, !tbaa !8
  %.unpack69 = load i8, ptr %.elt29, align 2, !tbaa !8
  %.unpack71 = load i8, ptr %.elt31, align 1, !tbaa !8
  %.unpack73.unpack.unpack = load i64, ptr %.elt33, align 8, !tbaa !8
  %.unpack73.unpack.unpack76 = load i64, ptr %.unpack34.unpack.elt36, align 8, !tbaa !8
  %.unpack73.unpack.unpack78 = load i64, ptr %.unpack34.unpack.elt38, align 8, !tbaa !8
  store ptr %.unpack59, ptr %loadgep_6, align 8, !tbaa !8
  store i64 %.unpack61, ptr %loadgep_6.repack80, align 8, !tbaa !8
  store i32 %.unpack63, ptr %loadgep_6.repack82, align 8, !tbaa !8
  store i8 %.unpack65, ptr %loadgep_6.repack84, align 4, !tbaa !8
  store i8 %.unpack67, ptr %loadgep_6.repack86, align 1, !tbaa !8
  store i8 %.unpack69, ptr %loadgep_6.repack88, align 2, !tbaa !8
  store i8 %.unpack71, ptr %loadgep_6.repack90, align 1, !tbaa !8
  store i64 %.unpack73.unpack.unpack, ptr %loadgep_6.repack92, align 8, !tbaa !8
  store i64 %.unpack73.unpack.unpack76, ptr %loadgep_6.repack92.repack94, align 8, !tbaa !8
  store i64 %.unpack73.unpack.unpack78, ptr %loadgep_6.repack92.repack96, align 8, !tbaa !8
  %23 = sub i64 %20, %.unpack73.unpack.unpack
  %24 = getelementptr double, ptr %.unpack59, i64 %23
  %25 = load double, ptr %24, align 8, !tbaa !4
  store double %25, ptr %loadgep_8, align 8, !tbaa !4
  %26 = add i32 %15, 1
  %27 = add nsw i64 %14, -1
  %28 = icmp ugt i64 %14, 1
  br i1 %28, label %omp.par.region6, label %omp.par.region7
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
declare !callback !10 void @__kmpc_fork_call(ptr, i32, ptr, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { nounwind }
attributes #3 = { norecurse nounwind }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

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
!11 = !{i64 2, i64 -1, i64 -1, i1 true}

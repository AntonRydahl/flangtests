; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QFEarr.0 = internal unnamed_addr global ptr null
@_QFEarr.8 = internal unnamed_addr global i1 false
@_QQcl.1c24fad2427fba85941c2f07b505b42a = internal constant [49 x i8] c"/g/g92/rydahl1/flangtests/src/loop_reduction.f90\00"
@_QQcl.28612C69372C612C6531332E36653229 = internal constant [16 x i8] c"(a,i7,a,e13.6e2)"
@_QQcl.54686520726573756C74206F662073756D2861727228313A = internal constant [24 x i8] c"The result of sum(arr(1:"
@_QQcl.292920697320 = internal constant [6 x i8] c")) is "
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 4

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
entry:
  %structArg = alloca { ptr, ptr, ptr, ptr }, align 8
  %0 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  store i32 1048576, ptr %2, align 4, !tbaa !4
  %4 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %4, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 true, ptr @_QFEarr.8, align 1
  store double 0.000000e+00, ptr %3, align 8, !tbaa !4
  %omp_global_thread_num = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  store ptr %2, ptr %structArg, align 8
  %gep_7 = getelementptr inbounds { ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 1
  store ptr %3, ptr %gep_7, align 8
  %gep_8 = getelementptr inbounds { ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 2
  store ptr %1, ptr %gep_8, align 8
  %gep_9 = getelementptr inbounds { ptr, ptr, ptr, ptr }, ptr %structArg, i64 0, i32 3
  store ptr %0, ptr %gep_9, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 1, ptr nonnull @_QQmain..omp_par, ptr nonnull %structArg)
  %5 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6531332E36653229, i64 16, ptr null, i32 -1, ptr nonnull @_QQcl.1c24fad2427fba85941c2f07b505b42a, i32 21)
  %6 = call i1 @_FortranAioOutputAscii(ptr %5, ptr nonnull @_QQcl.54686520726573756C74206F662073756D2861727228313A, i64 24)
  %7 = load i32, ptr %2, align 4, !tbaa !4
  %8 = call i1 @_FortranAioOutputInteger32(ptr %5, i32 %7)
  %9 = call i1 @_FortranAioOutputAscii(ptr %5, ptr nonnull @_QQcl.292920697320, i64 6)
  %10 = load double, ptr %3, align 8, !tbaa !4
  %11 = call i1 @_FortranAioOutputReal64(ptr %5, double %10)
  %12 = call i32 @_FortranAioEndIoStatement(ptr %5)
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  call void @free(ptr %.unpack)
  store ptr null, ptr @_QFEarr.0, align 8, !tbaa !8
  store i1 false, ptr @_QFEarr.8, align 1
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @_QQmain..omp_par(ptr noalias nocapture readnone %tid.addr, ptr noalias nocapture readnone %zero.addr, ptr nocapture readonly %0) #2 {
omp.par.entry:
  %loadgep_ = load ptr, ptr %0, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %gep_5 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i64 0, i32 3
  %loadgep_6 = load ptr, ptr %gep_5, align 8
  %1 = alloca double, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %red.array = alloca [1 x ptr], align 8
  %2 = load i32, ptr %loadgep_, align 4, !tbaa !4
  store double 0.000000e+00, ptr %1, align 8
  %omp_loop.tripcount = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  store i32 0, ptr %p.lowerbound, align 4
  %3 = add nsw i32 %omp_loop.tripcount, -1
  store i32 %3, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num6 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1)
  call void @__kmpc_for_static_init_4u(ptr nonnull @1, i32 %omp_global_thread_num6, i32 34, ptr nonnull %p.lastiter, ptr nonnull %p.lowerbound, ptr nonnull %p.upperbound, ptr nonnull %p.stride, i32 1, i32 0)
  %4 = load i32, ptr %p.lowerbound, align 4
  %5 = load i32, ptr %p.upperbound, align 4
  %reass.sub = sub i32 %5, %4
  %omp_loop.cmp67.not = icmp eq i32 %reass.sub, -1
  br i1 %omp_loop.cmp67.not, label %omp_loop.exit, label %omp_loop.body.lr.ph

omp_loop.body.lr.ph:                              ; preds = %omp.par.entry
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !8
  %.unpack14.unpack.unpack16.b = load i1, ptr @_QFEarr.8, align 1
  %.unpack14.unpack.unpack16 = select i1 %.unpack14.unpack.unpack16.b, i64 1048576, i64 0
  %loadgep_4.repack19 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 1
  %loadgep_4.repack21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 2
  %loadgep_4.repack23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 3
  %loadgep_4.repack25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 4
  %loadgep_4.repack27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 5
  %loadgep_4.repack29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 6
  %loadgep_4.repack31 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7
  %loadgep_4.repack31.repack33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 1
  %loadgep_4.repack31.repack35 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_4, i64 0, i32 7, i64 0, i64 2
  %loadgep_6.repack49 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 1
  %loadgep_6.repack51 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 2
  %loadgep_6.repack53 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 3
  %loadgep_6.repack55 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 4
  %loadgep_6.repack57 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 5
  %loadgep_6.repack59 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 6
  %loadgep_6.repack61 = getelementptr { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7
  %loadgep_6.repack61.repack63 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 1
  %loadgep_6.repack61.repack65 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %loadgep_6, i64 0, i32 7, i64 0, i64 2
  br label %omp_loop.body

omp_loop.exit:                                    ; preds = %omp_loop.body, %omp.par.entry
  call void @__kmpc_for_static_fini(ptr nonnull @1, i32 %omp_global_thread_num6)
  call void @__kmpc_barrier(ptr nonnull @2, i32 %omp_global_thread_num6)
  store ptr %1, ptr %red.array, align 8
  %reduce = call i32 @__kmpc_reduce(ptr nonnull @1, i32 %omp_global_thread_num6, i32 1, i64 8, ptr nonnull %red.array, ptr nonnull @.omp.reduction.func, ptr nonnull @.gomp_critical_user_.reduction.var)
  %cond = icmp eq i32 %reduce, 1
  br i1 %cond, label %reduce.switch.nonatomic, label %reduce.finalize

reduce.switch.nonatomic:                          ; preds = %omp_loop.exit
  %red.value.0 = load double, ptr %loadgep_2, align 8
  %red.private.value.0 = load double, ptr %1, align 8
  %6 = fadd contract double %red.value.0, %red.private.value.0
  store double %6, ptr %loadgep_2, align 8
  call void @__kmpc_end_reduce(ptr nonnull @1, i32 %omp_global_thread_num6, ptr nonnull @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %omp_loop.exit, %reduce.switch.nonatomic
  call void @__kmpc_barrier(ptr nonnull @2, i32 %omp_global_thread_num6)
  ret void

omp_loop.body:                                    ; preds = %omp_loop.body.lr.ph, %omp_loop.body
  %omp_loop.iv68 = phi i32 [ 0, %omp_loop.body.lr.ph ], [ %7, %omp_loop.body ]
  %7 = add nuw i32 %omp_loop.iv68, 1
  %8 = add i32 %7, %4
  %9 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %10 = sitofp i32 %9 to float
  %11 = fdiv contract float 1.000000e+00, %10
  %12 = fpext float %11 to double
  store ptr %.unpack, ptr %loadgep_4, align 8, !tbaa !8
  store i64 8, ptr %loadgep_4.repack19, align 8, !tbaa !8
  store i32 20180515, ptr %loadgep_4.repack21, align 8, !tbaa !8
  store i8 1, ptr %loadgep_4.repack23, align 4, !tbaa !8
  store i8 28, ptr %loadgep_4.repack25, align 1, !tbaa !8
  store i8 2, ptr %loadgep_4.repack27, align 2, !tbaa !8
  store i8 0, ptr %loadgep_4.repack29, align 1, !tbaa !8
  store i64 1, ptr %loadgep_4.repack31, align 8, !tbaa !8
  store i64 %.unpack14.unpack.unpack16, ptr %loadgep_4.repack31.repack33, align 8, !tbaa !8
  store i64 8, ptr %loadgep_4.repack31.repack35, align 8, !tbaa !8
  %13 = sext i32 %8 to i64
  %14 = add nsw i64 %13, -1
  %15 = getelementptr double, ptr %.unpack, i64 %14
  store double %12, ptr %15, align 8, !tbaa !4
  store ptr %.unpack, ptr %loadgep_6, align 8, !tbaa !8
  store i64 8, ptr %loadgep_6.repack49, align 8, !tbaa !8
  store i32 20180515, ptr %loadgep_6.repack51, align 8, !tbaa !8
  store i8 1, ptr %loadgep_6.repack53, align 4, !tbaa !8
  store i8 28, ptr %loadgep_6.repack55, align 1, !tbaa !8
  store i8 2, ptr %loadgep_6.repack57, align 2, !tbaa !8
  store i8 0, ptr %loadgep_6.repack59, align 1, !tbaa !8
  store i64 1, ptr %loadgep_6.repack61, align 8, !tbaa !8
  store i64 %.unpack14.unpack.unpack16, ptr %loadgep_6.repack61.repack63, align 8, !tbaa !8
  store i64 8, ptr %loadgep_6.repack61.repack65, align 8, !tbaa !8
  %16 = load double, ptr %1, align 8
  %17 = fadd contract double %16, %12
  store double %17, ptr %1, align 8
  %exitcond.not = icmp eq i32 %omp_loop.iv68, %reass.sub
  br i1 %exitcond.not, label %omp_loop.exit, label %omp_loop.body
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputReal64(ptr, double) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define internal void @.omp.reduction.func(ptr nocapture readonly %0, ptr nocapture readonly %1) #5 {
  %3 = load ptr, ptr %0, align 8
  %4 = load double, ptr %3, align 8
  %5 = load ptr, ptr %1, align 8
  %6 = load double, ptr %5, align 8
  %7 = fadd contract double %4, %6
  store double %7, ptr %3, align 8
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) local_unnamed_addr #4

; Function Attrs: nounwind
declare !callback !10 void @__kmpc_fork_call(ptr, i32, ptr, ...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #6

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { norecurse nounwind }
attributes #3 = { nounwind }
attributes #4 = { convergent nounwind }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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

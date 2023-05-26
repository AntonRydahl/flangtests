; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QMrhofuncECdp = local_unnamed_addr constant i32 8
@_QFEphi = internal unnamed_addr global [300 x [300 x double]] undef
@_QFEphiprime = internal unnamed_addr global [300 x [300 x double]] undef
@_QFErhoarr = internal unnamed_addr global [300 x [300 x double]] undef
@_QQcl.2E2F2E2F72686F2F746573742E66393000 = linkonce constant [17 x i8] c"././rho/test.f90\00"
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define double @_QMrhofuncPrho(ptr nocapture readonly %0, ptr nocapture readonly %1) local_unnamed_addr #2 {
  %3 = load double, ptr %0, align 8, !tbaa !3
  %4 = fcmp ogt double %3, 6.000000e-01
  %5 = fcmp olt double %3, 8.000000e-01
  %6 = and i1 %4, %5
  %7 = load double, ptr %1, align 8, !tbaa !3
  %8 = fcmp ogt double %7, 6.000000e-01
  %9 = and i1 %6, %8
  %10 = fcmp olt double %7, 8.000000e-01
  %11 = and i1 %10, %9
  br i1 %11, label %20, label %12

12:                                               ; preds = %2
  %13 = fcmp ogt double %3, 2.000000e-01
  %14 = fcmp olt double %3, 4.000000e-01
  %15 = and i1 %13, %14
  %16 = fcmp ogt double %7, 2.000000e-01
  %17 = and i1 %15, %16
  %18 = fcmp olt double %7, 4.000000e-01
  %19 = and i1 %18, %17
  %. = select i1 %19, double -1.000000e+00, double 0.000000e+00
  br label %20

20:                                               ; preds = %12, %2
  %.0 = phi double [ 1.000000e+00, %2 ], [ %., %12 ]
  ret double %.0
}

define void @_QQmain() local_unnamed_addr {
.preheader30.preheader:
  %0 = tail call contract double @_FortranACpuTime()
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(720000) @_QFEphiprime, i8 0, i64 720000, i1 false), !tbaa !3
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(720000) @_QFEphi, i8 0, i64 720000, i1 false), !tbaa !3
  br label %.preheader28

.preheader28:                                     ; preds = %.preheader30.preheader, %.split.us
  %indvars.iv41 = phi i64 [ 1, %.preheader30.preheader ], [ %indvars.iv.next42, %.split.us ]
  %1 = trunc i64 %indvars.iv41 to i32
  %2 = sitofp i32 %1 to double
  %3 = fmul contract double %2, 1.000000e-02
  %4 = fcmp ogt double %3, 6.000000e-01
  %5 = fcmp olt double %3, 8.000000e-01
  %6 = and i1 %4, %5
  %7 = add nsw i64 %indvars.iv41, -1
  %8 = fcmp ogt double %3, 2.000000e-01
  %9 = fcmp olt double %3, 4.000000e-01
  %10 = and i1 %8, %9
  %.fr = freeze i1 %6
  br i1 %.fr, label %.preheader28.split, label %_QMrhofuncPrho.exit.us

_QMrhofuncPrho.exit.us:                           ; preds = %.preheader28, %_QMrhofuncPrho.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_QMrhofuncPrho.exit.us ], [ 1, %.preheader28 ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul contract double %12, 1.000000e-02
  %14 = fcmp ogt double %13, 2.000000e-01
  %15 = fcmp olt double %13, 4.000000e-01
  %16 = and i1 %14, %15
  %17 = and i1 %16, %10
  %..i.us = select i1 %17, double -1.000000e+00, double 0.000000e+00
  %18 = add nsw i64 %indvars.iv, -1
  %19 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i64 0, i64 %18, i64 %7
  store double %..i.us, ptr %19, align 8, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 301
  br i1 %exitcond.not, label %.split.us, label %_QMrhofuncPrho.exit.us

.preheader28.split:                               ; preds = %.preheader28, %_QMrhofuncPrho.exit
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %_QMrhofuncPrho.exit ], [ 1, %.preheader28 ]
  %20 = trunc i64 %indvars.iv37 to i32
  %21 = sitofp i32 %20 to double
  %22 = fmul contract double %21, 1.000000e-02
  %23 = fcmp ogt double %22, 6.000000e-01
  %24 = fcmp olt double %22, 8.000000e-01
  %25 = and i1 %24, %23
  br i1 %25, label %_QMrhofuncPrho.exit, label %26

26:                                               ; preds = %.preheader28.split
  %27 = fcmp ogt double %22, 2.000000e-01
  %28 = fcmp olt double %22, 4.000000e-01
  %29 = and i1 %27, %28
  %30 = and i1 %29, %10
  %..i = select i1 %30, double -1.000000e+00, double 0.000000e+00
  br label %_QMrhofuncPrho.exit

_QMrhofuncPrho.exit:                              ; preds = %.preheader28.split, %26
  %.0.i = phi double [ 1.000000e+00, %.preheader28.split ], [ %..i, %26 ]
  %31 = add nsw i64 %indvars.iv37, -1
  %32 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i64 0, i64 %31, i64 %7
  store double %.0.i, ptr %32, align 8, !tbaa !3
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40.not = icmp eq i64 %indvars.iv.next38, 301
  br i1 %exitcond40.not, label %.split.us, label %.preheader28.split

.split.us:                                        ; preds = %_QMrhofuncPrho.exit.us, %_QMrhofuncPrho.exit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44.not = icmp eq i64 %indvars.iv.next42, 301
  br i1 %exitcond44.not, label %.preheader27, label %.preheader28

.preheader27:                                     ; preds = %.split.us, %_FortranAMaxvalReal8x2_contract_simplified.exit
  %.033 = phi i32 [ %110, %_FortranAMaxvalReal8x2_contract_simplified.exit ], [ 0, %.split.us ]
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader27, %55
  %indvars.iv49 = phi i64 [ 2, %.preheader27 ], [ %indvars.iv.next50, %55 ]
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %33 = add nsw i64 %indvars.iv49, -1
  %34 = add nsw i64 %indvars.iv49, -2
  br label %35

35:                                               ; preds = %.preheader26, %35
  %indvars.iv45 = phi i64 [ 2, %.preheader26 ], [ %indvars.iv.next46, %35 ]
  %36 = add nsw i64 %indvars.iv45, -1
  %37 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %36, i64 %indvars.iv49
  %38 = load double, ptr %37, align 8, !tbaa !3
  %39 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %36, i64 %34
  %40 = load double, ptr %39, align 8, !tbaa !3
  %41 = fadd contract double %38, %40
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %42 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %indvars.iv45, i64 %33
  %43 = load double, ptr %42, align 8, !tbaa !3
  %44 = fadd contract double %41, %43
  %45 = add nsw i64 %indvars.iv45, -2
  %46 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %45, i64 %33
  %47 = load double, ptr %46, align 8, !tbaa !3
  %48 = fadd contract double %44, %47
  %49 = fmul contract double %48, 2.500000e-01
  %50 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i64 0, i64 %36, i64 %33
  %51 = load double, ptr %50, align 8, !tbaa !3
  %52 = fmul contract double %51, 0x41458D4D60E76995
  %53 = fadd contract double %49, %52
  %54 = getelementptr [300 x [300 x double]], ptr @_QFEphiprime, i64 0, i64 %36, i64 %33
  store double %53, ptr %54, align 8, !tbaa !3
  %exitcond48.not = icmp eq i64 %indvars.iv.next46, 300
  br i1 %exitcond48.not, label %55, label %35

55:                                               ; preds = %35
  %exitcond52.not = icmp eq i64 %indvars.iv.next50, 300
  br i1 %exitcond52.not, label %56, label %.preheader26

56:                                               ; preds = %55
  %57 = tail call dereferenceable_or_null(720000) ptr @malloc(i64 720000)
  br label %.preheader25

.preheader25:                                     ; preds = %56, %middle.block
  %58 = phi i64 [ 0, %56 ], [ %72, %middle.block ]
  %59 = mul nuw nsw i64 %58, 300
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader25
  %index = phi i64 [ 0, %.preheader25 ], [ %index.next, %vector.body ]
  %60 = add nuw nsw i64 %index, %59
  %61 = getelementptr double, ptr @_QFEphiprime, i64 %60
  %wide.load = load <2 x double>, ptr %61, align 16, !tbaa !3
  %62 = getelementptr double, ptr %61, i64 2
  %wide.load60 = load <2 x double>, ptr %62, align 16, !tbaa !3
  %63 = getelementptr double, ptr @_QFEphi, i64 %60
  %wide.load61 = load <2 x double>, ptr %63, align 16, !tbaa !3
  %64 = getelementptr double, ptr %63, i64 2
  %wide.load62 = load <2 x double>, ptr %64, align 16, !tbaa !3
  %65 = fsub contract <2 x double> %wide.load, %wide.load61
  %66 = fsub contract <2 x double> %wide.load60, %wide.load62
  %67 = tail call contract <2 x double> @llvm.fabs.v2f64(<2 x double> %65)
  %68 = tail call contract <2 x double> @llvm.fabs.v2f64(<2 x double> %66)
  %69 = getelementptr double, ptr %57, i64 %60
  store <2 x double> %67, ptr %69, align 8, !tbaa !3
  %70 = getelementptr double, ptr %69, i64 2
  store <2 x double> %68, ptr %70, align 8, !tbaa !3
  %index.next = add nuw i64 %index, 4
  %71 = icmp eq i64 %index.next, 300
  br i1 %71, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %72 = add nuw nsw i64 %58, 1
  %exitcond54.not = icmp eq i64 %72, 300
  br i1 %exitcond54.not, label %.preheader.us.i, label %.preheader25

.preheader.us.i:                                  ; preds = %middle.block, %._crit_edge.us.i
  %73 = phi double [ %107, %._crit_edge.us.i ], [ 0xFFEFFFFFFFFFFFFF, %middle.block ]
  %74 = phi i64 [ %109, %._crit_edge.us.i ], [ 0, %middle.block ]
  %75 = mul nuw nsw i64 %74, 2400
  br label %76

76:                                               ; preds = %76, %.preheader.us.i
  %77 = phi double [ %73, %.preheader.us.i ], [ %107, %76 ]
  %78 = phi i64 [ 0, %.preheader.us.i ], [ %108, %76 ]
  %79 = shl i64 %78, 3
  %80 = add nuw nsw i64 %79, %75
  %81 = getelementptr i8, ptr %57, i64 %80
  %82 = load double, ptr %81, align 8, !tbaa !3
  %83 = tail call contract double @llvm.maxnum.f64(double %82, double %77)
  %84 = shl i64 %78, 3
  %85 = add i64 %84, 8
  %86 = add nuw nsw i64 %85, %75
  %87 = getelementptr i8, ptr %57, i64 %86
  %88 = load double, ptr %87, align 8, !tbaa !3
  %89 = tail call contract double @llvm.maxnum.f64(double %88, double %83)
  %90 = shl i64 %78, 3
  %91 = add i64 %90, 16
  %92 = add nuw nsw i64 %91, %75
  %93 = getelementptr i8, ptr %57, i64 %92
  %94 = load double, ptr %93, align 8, !tbaa !3
  %95 = tail call contract double @llvm.maxnum.f64(double %94, double %89)
  %96 = shl i64 %78, 3
  %97 = add i64 %96, 24
  %98 = add nuw nsw i64 %97, %75
  %99 = getelementptr i8, ptr %57, i64 %98
  %100 = load double, ptr %99, align 8, !tbaa !3
  %101 = tail call contract double @llvm.maxnum.f64(double %100, double %95)
  %102 = shl i64 %78, 3
  %103 = add i64 %102, 32
  %104 = add nuw nsw i64 %103, %75
  %105 = getelementptr i8, ptr %57, i64 %104
  %106 = load double, ptr %105, align 8, !tbaa !3
  %107 = tail call contract double @llvm.maxnum.f64(double %106, double %101)
  %108 = add nuw nsw i64 %78, 5
  %exitcond.not.i.4 = icmp eq i64 %108, 300
  br i1 %exitcond.not.i.4, label %._crit_edge.us.i, label %76

._crit_edge.us.i:                                 ; preds = %76
  %109 = add nuw nsw i64 %74, 1
  %exitcond5.not.i = icmp eq i64 %109, 300
  br i1 %exitcond5.not.i, label %_FortranAMaxvalReal8x2_contract_simplified.exit, label %.preheader.us.i

_FortranAMaxvalReal8x2_contract_simplified.exit:  ; preds = %._crit_edge.us.i
  tail call void @free(ptr nonnull %57)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(720000) @_QFEphi, ptr noundef nonnull align 16 dereferenceable(720000) @_QFEphiprime, i64 720000, i1 false), !tbaa !3
  %110 = add i32 %.033, 1
  %111 = fcmp ogt double %107, 0x3EB0C6F7A0B5ED8D
  br i1 %111, label %.preheader27, label %112

112:                                              ; preds = %_FortranAMaxvalReal8x2_contract_simplified.exit
  %113 = tail call contract double @_FortranACpuTime()
  %114 = tail call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F72686F2F746573742E66393000, i32 56)
  %115 = fsub contract double %113, %0
  %116 = tail call i1 @_FortranAioOutputReal64(ptr %114, double %115)
  %117 = tail call i1 @_FortranAioOutputInteger32(ptr %114, i32 %110)
  %118 = tail call i32 @_FortranAioEndIoStatement(ptr %114)
  ret void
}

declare double @_FortranACpuTime() local_unnamed_addr

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputReal64(ptr, double) local_unnamed_addr

declare i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.maxnum.f64(double, double) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.fabs.v2f64(<2 x double>) #6

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"any data access", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang Type TBAA Root"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}

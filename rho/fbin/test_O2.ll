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

.preheader28:                                     ; preds = %.preheader30.preheader, %26
  %indvars.iv36 = phi i64 [ 1, %.preheader30.preheader ], [ %indvars.iv.next37, %26 ]
  %1 = trunc i64 %indvars.iv36 to i32
  %2 = sitofp i32 %1 to double
  %3 = fmul contract double %2, 1.000000e-02
  %4 = fcmp ogt double %3, 6.000000e-01
  %5 = fcmp olt double %3, 8.000000e-01
  %6 = and i1 %4, %5
  %7 = add nsw i64 %indvars.iv36, -1
  %8 = fcmp ogt double %3, 2.000000e-01
  %9 = fcmp olt double %3, 4.000000e-01
  %10 = and i1 %8, %9
  br label %11

11:                                               ; preds = %.preheader28, %_QMrhofuncPrho.exit
  %indvars.iv = phi i64 [ 1, %.preheader28 ], [ %indvars.iv.next, %_QMrhofuncPrho.exit ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul contract double %13, 1.000000e-02
  %15 = fcmp ogt double %14, 6.000000e-01
  %16 = and i1 %6, %15
  %17 = fcmp olt double %14, 8.000000e-01
  %18 = and i1 %17, %16
  br i1 %18, label %_QMrhofuncPrho.exit, label %19

19:                                               ; preds = %11
  %20 = fcmp ogt double %14, 2.000000e-01
  %21 = and i1 %10, %20
  %22 = fcmp olt double %14, 4.000000e-01
  %23 = and i1 %22, %21
  %..i = select i1 %23, double -1.000000e+00, double 0.000000e+00
  br label %_QMrhofuncPrho.exit

_QMrhofuncPrho.exit:                              ; preds = %11, %19
  %.0.i = phi double [ 1.000000e+00, %11 ], [ %..i, %19 ]
  %24 = add nsw i64 %indvars.iv, -1
  %25 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i64 0, i64 %24, i64 %7
  store double %.0.i, ptr %25, align 8, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 301
  br i1 %exitcond.not, label %26, label %11

26:                                               ; preds = %_QMrhofuncPrho.exit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39.not = icmp eq i64 %indvars.iv.next37, 301
  br i1 %exitcond39.not, label %.preheader27, label %.preheader28

.preheader27:                                     ; preds = %26, %_FortranAMaxvalReal8x2_contract_simplified.exit
  %.033 = phi i32 [ %104, %_FortranAMaxvalReal8x2_contract_simplified.exit ], [ 0, %26 ]
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader27, %49
  %indvars.iv44 = phi i64 [ 2, %.preheader27 ], [ %indvars.iv.next45, %49 ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %27 = add nsw i64 %indvars.iv44, -1
  %28 = add nsw i64 %indvars.iv44, -2
  br label %29

29:                                               ; preds = %.preheader26, %29
  %indvars.iv40 = phi i64 [ 2, %.preheader26 ], [ %indvars.iv.next41, %29 ]
  %30 = add nsw i64 %indvars.iv40, -1
  %31 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %30, i64 %indvars.iv44
  %32 = load double, ptr %31, align 8, !tbaa !3
  %33 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %30, i64 %28
  %34 = load double, ptr %33, align 8, !tbaa !3
  %35 = fadd contract double %32, %34
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %36 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %indvars.iv40, i64 %27
  %37 = load double, ptr %36, align 8, !tbaa !3
  %38 = fadd contract double %35, %37
  %39 = add nsw i64 %indvars.iv40, -2
  %40 = getelementptr [300 x [300 x double]], ptr @_QFEphi, i64 0, i64 %39, i64 %27
  %41 = load double, ptr %40, align 8, !tbaa !3
  %42 = fadd contract double %38, %41
  %43 = fmul contract double %42, 2.500000e-01
  %44 = getelementptr [300 x [300 x double]], ptr @_QFErhoarr, i64 0, i64 %30, i64 %27
  %45 = load double, ptr %44, align 8, !tbaa !3
  %46 = fmul contract double %45, 0x41458D4D60E76995
  %47 = fadd contract double %43, %46
  %48 = getelementptr [300 x [300 x double]], ptr @_QFEphiprime, i64 0, i64 %30, i64 %27
  store double %47, ptr %48, align 8, !tbaa !3
  %exitcond43.not = icmp eq i64 %indvars.iv.next41, 300
  br i1 %exitcond43.not, label %49, label %29

49:                                               ; preds = %29
  %exitcond47.not = icmp eq i64 %indvars.iv.next45, 300
  br i1 %exitcond47.not, label %50, label %.preheader26

50:                                               ; preds = %49
  %51 = tail call dereferenceable_or_null(720000) ptr @malloc(i64 720000)
  br label %.preheader25

.preheader25:                                     ; preds = %50, %middle.block
  %52 = phi i64 [ 0, %50 ], [ %66, %middle.block ]
  %53 = mul nuw nsw i64 %52, 300
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader25
  %index = phi i64 [ 0, %.preheader25 ], [ %index.next, %vector.body ]
  %54 = add nuw nsw i64 %index, %53
  %55 = getelementptr double, ptr @_QFEphiprime, i64 %54
  %wide.load = load <2 x double>, ptr %55, align 16, !tbaa !3
  %56 = getelementptr double, ptr %55, i64 2
  %wide.load53 = load <2 x double>, ptr %56, align 16, !tbaa !3
  %57 = getelementptr double, ptr @_QFEphi, i64 %54
  %wide.load54 = load <2 x double>, ptr %57, align 16, !tbaa !3
  %58 = getelementptr double, ptr %57, i64 2
  %wide.load55 = load <2 x double>, ptr %58, align 16, !tbaa !3
  %59 = fsub contract <2 x double> %wide.load, %wide.load54
  %60 = fsub contract <2 x double> %wide.load53, %wide.load55
  %61 = tail call contract <2 x double> @llvm.fabs.v2f64(<2 x double> %59)
  %62 = tail call contract <2 x double> @llvm.fabs.v2f64(<2 x double> %60)
  %63 = getelementptr double, ptr %51, i64 %54
  store <2 x double> %61, ptr %63, align 8, !tbaa !3
  %64 = getelementptr double, ptr %63, i64 2
  store <2 x double> %62, ptr %64, align 8, !tbaa !3
  %index.next = add nuw i64 %index, 4
  %65 = icmp eq i64 %index.next, 300
  br i1 %65, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %66 = add nuw nsw i64 %52, 1
  %exitcond49.not = icmp eq i64 %66, 300
  br i1 %exitcond49.not, label %.lr.ph.i, label %.preheader25

.lr.ph.i:                                         ; preds = %middle.block, %._crit_edge.i
  %67 = phi double [ %101, %._crit_edge.i ], [ 0xFFEFFFFFFFFFFFFF, %middle.block ]
  %68 = phi i64 [ %103, %._crit_edge.i ], [ 0, %middle.block ]
  %69 = mul nuw nsw i64 %68, 2400
  br label %70

70:                                               ; preds = %70, %.lr.ph.i
  %71 = phi double [ %67, %.lr.ph.i ], [ %101, %70 ]
  %72 = phi i64 [ 0, %.lr.ph.i ], [ %102, %70 ]
  %73 = shl i64 %72, 3
  %74 = add nuw nsw i64 %73, %69
  %75 = getelementptr i8, ptr %51, i64 %74
  %76 = load double, ptr %75, align 8, !tbaa !3
  %77 = tail call contract double @llvm.maxnum.f64(double %76, double %71)
  %78 = shl i64 %72, 3
  %79 = add i64 %78, 8
  %80 = add nuw nsw i64 %79, %69
  %81 = getelementptr i8, ptr %51, i64 %80
  %82 = load double, ptr %81, align 8, !tbaa !3
  %83 = tail call contract double @llvm.maxnum.f64(double %82, double %77)
  %84 = shl i64 %72, 3
  %85 = add i64 %84, 16
  %86 = add nuw nsw i64 %85, %69
  %87 = getelementptr i8, ptr %51, i64 %86
  %88 = load double, ptr %87, align 8, !tbaa !3
  %89 = tail call contract double @llvm.maxnum.f64(double %88, double %83)
  %90 = shl i64 %72, 3
  %91 = add i64 %90, 24
  %92 = add nuw nsw i64 %91, %69
  %93 = getelementptr i8, ptr %51, i64 %92
  %94 = load double, ptr %93, align 8, !tbaa !3
  %95 = tail call contract double @llvm.maxnum.f64(double %94, double %89)
  %96 = shl i64 %72, 3
  %97 = add i64 %96, 32
  %98 = add nuw nsw i64 %97, %69
  %99 = getelementptr i8, ptr %51, i64 %98
  %100 = load double, ptr %99, align 8, !tbaa !3
  %101 = tail call contract double @llvm.maxnum.f64(double %100, double %95)
  %102 = add nuw nsw i64 %72, 5
  %exitcond.not.i.4 = icmp eq i64 %102, 300
  br i1 %exitcond.not.i.4, label %._crit_edge.i, label %70

._crit_edge.i:                                    ; preds = %70
  %103 = add nuw nsw i64 %68, 1
  %exitcond5.not.i = icmp eq i64 %103, 300
  br i1 %exitcond5.not.i, label %_FortranAMaxvalReal8x2_contract_simplified.exit, label %.lr.ph.i

_FortranAMaxvalReal8x2_contract_simplified.exit:  ; preds = %._crit_edge.i
  tail call void @free(ptr nonnull %51)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(720000) @_QFEphi, ptr noundef nonnull align 16 dereferenceable(720000) @_QFEphiprime, i64 720000, i1 false), !tbaa !3
  %104 = add i32 %.033, 1
  %105 = fcmp ogt double %101, 0x3EB0C6F7A0B5ED8D
  br i1 %105, label %.preheader27, label %106

106:                                              ; preds = %_FortranAMaxvalReal8x2_contract_simplified.exit
  %107 = tail call contract double @_FortranACpuTime()
  %108 = tail call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F72686F2F746573742E66393000, i32 56)
  %109 = fsub contract double %107, %0
  %110 = tail call i1 @_FortranAioOutputReal64(ptr %108, double %109)
  %111 = tail call i1 @_FortranAioOutputInteger32(ptr %108, i32 %104)
  %112 = tail call i32 @_FortranAioEndIoStatement(ptr %108)
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

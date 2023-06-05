; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEarr.0 = internal unnamed_addr global ptr null
@_QQcl.1c24fad2427fba85941c2f07b505b42a = internal constant [49 x i8] c"/g/g92/rydahl1/flangtests/src/loop_reduction.f90\00"
@_QQcl.28612C69372C612C6531332E36653229 = internal constant [16 x i8] c"(a,i7,a,e13.6e2)"
@_QQcl.54686520726573756C74206F662073756D2861727228313A = internal constant [24 x i8] c"The result of sum(arr(1:"
@_QQcl.292920697320 = internal constant [6 x i8] c")) is "
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
  %1 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 8388608)
  store ptr %1, ptr @_QFEarr.0, align 8, !tbaa !1
  br label %2

2:                                                ; preds = %2, %0
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next.3, %2 ]
  %.0147 = phi double [ 0.000000e+00, %0 ], [ %11, %2 ]
  %3 = add nsw i64 %indvars.iv, -1
  %4 = getelementptr double, ptr %1, i64 %3
  store double 0x3EB0000000000000, ptr %4, align 8, !tbaa !5
  %5 = fadd contract double %.0147, 0x3EB0000000000000
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = getelementptr double, ptr %1, i64 %indvars.iv
  store double 0x3EB0000000000000, ptr %6, align 8, !tbaa !5
  %7 = fadd contract double %5, 0x3EB0000000000000
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %8 = getelementptr double, ptr %1, i64 %indvars.iv.next
  store double 0x3EB0000000000000, ptr %8, align 8, !tbaa !5
  %9 = fadd contract double %7, 0x3EB0000000000000
  %10 = getelementptr double, ptr %1, i64 %indvars.iv.next.1
  store double 0x3EB0000000000000, ptr %10, align 8, !tbaa !5
  %11 = fadd contract double %9, 0x3EB0000000000000
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.not.3 = icmp eq i64 %indvars.iv.next.3, 1048577
  br i1 %exitcond.not.3, label %12, label %2

12:                                               ; preds = %2
  %13 = tail call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28612C69372C612C6531332E36653229, i64 16, ptr null, i32 -1, ptr nonnull @_QQcl.1c24fad2427fba85941c2f07b505b42a, i32 21)
  %14 = tail call i1 @_FortranAioOutputAscii(ptr %13, ptr nonnull @_QQcl.54686520726573756C74206F662073756D2861727228313A, i64 24)
  %15 = tail call i1 @_FortranAioOutputInteger32(ptr %13, i32 1048576)
  %16 = tail call i1 @_FortranAioOutputAscii(ptr %13, ptr nonnull @_QQcl.292920697320, i64 6)
  %17 = tail call i1 @_FortranAioOutputReal64(ptr %13, double %11)
  %18 = tail call i32 @_FortranAioEndIoStatement(ptr %13)
  %.unpack = load ptr, ptr @_QFEarr.0, align 8, !tbaa !1
  tail call void @free(ptr %.unpack)
  store ptr null, ptr @_QFEarr.0, align 8, !tbaa !1
  ret void
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare zeroext i1 @_FortranAioOutputReal64(ptr, double) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2, !2, i64 0}
!2 = !{!"descriptor member", !3, i64 0}
!3 = !{!"any access", !4, i64 0}
!4 = !{!"Flang Type TBAA Root"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any data access", !3, i64 0}

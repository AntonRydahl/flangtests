; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEmat.0 = internal unnamed_addr global i32 undef
@_QQcl.28493029 = linkonce constant [4 x i8] c"(I0)"
@_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000 = linkonce constant [25 x i8] c"././resize_test/test.f90\00"
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
  %1 = tail call contract double @_FortranACpuTime()
  br label %.preheader12

.preheader12:                                     ; preds = %0, %.preheader12
  %2 = phi i64 [ 100000, %0 ], [ %6, %.preheader12 ]
  %3 = tail call dereferenceable_or_null(36) ptr @malloc(i64 36)
  %4 = tail call dereferenceable_or_null(72) ptr @realloc(ptr %3, i64 72)
  %5 = load i32, ptr %4, align 4, !tbaa !3
  tail call void @free(ptr %4)
  %6 = add nsw i64 %2, -1
  %.not = icmp eq i64 %6, 0
  br i1 %.not, label %7, label %.preheader12

7:                                                ; preds = %.preheader12
  store i32 %5, ptr @_QFEmat.0, align 4, !tbaa !3
  %8 = fptrunc double %1 to float
  %9 = tail call contract double @_FortranACpuTime()
  %10 = fptrunc double %9 to float
  %11 = tail call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28493029, i64 4, ptr null, i32 -1, ptr nonnull @_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000, i32 13)
  %12 = load i32, ptr @_QFEmat.0, align 4, !tbaa !3
  %13 = tail call i1 @_FortranAioOutputInteger32(ptr %11, i32 %12)
  %14 = tail call i32 @_FortranAioEndIoStatement(ptr %11)
  %15 = tail call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000, i32 14)
  %16 = fsub contract float %10, %8
  %17 = tail call i1 @_FortranAioOutputReal32(ptr %15, float %16)
  %18 = tail call i32 @_FortranAioEndIoStatement(ptr %15)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @_QFPresh_manual(ptr nocapture writeonly %0, ptr nocapture readonly %1) local_unnamed_addr #2 {
.preheader3.preheader:
  %2 = load i32, ptr %1, align 4, !tbaa !3
  store i32 %2, ptr %0, align 4, !tbaa !3
  %3 = getelementptr i32, ptr %1, i64 1
  %4 = load i32, ptr %3, align 4, !tbaa !3
  %5 = getelementptr i32, ptr %0, i64 3
  store i32 %4, ptr %5, align 4, !tbaa !3
  %6 = getelementptr i32, ptr %1, i64 2
  %7 = load i32, ptr %6, align 4, !tbaa !3
  %8 = getelementptr i32, ptr %0, i64 6
  store i32 %7, ptr %8, align 4, !tbaa !3
  %9 = getelementptr i32, ptr %1, i64 3
  %10 = load i32, ptr %9, align 4, !tbaa !3
  %11 = getelementptr i32, ptr %0, i64 1
  store i32 %10, ptr %11, align 4, !tbaa !3
  %12 = getelementptr i32, ptr %1, i64 4
  %13 = load i32, ptr %12, align 4, !tbaa !3
  %14 = getelementptr i32, ptr %0, i64 4
  store i32 %13, ptr %14, align 4, !tbaa !3
  %15 = getelementptr i32, ptr %1, i64 5
  %16 = load i32, ptr %15, align 4, !tbaa !3
  %17 = getelementptr i32, ptr %0, i64 7
  store i32 %16, ptr %17, align 4, !tbaa !3
  %18 = getelementptr i32, ptr %1, i64 6
  %19 = load i32, ptr %18, align 4, !tbaa !3
  %20 = getelementptr i32, ptr %0, i64 2
  store i32 %19, ptr %20, align 4, !tbaa !3
  %21 = getelementptr i32, ptr %1, i64 7
  %22 = load i32, ptr %21, align 4, !tbaa !3
  %23 = getelementptr i32, ptr %0, i64 5
  store i32 %22, ptr %23, align 4, !tbaa !3
  %24 = getelementptr i32, ptr %1, i64 8
  %25 = load i32, ptr %24, align 4, !tbaa !3
  %26 = getelementptr i32, ptr %0, i64 8
  store i32 %25, ptr %26, align 4, !tbaa !3
  ret void
}

declare double @_FortranACpuTime() local_unnamed_addr

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare noalias noundef ptr @realloc(ptr allocptr nocapture, i64 noundef) local_unnamed_addr #3

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputReal32(ptr, float) local_unnamed_addr

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #3 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"any data access", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang Type TBAA Root"}

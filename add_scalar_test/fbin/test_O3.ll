; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEa.0 = internal unnamed_addr global i32 1
@_QFEa.1 = internal unnamed_addr global i32 2
@_QFEa.2 = internal unnamed_addr global i32 3
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none)
define void @_QQmain() local_unnamed_addr #0 {
  %1 = load i32, ptr @_QFEa.0, align 4, !tbaa !3
  %2 = add i32 %1, 5
  store i32 %2, ptr @_QFEa.0, align 4, !tbaa !3
  %3 = load i32, ptr @_QFEa.1, align 4, !tbaa !3
  %4 = add i32 %3, 5
  store i32 %4, ptr @_QFEa.1, align 4, !tbaa !3
  %5 = load i32, ptr @_QFEa.2, align 4, !tbaa !3
  %6 = add i32 %5, 5
  store i32 %6, ptr @_QFEa.2, align 4, !tbaa !3
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"any data access", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang Type TBAA Root"}

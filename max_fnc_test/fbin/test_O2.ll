; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQcl.2E2F2E2F6D61785F666E635F746573742F746573742E66393000 = linkonce constant [26 x i8] c"././max_fnc_test/test.f90\00"

define i32 @_QMtestPmval_open(ptr %0) local_unnamed_addr {
  %2 = tail call i32 @_FortranAMaxvalInteger4(ptr %0, ptr nonnull @_QQcl.2E2F2E2F6D61785F666E635F746573742F746573742E66393000, i32 7, i32 0, ptr null)
  ret i32 %2
}

; Function Attrs: nofree nosync nounwind memory(read, inaccessiblemem: none)
define i32 @_QMtestPmval_closed(ptr %0) local_unnamed_addr #0 {
.lr.ph.i:
  %1 = load i32, ptr %0, align 4, !tbaa !3
  %2 = getelementptr i8, ptr %0, i64 4
  %3 = load i32, ptr %2, align 4, !tbaa !3
  %4 = tail call i32 @llvm.smax.i32(i32 %3, i32 %1)
  %5 = getelementptr i8, ptr %0, i64 8
  %6 = load i32, ptr %5, align 4, !tbaa !3
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 %4)
  ret i32 %7
}

declare i32 @_FortranAMaxvalInteger4(ptr, ptr, i32, i32, ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

attributes #0 = { nofree nosync nounwind memory(read, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"any data access", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang Type TBAA Root"}

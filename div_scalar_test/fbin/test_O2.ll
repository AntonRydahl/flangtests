; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QQcl.2E2F2E2F6469765F7363616C61725F746573742F746573742E66393000 = linkonce constant [29 x i8] c"././div_scalar_test/test.f90\00"
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

define void @_QQmain() local_unnamed_addr {
.preheader.preheader:
  %0 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %1 = alloca [3 x i32], align 4
  store i32 111, ptr %1, align 4, !tbaa !3
  %2 = getelementptr inbounds i32, ptr %1, i64 1
  store i32 24, ptr %2, align 4, !tbaa !3
  %3 = getelementptr inbounds i32, ptr %1, i64 2
  store i32 444, ptr %3, align 4, !tbaa !3
  %4 = tail call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F6469765F7363616C61725F746573742F746573742E66393000, i32 5)
  store ptr %1, ptr %0, align 8, !tbaa !7
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !7
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !7
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep, align 4, !tbaa !7
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !7
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 2, !tbaa !7
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !7
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !7
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 0, i64 1
  store i64 3, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !7
  %5 = call i1 @_FortranAioOutputDescriptor(ptr %4, ptr nonnull %0)
  %6 = call i32 @_FortranAioEndIoStatement(ptr %4)
  ret void
}

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputDescriptor(ptr, ptr) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"any data access", !5, i64 0}
!5 = !{!"any access", !6, i64 0}
!6 = !{!"Flang Type TBAA Root"}
!7 = !{!8, !8, i64 0}
!8 = !{!"descriptor member", !5, i64 0}

; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEnums = internal global [3 x [3 x i32]] undef
@_QQcl.28493029 = linkonce constant [4 x i8] c"(I0)"
@_QQcl.2E2F2E2F6D726D7672732F746573742E66393000 = linkonce constant [20 x i8] c"././mrmvrs/test.f90\00"
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %2 = tail call contract double @_FortranACpuTime()
  br label %.preheader

.preheader:                                       ; preds = %0, %.preheader
  %3 = phi i64 [ 10000000, %0 ], [ %30, %.preheader ]
  %4 = phi i32 [ 1, %0 ], [ %29, %.preheader ]
  %5 = tail call dereferenceable_or_null(12) ptr @malloc(i64 12)
  %6 = shl nuw i32 %4, 1
  store i32 %6, ptr %5, align 4, !tbaa !3
  %7 = shl nuw i32 %4, 2
  %8 = getelementptr [3 x i32], ptr %5, i64 0, i64 1
  store i32 %7, ptr %8, align 4, !tbaa !3
  %9 = tail call dereferenceable_or_null(24) ptr @realloc(ptr nonnull %5, i64 24)
  %10 = load i32, ptr %9, align 4, !tbaa !3
  %11 = getelementptr i32, ptr %9, i64 1
  %12 = load i32, ptr %11, align 4, !tbaa !3
  tail call void @free(ptr %9)
  %13 = tail call dereferenceable_or_null(12) ptr @malloc(i64 12)
  %14 = shl nuw i32 %4, 3
  store i32 %14, ptr %13, align 4, !tbaa !3
  %15 = mul nuw i32 %4, 10
  %16 = getelementptr [3 x i32], ptr %13, i64 0, i64 1
  store i32 %15, ptr %16, align 4, !tbaa !3
  %17 = tail call dereferenceable_or_null(24) ptr @realloc(ptr nonnull %13, i64 24)
  %18 = load i32, ptr %17, align 4, !tbaa !3
  %19 = getelementptr i32, ptr %17, i64 1
  %20 = load i32, ptr %19, align 4, !tbaa !3
  tail call void @free(ptr %17)
  %21 = tail call dereferenceable_or_null(12) ptr @malloc(i64 12)
  %22 = mul nuw i32 %4, 14
  store i32 %22, ptr %21, align 4, !tbaa !3
  %23 = shl nuw i32 %4, 4
  %24 = getelementptr [3 x i32], ptr %21, i64 0, i64 1
  store i32 %23, ptr %24, align 4, !tbaa !3
  %25 = tail call dereferenceable_or_null(24) ptr @realloc(ptr nonnull %21, i64 24)
  %26 = load i32, ptr %25, align 4, !tbaa !3
  %27 = getelementptr i32, ptr %25, i64 1
  %28 = load i32, ptr %27, align 4, !tbaa !3
  tail call void @free(ptr %25)
  %29 = add nuw nsw i32 %4, 1
  %30 = add nsw i64 %3, -1
  %.not = icmp eq i64 %30, 0
  br i1 %.not, label %31, label %.preheader

31:                                               ; preds = %.preheader
  %32 = mul nuw i32 %4, 6
  %33 = mul nuw i32 %4, 12
  %34 = mul nuw i32 %4, 18
  store i32 %10, ptr @_QFEnums, align 16, !tbaa !3
  store i32 %12, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 1, i64 0), align 4, !tbaa !3
  store i32 %32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 2, i64 0), align 8, !tbaa !3
  store i32 %18, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 0, i64 1), align 4, !tbaa !3
  store i32 %20, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 1, i64 1), align 16, !tbaa !3
  store i32 %33, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 2, i64 1), align 4, !tbaa !3
  store i32 %26, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 0, i64 2), align 8, !tbaa !3
  store i32 %28, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 1, i64 2), align 4, !tbaa !3
  store i32 %34, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 2, i64 2), align 16, !tbaa !3
  %35 = fptrunc double %2 to float
  %36 = tail call contract double @_FortranACpuTime()
  %37 = fptrunc double %36 to float
  %38 = tail call ptr @_FortranAioBeginExternalFormattedOutput(ptr nonnull @_QQcl.28493029, i64 4, ptr null, i32 -1, ptr nonnull @_QQcl.2E2F2E2F6D726D7672732F746573742E66393000, i32 19)
  store ptr @_QFEnums, ptr %1, align 8, !tbaa !7
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !7
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !7
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 3
  store i8 2, ptr %.fca.3.gep, align 4, !tbaa !7
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !7
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 2, !tbaa !7
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !7
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !7
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 1
  store i64 3, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !7
  %.fca.7.1.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 0
  store i64 1, ptr %.fca.7.1.0.gep, align 8, !tbaa !7
  %.fca.7.1.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 1
  store i64 3, ptr %.fca.7.1.1.gep, align 8, !tbaa !7
  %.fca.7.1.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 2
  store i64 12, ptr %.fca.7.1.2.gep, align 8, !tbaa !7
  %39 = call i1 @_FortranAioOutputDescriptor(ptr %38, ptr nonnull %1)
  %40 = call i32 @_FortranAioEndIoStatement(ptr %38)
  %41 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F6D726D7672732F746573742E66393000, i32 20)
  %42 = fsub contract float %37, %35
  %43 = call i1 @_FortranAioOutputReal32(ptr %41, float %42)
  %44 = call i32 @_FortranAioEndIoStatement(ptr %41)
  ret void
}

declare double @_FortranACpuTime() local_unnamed_addr

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare noalias noundef ptr @realloc(ptr allocptr nocapture, i64 noundef) local_unnamed_addr #2

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputDescriptor(ptr, ptr) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputReal32(ptr, float) local_unnamed_addr

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }

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

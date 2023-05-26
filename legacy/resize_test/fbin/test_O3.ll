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

define void @_QFPresh(ptr nocapture writeonly %0, ptr %1) local_unnamed_addr {
.preheader:
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  store ptr %1, ptr %3, align 8, !tbaa !7
  %.fca.1.gep17 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep17, align 8, !tbaa !7
  %.fca.2.gep19 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep19, align 8, !tbaa !7
  %.fca.3.gep21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep21, align 4, !tbaa !7
  %.fca.4.gep23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep23, align 1, !tbaa !7
  %.fca.5.gep25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep25, align 2, !tbaa !7
  %.fca.6.gep27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep27, align 1, !tbaa !7
  %.fca.7.0.0.gep29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep29, align 8, !tbaa !7
  %.fca.7.0.1.gep31 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 1
  store i64 9, ptr %.fca.7.0.1.gep31, align 8, !tbaa !7
  %.fca.7.0.2.gep33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep33, align 8, !tbaa !7
  %5 = tail call dereferenceable_or_null(8) ptr @malloc(i64 8)
  store i64 12884901891, ptr %5, align 4, !tbaa !3
  store ptr %5, ptr %2, align 8, !tbaa !7
  %.fca.1.gep37 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep37, align 8, !tbaa !7
  %.fca.2.gep39 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep39, align 8, !tbaa !7
  %.fca.3.gep41 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep41, align 4, !tbaa !7
  %.fca.4.gep43 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep43, align 1, !tbaa !7
  %.fca.5.gep45 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep45, align 2, !tbaa !7
  %.fca.6.gep47 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep47, align 1, !tbaa !7
  %.fca.7.0.0.gep49 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep49, align 8, !tbaa !7
  %.fca.7.0.1.gep51 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 1
  store i64 2, ptr %.fca.7.0.1.gep51, align 8, !tbaa !7
  %.fca.7.0.2.gep53 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep53, align 8, !tbaa !7
  store ptr null, ptr %4, align 8, !tbaa !7
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !7
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !7
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 3
  store i8 2, ptr %.fca.3.gep, align 4, !tbaa !7
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !7
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 5
  store i8 2, ptr %.fca.5.gep, align 2, !tbaa !7
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !7
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !7
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 1
  store i64 0, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !7
  %.fca.7.1.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 1, i64 0
  store i64 1, ptr %.fca.7.1.0.gep, align 8, !tbaa !7
  %.fca.7.1.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 1, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %.fca.7.1.1.gep, i8 0, i64 16, i1 false)
  %6 = call {} @_FortranAReshape(ptr nonnull %4, ptr nonnull %3, ptr nonnull %2, ptr null, ptr null, ptr nonnull @_QQcl.2E2F2E2F726573697A655F746573742F746573742E66393000, i32 19)
  %.fca.0.load = load ptr, ptr %4, align 8, !tbaa !7
  %.fca.7.0.1.load = load i64, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %7 = load i32, ptr %.fca.0.load, align 4, !tbaa !3
  store i32 %7, ptr %0, align 4, !tbaa !3
  %8 = getelementptr i32, ptr %.fca.0.load, i64 1
  %9 = load i32, ptr %8, align 4, !tbaa !3
  %10 = getelementptr i32, ptr %0, i64 1
  store i32 %9, ptr %10, align 4, !tbaa !3
  %11 = getelementptr i32, ptr %.fca.0.load, i64 2
  %12 = load i32, ptr %11, align 4, !tbaa !3
  %13 = getelementptr i32, ptr %0, i64 2
  store i32 %12, ptr %13, align 4, !tbaa !3
  %14 = getelementptr i32, ptr %.fca.0.load, i64 %.fca.7.0.1.load
  %15 = load i32, ptr %14, align 4, !tbaa !3
  %16 = getelementptr i32, ptr %0, i64 3
  store i32 %15, ptr %16, align 4, !tbaa !3
  %17 = add i64 %.fca.7.0.1.load, 1
  %18 = getelementptr i32, ptr %.fca.0.load, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !3
  %20 = getelementptr i32, ptr %0, i64 4
  store i32 %19, ptr %20, align 4, !tbaa !3
  %21 = add i64 %.fca.7.0.1.load, 2
  %22 = getelementptr i32, ptr %.fca.0.load, i64 %21
  %23 = load i32, ptr %22, align 4, !tbaa !3
  %24 = getelementptr i32, ptr %0, i64 5
  store i32 %23, ptr %24, align 4, !tbaa !3
  %25 = shl i64 %.fca.7.0.1.load, 1
  %26 = getelementptr i32, ptr %.fca.0.load, i64 %25
  %27 = load i32, ptr %26, align 4, !tbaa !3
  %28 = getelementptr i32, ptr %0, i64 6
  store i32 %27, ptr %28, align 4, !tbaa !3
  %29 = or i64 %25, 1
  %30 = getelementptr i32, ptr %.fca.0.load, i64 %29
  %31 = load i32, ptr %30, align 4, !tbaa !3
  %32 = getelementptr i32, ptr %0, i64 7
  store i32 %31, ptr %32, align 4, !tbaa !3
  %33 = add i64 %25, 2
  %34 = getelementptr i32, ptr %.fca.0.load, i64 %33
  %35 = load i32, ptr %34, align 4, !tbaa !3
  %36 = getelementptr i32, ptr %0, i64 8
  store i32 %35, ptr %36, align 4, !tbaa !3
  call void @free(ptr %.fca.0.load)
  call void @free(ptr %5)
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

declare {} @_FortranAReshape(ptr, ptr, ptr, ptr, ptr, ptr, i32) local_unnamed_addr

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #3 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }

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

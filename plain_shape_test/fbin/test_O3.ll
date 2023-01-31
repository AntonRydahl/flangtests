; Original program:
;
; program test
;   implicit none
;
;   interface
;     pure integer function special_rng(ind)
;       integer, intent(in) :: ind
;     end function
;   end interface
;
;   integer :: m(3, 3), i
;   m = transpose(reshape([ (special_rng(i), i = 1,9) ], [3, 3]))
;
;   print *, m
; end program

; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEm = internal global [3 x [3 x i32]] undef
@_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000 = linkonce constant [30 x i8] c"././plain_shape_test/test.f90\00"
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
.preheader:
  %0 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %4 = alloca i32, align 4
  %5 = tail call dereferenceable_or_null(36) ptr @malloc(i64 36)
  store i32 1, ptr %4, align 4, !tbaa !3
  %6 = call i32 @special_rng_(ptr nonnull %4)
  store i32 %6, ptr %5, align 4, !tbaa !3
  store i32 2, ptr %4, align 4, !tbaa !3
  %7 = call i32 @special_rng_(ptr nonnull %4)
  %8 = getelementptr [9 x i32], ptr %5, i64 0, i64 1
  store i32 %7, ptr %8, align 4, !tbaa !3
  store i32 3, ptr %4, align 4, !tbaa !3
  %9 = call i32 @special_rng_(ptr nonnull %4)
  %10 = getelementptr [9 x i32], ptr %5, i64 0, i64 2
  store i32 %9, ptr %10, align 4, !tbaa !3
  store i32 4, ptr %4, align 4, !tbaa !3
  %11 = call i32 @special_rng_(ptr nonnull %4)
  %12 = getelementptr [9 x i32], ptr %5, i64 0, i64 3
  store i32 %11, ptr %12, align 4, !tbaa !3
  store i32 5, ptr %4, align 4, !tbaa !3
  %13 = call i32 @special_rng_(ptr nonnull %4)
  %14 = getelementptr [9 x i32], ptr %5, i64 0, i64 4
  store i32 %13, ptr %14, align 4, !tbaa !3
  store i32 6, ptr %4, align 4, !tbaa !3
  %15 = call i32 @special_rng_(ptr nonnull %4)
  %16 = getelementptr [9 x i32], ptr %5, i64 0, i64 5
  store i32 %15, ptr %16, align 4, !tbaa !3
  store i32 7, ptr %4, align 4, !tbaa !3
  %17 = call i32 @special_rng_(ptr nonnull %4)
  %18 = getelementptr [9 x i32], ptr %5, i64 0, i64 6
  store i32 %17, ptr %18, align 4, !tbaa !3
  store i32 8, ptr %4, align 4, !tbaa !3
  %19 = call i32 @special_rng_(ptr nonnull %4)
  %20 = getelementptr [9 x i32], ptr %5, i64 0, i64 7
  store i32 %19, ptr %20, align 4, !tbaa !3
  store i32 9, ptr %4, align 4, !tbaa !3
  %21 = call i32 @special_rng_(ptr nonnull %4)
  %22 = call dereferenceable_or_null(72) ptr @realloc(ptr nonnull %5, i64 72)
  %23 = call dereferenceable_or_null(36) ptr @malloc(i64 36)
  %24 = load i32, ptr %22, align 4, !tbaa !3
  store i32 %24, ptr %23, align 4, !tbaa !3
  %25 = getelementptr i32, ptr %22, i64 1
  %26 = load i32, ptr %25, align 4, !tbaa !3
  %27 = getelementptr i32, ptr %23, i64 1
  store i32 %26, ptr %27, align 4, !tbaa !3
  %28 = getelementptr i32, ptr %22, i64 2
  %29 = load i32, ptr %28, align 4, !tbaa !3
  %30 = getelementptr i32, ptr %23, i64 2
  store i32 %29, ptr %30, align 4, !tbaa !3
  %31 = getelementptr i32, ptr %22, i64 3
  %32 = load i32, ptr %31, align 4, !tbaa !3
  %33 = getelementptr i32, ptr %23, i64 3
  store i32 %32, ptr %33, align 4, !tbaa !3
  %34 = getelementptr i32, ptr %22, i64 4
  %35 = load i32, ptr %34, align 4, !tbaa !3
  %36 = getelementptr i32, ptr %23, i64 4
  store i32 %35, ptr %36, align 4, !tbaa !3
  %37 = getelementptr i32, ptr %22, i64 5
  %38 = load i32, ptr %37, align 4, !tbaa !3
  %39 = getelementptr i32, ptr %23, i64 5
  store i32 %38, ptr %39, align 4, !tbaa !3
  %40 = getelementptr i32, ptr %22, i64 6
  %41 = load i32, ptr %40, align 4, !tbaa !3
  %42 = getelementptr i32, ptr %23, i64 6
  store i32 %41, ptr %42, align 4, !tbaa !3
  %43 = getelementptr i32, ptr %22, i64 7
  %44 = load i32, ptr %43, align 4, !tbaa !3
  %45 = getelementptr i32, ptr %23, i64 7
  store i32 %44, ptr %45, align 4, !tbaa !3
  %46 = getelementptr i32, ptr %23, i64 8
  store i32 %21, ptr %46, align 4, !tbaa !3
  store ptr %23, ptr %2, align 8, !tbaa !7
  %.fca.1.gep19 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep19, align 8, !tbaa !7
  %.fca.2.gep21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep21, align 8, !tbaa !7
  %.fca.3.gep23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep23, align 4, !tbaa !7
  %.fca.4.gep25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep25, align 1, !tbaa !7
  %.fca.5.gep27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep27, align 2, !tbaa !7
  %.fca.6.gep29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep29, align 1, !tbaa !7
  %.fca.7.0.0.gep31 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep31, align 8, !tbaa !7
  %.fca.7.0.1.gep33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 1
  store i64 9, ptr %.fca.7.0.1.gep33, align 8, !tbaa !7
  %.fca.7.0.2.gep35 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep35, align 8, !tbaa !7
  %47 = call dereferenceable_or_null(8) ptr @malloc(i64 8)
  store i64 12884901891, ptr %47, align 4, !tbaa !3
  store ptr %47, ptr %1, align 8, !tbaa !7
  %.fca.1.gep39 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep39, align 8, !tbaa !7
  %.fca.2.gep41 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep41, align 8, !tbaa !7
  %.fca.3.gep43 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 3
  store i8 1, ptr %.fca.3.gep43, align 4, !tbaa !7
  %.fca.4.gep45 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep45, align 1, !tbaa !7
  %.fca.5.gep47 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep47, align 2, !tbaa !7
  %.fca.6.gep49 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep49, align 1, !tbaa !7
  %.fca.7.0.0.gep51 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep51, align 8, !tbaa !7
  %.fca.7.0.1.gep53 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 1
  store i64 2, ptr %.fca.7.0.1.gep53, align 8, !tbaa !7
  %.fca.7.0.2.gep55 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep55, align 8, !tbaa !7
  store ptr null, ptr %3, align 8, !tbaa !7
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !7
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !7
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 3
  store i8 2, ptr %.fca.3.gep, align 4, !tbaa !7
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !7
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 5
  store i8 2, ptr %.fca.5.gep, align 2, !tbaa !7
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !7
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !7
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 1
  store i64 0, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !7
  %.fca.7.1.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 1, i64 0
  store i64 1, ptr %.fca.7.1.0.gep, align 8, !tbaa !7
  %.fca.7.1.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 1, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %.fca.7.1.1.gep, i8 0, i64 16, i1 false)
  %48 = call {} @_FortranAReshape(ptr nonnull %3, ptr nonnull %2, ptr nonnull %1, ptr null, ptr null, ptr nonnull @_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000, i32 11)
  %.fca.0.load = load ptr, ptr %3, align 8, !tbaa !7
  %.fca.7.0.1.load = load i64, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %49 = load i32, ptr %.fca.0.load, align 4, !tbaa !3
  store i32 %49, ptr @_QFEm, align 16, !tbaa !3
  %50 = getelementptr i32, ptr %.fca.0.load, i64 %.fca.7.0.1.load
  %51 = load i32, ptr %50, align 4, !tbaa !3
  store i32 %51, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 0, i64 1), align 4, !tbaa !3
  %52 = shl i64 %.fca.7.0.1.load, 1
  %53 = getelementptr i32, ptr %.fca.0.load, i64 %52
  %54 = load i32, ptr %53, align 4, !tbaa !3
  store i32 %54, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 0, i64 2), align 8, !tbaa !3
  %55 = getelementptr i32, ptr %.fca.0.load, i64 1
  %56 = load i32, ptr %55, align 4, !tbaa !3
  store i32 %56, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 1, i64 0), align 4, !tbaa !3
  %57 = add i64 %.fca.7.0.1.load, 1
  %58 = getelementptr i32, ptr %.fca.0.load, i64 %57
  %59 = load i32, ptr %58, align 4, !tbaa !3
  store i32 %59, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 1, i64 1), align 16, !tbaa !3
  %60 = or i64 %52, 1
  %61 = getelementptr i32, ptr %.fca.0.load, i64 %60
  %62 = load i32, ptr %61, align 4, !tbaa !3
  store i32 %62, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 1, i64 2), align 4, !tbaa !3
  %63 = getelementptr i32, ptr %.fca.0.load, i64 2
  %64 = load i32, ptr %63, align 4, !tbaa !3
  store i32 %64, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 2, i64 0), align 8, !tbaa !3
  %65 = add i64 %.fca.7.0.1.load, 2
  %66 = getelementptr i32, ptr %.fca.0.load, i64 %65
  %67 = load i32, ptr %66, align 4, !tbaa !3
  store i32 %67, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 2, i64 1), align 4, !tbaa !3
  %68 = add i64 %52, 2
  %69 = getelementptr i32, ptr %.fca.0.load, i64 %68
  %70 = load i32, ptr %69, align 4, !tbaa !3
  store i32 %70, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEm, i64 0, i64 2, i64 2), align 16, !tbaa !3
  call void @free(ptr %.fca.0.load)
  call void @free(ptr %47)
  call void @free(ptr %23)
  call void @free(ptr %22)
  %71 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F706C61696E5F73686170655F746573742F746573742E66393000, i32 13)
  store ptr @_QFEm, ptr %0, align 8, !tbaa !7
  %.fca.1.gep119 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 1
  store i64 4, ptr %.fca.1.gep119, align 8, !tbaa !7
  %.fca.2.gep120 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 2
  store i32 20180515, ptr %.fca.2.gep120, align 8, !tbaa !7
  %.fca.3.gep121 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 3
  store i8 2, ptr %.fca.3.gep121, align 4, !tbaa !7
  %.fca.4.gep122 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 4
  store i8 9, ptr %.fca.4.gep122, align 1, !tbaa !7
  %.fca.5.gep123 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 5
  store i8 0, ptr %.fca.5.gep123, align 2, !tbaa !7
  %.fca.6.gep124 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 6
  store i8 0, ptr %.fca.6.gep124, align 1, !tbaa !7
  %.fca.7.0.0.gep125 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 0, i64 0
  store i64 1, ptr %.fca.7.0.0.gep125, align 8, !tbaa !7
  %.fca.7.0.1.gep126 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 0, i64 1
  store i64 3, ptr %.fca.7.0.1.gep126, align 8, !tbaa !7
  %.fca.7.0.2.gep127 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 0, i64 2
  store i64 4, ptr %.fca.7.0.2.gep127, align 8, !tbaa !7
  %.fca.7.1.0.gep128 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 1, i64 0
  store i64 1, ptr %.fca.7.1.0.gep128, align 8, !tbaa !7
  %.fca.7.1.1.gep129 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 1, i64 1
  store i64 3, ptr %.fca.7.1.1.gep129, align 8, !tbaa !7
  %.fca.7.1.2.gep130 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %0, i64 0, i32 7, i64 1, i64 2
  store i64 12, ptr %.fca.7.1.2.gep130, align 8, !tbaa !7
  %72 = call i1 @_FortranAioOutputDescriptor(ptr %71, ptr nonnull %0)
  %73 = call i32 @_FortranAioEndIoStatement(ptr %71)
  ret void
}

declare i32 @special_rng_(ptr) local_unnamed_addr

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare noalias noundef ptr @realloc(ptr allocptr nocapture, i64 noundef) local_unnamed_addr #2

declare {} @_FortranAReshape(ptr, ptr, ptr, ptr, ptr, ptr, i32) local_unnamed_addr

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputDescriptor(ptr, ptr) local_unnamed_addr

declare i32 @_FortranAioEndIoStatement(ptr) local_unnamed_addr

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #1 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #2 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }

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

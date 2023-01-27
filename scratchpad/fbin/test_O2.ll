; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_QFEnums = internal global [3 x [3 x i32]] undef
@_QQcl.2E2F2E2F736372617463687061642F746573742E66393000 = linkonce constant [24 x i8] c"././scratchpad/test.f90\00"
@_QQEnvironmentDefaults = local_unnamed_addr constant ptr null

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #1

define void @_QQmain() local_unnamed_addr {
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %2 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %3 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %4 = alloca { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, align 8
  %5 = alloca { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, align 8
  %.fca.1.gep71 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 1
  %.fca.2.gep73 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 2
  %.fca.3.gep75 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 3
  %.fca.4.gep77 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 4
  %.fca.5.gep79 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 5
  %.fca.6.gep81 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 6
  %.fca.7.0.0.gep83 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep85 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep87 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %3, i64 0, i32 7, i64 0, i64 2
  %.fca.1.gep91 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 1
  %.fca.2.gep93 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 2
  %.fca.3.gep95 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 3
  %.fca.4.gep97 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 4
  %.fca.5.gep99 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 5
  %.fca.6.gep101 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 6
  %.fca.7.0.0.gep103 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep105 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep107 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %2, i64 0, i32 7, i64 0, i64 2
  %.fca.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 1
  %.fca.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 2
  %.fca.3.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 3
  %.fca.4.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 4
  %.fca.5.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 5
  %.fca.6.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 6
  %.fca.7.0.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 0, i64 2
  %.fca.7.1.0.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 1, i64 0
  %.fca.7.1.1.gep = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %5, i64 0, i32 7, i64 1, i64 1
  %.fca.1.gep171 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 1
  %.fca.2.gep172 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 2
  %.fca.3.gep173 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 3
  %.fca.4.gep174 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 4
  %.fca.5.gep175 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 5
  %.fca.6.gep176 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 6
  %.fca.7.0.0.gep177 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep178 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep179 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 0, i64 2
  %.fca.7.1.0.gep180 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 0
  %.fca.7.1.1.gep181 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 1
  %.fca.7.1.2.gep182 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]] }, ptr %1, i64 0, i32 7, i64 1, i64 2
  %.fca.1.gep21 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 1
  %.fca.2.gep23 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 2
  %.fca.3.gep25 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 3
  %.fca.4.gep27 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 4
  %.fca.5.gep29 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 5
  %.fca.6.gep31 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 6
  %.fca.7.0.0.gep33 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 0
  %.fca.7.0.1.gep35 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 1
  %.fca.7.0.2.gep37 = getelementptr inbounds { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr %4, i64 0, i32 7, i64 0, i64 2
  br label %.preheader

.preheader:                                       ; preds = %0, %.preheader
  %6 = phi i64 [ 100000, %0 ], [ %75, %.preheader ]
  %7 = phi i32 [ 1, %0 ], [ %74, %.preheader ]
  %8 = call dereferenceable_or_null(36) ptr @malloc(i64 36)
  store i32 %7, ptr %8, align 4, !tbaa !3
  %9 = shl nuw nsw i32 %7, 1
  %10 = getelementptr [9 x i32], ptr %8, i64 0, i64 1
  store i32 %9, ptr %10, align 4, !tbaa !3
  %11 = mul nuw nsw i32 %7, 3
  %12 = getelementptr [9 x i32], ptr %8, i64 0, i64 2
  store i32 %11, ptr %12, align 4, !tbaa !3
  %13 = shl nuw nsw i32 %7, 2
  %14 = getelementptr [9 x i32], ptr %8, i64 0, i64 3
  store i32 %13, ptr %14, align 4, !tbaa !3
  %15 = mul nuw nsw i32 %7, 5
  %16 = getelementptr [9 x i32], ptr %8, i64 0, i64 4
  store i32 %15, ptr %16, align 4, !tbaa !3
  %17 = mul nuw nsw i32 %7, 6
  %18 = getelementptr [9 x i32], ptr %8, i64 0, i64 5
  store i32 %17, ptr %18, align 4, !tbaa !3
  %19 = mul nuw nsw i32 %7, 7
  %20 = getelementptr [9 x i32], ptr %8, i64 0, i64 6
  store i32 %19, ptr %20, align 4, !tbaa !3
  %21 = shl nuw nsw i32 %7, 3
  %22 = getelementptr [9 x i32], ptr %8, i64 0, i64 7
  store i32 %21, ptr %22, align 4, !tbaa !3
  %23 = mul nuw nsw i32 %7, 9
  %24 = call dereferenceable_or_null(72) ptr @realloc(ptr nonnull %8, i64 72)
  %25 = call dereferenceable_or_null(36) ptr @malloc(i64 36)
  %26 = load i32, ptr %24, align 4, !tbaa !3
  store i32 %26, ptr %25, align 4, !tbaa !3
  %27 = getelementptr i32, ptr %24, i64 1
  %28 = load i32, ptr %27, align 4, !tbaa !3
  %29 = getelementptr i32, ptr %25, i64 1
  store i32 %28, ptr %29, align 4, !tbaa !3
  %30 = getelementptr i32, ptr %24, i64 2
  %31 = load i32, ptr %30, align 4, !tbaa !3
  %32 = getelementptr i32, ptr %25, i64 2
  store i32 %31, ptr %32, align 4, !tbaa !3
  %33 = getelementptr i32, ptr %24, i64 3
  %34 = load i32, ptr %33, align 4, !tbaa !3
  %35 = getelementptr i32, ptr %25, i64 3
  store i32 %34, ptr %35, align 4, !tbaa !3
  %36 = getelementptr i32, ptr %24, i64 4
  %37 = load i32, ptr %36, align 4, !tbaa !3
  %38 = getelementptr i32, ptr %25, i64 4
  store i32 %37, ptr %38, align 4, !tbaa !3
  %39 = getelementptr i32, ptr %24, i64 5
  %40 = load i32, ptr %39, align 4, !tbaa !3
  %41 = getelementptr i32, ptr %25, i64 5
  store i32 %40, ptr %41, align 4, !tbaa !3
  %42 = getelementptr i32, ptr %24, i64 6
  %43 = load i32, ptr %42, align 4, !tbaa !3
  %44 = getelementptr i32, ptr %25, i64 6
  store i32 %43, ptr %44, align 4, !tbaa !3
  %45 = getelementptr i32, ptr %24, i64 7
  %46 = load i32, ptr %45, align 4, !tbaa !3
  %47 = getelementptr i32, ptr %25, i64 7
  store i32 %46, ptr %47, align 4, !tbaa !3
  %48 = getelementptr i32, ptr %25, i64 8
  store i32 %23, ptr %48, align 4, !tbaa !3
  store ptr %25, ptr %3, align 8, !tbaa !7
  store i64 4, ptr %.fca.1.gep71, align 8, !tbaa !7
  store i32 20180515, ptr %.fca.2.gep73, align 8, !tbaa !7
  store i8 1, ptr %.fca.3.gep75, align 4, !tbaa !7
  store i8 9, ptr %.fca.4.gep77, align 1, !tbaa !7
  store i8 0, ptr %.fca.5.gep79, align 2, !tbaa !7
  store i8 0, ptr %.fca.6.gep81, align 1, !tbaa !7
  store i64 1, ptr %.fca.7.0.0.gep83, align 8, !tbaa !7
  store i64 9, ptr %.fca.7.0.1.gep85, align 8, !tbaa !7
  store i64 4, ptr %.fca.7.0.2.gep87, align 8, !tbaa !7
  %49 = call dereferenceable_or_null(8) ptr @malloc(i64 8)
  store i64 12884901891, ptr %49, align 4, !tbaa !3
  store ptr %49, ptr %2, align 8, !tbaa !7
  store i64 4, ptr %.fca.1.gep91, align 8, !tbaa !7
  store i32 20180515, ptr %.fca.2.gep93, align 8, !tbaa !7
  store i8 1, ptr %.fca.3.gep95, align 4, !tbaa !7
  store i8 9, ptr %.fca.4.gep97, align 1, !tbaa !7
  store i8 0, ptr %.fca.5.gep99, align 2, !tbaa !7
  store i8 0, ptr %.fca.6.gep101, align 1, !tbaa !7
  store i64 1, ptr %.fca.7.0.0.gep103, align 8, !tbaa !7
  store i64 2, ptr %.fca.7.0.1.gep105, align 8, !tbaa !7
  store i64 4, ptr %.fca.7.0.2.gep107, align 8, !tbaa !7
  store ptr null, ptr %5, align 8, !tbaa !7
  store i64 4, ptr %.fca.1.gep, align 8, !tbaa !7
  store i32 20180515, ptr %.fca.2.gep, align 8, !tbaa !7
  store i8 2, ptr %.fca.3.gep, align 4, !tbaa !7
  store i8 9, ptr %.fca.4.gep, align 1, !tbaa !7
  store i8 2, ptr %.fca.5.gep, align 2, !tbaa !7
  store i8 0, ptr %.fca.6.gep, align 1, !tbaa !7
  store i64 1, ptr %.fca.7.0.0.gep, align 8, !tbaa !7
  store i64 0, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  store i64 4, ptr %.fca.7.0.2.gep, align 8, !tbaa !7
  store i64 1, ptr %.fca.7.1.0.gep, align 8, !tbaa !7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %.fca.7.1.1.gep, i8 0, i64 16, i1 false)
  %50 = call {} @_FortranAReshape(ptr nonnull %5, ptr nonnull %3, ptr nonnull %2, ptr null, ptr null, ptr nonnull @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 8)
  %.fca.0.load = load ptr, ptr %5, align 8, !tbaa !7
  %.fca.7.0.1.load = load i64, ptr %.fca.7.0.1.gep, align 8, !tbaa !7
  %51 = load i32, ptr %.fca.0.load, align 4, !tbaa !3
  store i32 %51, ptr @_QFEnums, align 16, !tbaa !3
  %52 = getelementptr i32, ptr %.fca.0.load, i64 1
  %53 = load i32, ptr %52, align 4, !tbaa !3
  store i32 %53, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 0, i64 1), align 4, !tbaa !3
  %54 = getelementptr i32, ptr %.fca.0.load, i64 2
  %55 = load i32, ptr %54, align 4, !tbaa !3
  store i32 %55, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 0, i64 2), align 8, !tbaa !3
  %56 = getelementptr i32, ptr %.fca.0.load, i64 %.fca.7.0.1.load
  %57 = load i32, ptr %56, align 4, !tbaa !3
  store i32 %57, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 1, i64 0), align 4, !tbaa !3
  %58 = add i64 %.fca.7.0.1.load, 1
  %59 = getelementptr i32, ptr %.fca.0.load, i64 %58
  %60 = load i32, ptr %59, align 4, !tbaa !3
  store i32 %60, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 1, i64 1), align 16, !tbaa !3
  %61 = add i64 %.fca.7.0.1.load, 2
  %62 = getelementptr i32, ptr %.fca.0.load, i64 %61
  %63 = load i32, ptr %62, align 4, !tbaa !3
  store i32 %63, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 1, i64 2), align 4, !tbaa !3
  %64 = shl i64 %.fca.7.0.1.load, 1
  %65 = getelementptr i32, ptr %.fca.0.load, i64 %64
  %66 = load i32, ptr %65, align 4, !tbaa !3
  store i32 %66, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 2, i64 0), align 8, !tbaa !3
  %67 = or i64 %64, 1
  %68 = getelementptr i32, ptr %.fca.0.load, i64 %67
  %69 = load i32, ptr %68, align 4, !tbaa !3
  store i32 %69, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 2, i64 1), align 4, !tbaa !3
  %70 = add i64 %64, 2
  %71 = getelementptr i32, ptr %.fca.0.load, i64 %70
  %72 = load i32, ptr %71, align 4, !tbaa !3
  store i32 %72, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @_QFEnums, i64 0, i64 2, i64 2), align 16, !tbaa !3
  call void @free(ptr %.fca.0.load)
  call void @free(ptr %49)
  call void @free(ptr %25)
  call void @free(ptr %24)
  store ptr @_QFEnums, ptr %1, align 8, !tbaa !7
  store i64 4, ptr %.fca.1.gep171, align 8, !tbaa !7
  store i32 20180515, ptr %.fca.2.gep172, align 8, !tbaa !7
  store i8 2, ptr %.fca.3.gep173, align 4, !tbaa !7
  store i8 9, ptr %.fca.4.gep174, align 1, !tbaa !7
  store i8 0, ptr %.fca.5.gep175, align 2, !tbaa !7
  store i8 0, ptr %.fca.6.gep176, align 1, !tbaa !7
  store i64 1, ptr %.fca.7.0.0.gep177, align 8, !tbaa !7
  store i64 3, ptr %.fca.7.0.1.gep178, align 8, !tbaa !7
  store i64 4, ptr %.fca.7.0.2.gep179, align 8, !tbaa !7
  store i64 1, ptr %.fca.7.1.0.gep180, align 8, !tbaa !7
  store i64 3, ptr %.fca.7.1.1.gep181, align 8, !tbaa !7
  store i64 12, ptr %.fca.7.1.2.gep182, align 8, !tbaa !7
  store ptr null, ptr %4, align 8, !tbaa !7
  store i64 4, ptr %.fca.1.gep21, align 8, !tbaa !7
  store i32 20180515, ptr %.fca.2.gep23, align 8, !tbaa !7
  store i8 1, ptr %.fca.3.gep25, align 4, !tbaa !7
  store i8 9, ptr %.fca.4.gep27, align 1, !tbaa !7
  store i8 2, ptr %.fca.5.gep29, align 2, !tbaa !7
  store i8 0, ptr %.fca.6.gep31, align 1, !tbaa !7
  store i64 1, ptr %.fca.7.0.0.gep33, align 8, !tbaa !7
  store i64 0, ptr %.fca.7.0.1.gep35, align 8, !tbaa !7
  store i64 4, ptr %.fca.7.0.2.gep37, align 8, !tbaa !7
  %73 = call {} @_FortranASumDim(ptr nonnull %4, ptr nonnull %1, i32 1, ptr nonnull @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 9, ptr null)
  %.fca.0.load39 = load ptr, ptr %4, align 8, !tbaa !7
  call void @free(ptr %.fca.0.load39)
  %74 = add nuw nsw i32 %7, 1
  %75 = add nsw i64 %6, -1
  %.not = icmp eq i64 %75, 0
  br i1 %.not, label %76, label %.preheader

76:                                               ; preds = %.preheader
  %77 = call ptr @_FortranAioBeginExternalListOutput(i32 -1, ptr nonnull @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 12)
  %78 = call i1 @_FortranAioOutputInteger32(ptr %77, i32 9)
  %79 = call i32 @_FortranAioEndIoStatement(ptr %77)
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
  %6 = call {} @_FortranAReshape(ptr nonnull %4, ptr nonnull %3, ptr nonnull %2, ptr null, ptr null, ptr nonnull @_QQcl.2E2F2E2F736372617463687061642F746573742E66393000, i32 21)
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

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare noalias noundef ptr @realloc(ptr allocptr nocapture, i64 noundef) local_unnamed_addr #2

declare {} @_FortranAReshape(ptr, ptr, ptr, ptr, ptr, ptr, i32) local_unnamed_addr

declare {} @_FortranASumDim(ptr, ptr, i32, ptr, i32, ptr) local_unnamed_addr

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32) local_unnamed_addr

declare i1 @_FortranAioOutputInteger32(ptr, i32) local_unnamed_addr

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

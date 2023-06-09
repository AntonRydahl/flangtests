# Manual Inlining of Loop in Parallel Region
This example shows how `flang-new` fails to vectorize a loop if it is contained in an OpenMP parallel region.

## Example Code
```fortran
PROGRAM parallel_region
#ifdef OPENMP
	USE OMP_LIB
#endif
	IMPLICIT NONE
	INTEGER(kind=4)			:: length
	REAL(kind=8)			:: tmp, res
	length = 1024*1024
	call omp_subroutine(length,res)
	write(*,100) "The result of (arr(1)+arr(",length,") is ", res
	100 format (A,I7,A,e13.6e2)
CONTAINS
	SUBROUTINE omp_subroutine(length,res)
		IMPLICIT NONE
		INTEGER(kind=4), INTENT(in)	:: length
		INTEGER(kind=4)			:: tid,threads,from,to,block_size
		REAL(kind=8), ALLOCATABLE	:: arr(:)
		REAL(kind=8)			:: tmp
		REAL(kind=8), INTENT(out)	:: res 
		allocate (arr(length))
		!$omp parallel private(tid,threads,from,to,block_size) shared(length,arr)
#ifdef OPENMP
		tid = omp_get_thread_num()
		threads = omp_get_num_threads()
#else
		tid = 0
		threads = 1
#endif
		block_size = length / threads
		from = tid*block_size + 1 
		IF (tid .EQ. (threads - 1)) THEN
			to = length
		ELSE
			to = from + block_size
		END IF
		call loop(from,to,arr)
		!$omp end parallel
		res = arr(1) + arr(length)
		deallocate(arr)
	END SUBROUTINE omp_subroutine

	SUBROUTINE loop(from,to,arr)
		IMPLICIT NONE
		INTEGER(kind=4), INTENT(in) 	:: from,to
		REAL(KIND=8), INTENT(inout)	:: arr(:)
                INTEGER(kind=4)			:: i
		DO i=from,to
                        arr(i) = 1.0/length
                        tmp = arr(i)
                END DO
	END SUBROUTINE loop
END PROGRAM parallel_region
```

### Inlining the Loop
The do loop in the subroutine can be inlined with
```fortran
		IF (tid .EQ. (threads - 1)) THEN
			to = length
		ELSE
			to = from + block_size
		END IF
		DO i=from,to
			arr(i) = 1.0/length
	        	tmp = arr(i)
		END DO
		!$omp end parallel
		res = arr(1) + arr(length)
		deallocate(arr)
	END SUBROUTINE omp_subroutine
```

## Compilation
The example must be compiled with the `C` processor enabled, `-cpp`, and with `OPENMP` defined to give the expected results.<br>
To compile the code, type
```bash
make APP=parallel_region_outlined OPT=-O3 OMP=1 llvmirdump
```
For the inlined version, type
```bash
make APP=parallel_region OPT=-O3 OMP=1 llvmirdump
```

## Difference in LLVM IR
In the example code where the `loop` subroutine is called from the parallel region, the do loop is vectorized at optimization level `-O3`. In the LLVM IR, the vector loop body can be found.
```llvm
vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %.cast85 = trunc i64 %index to i32
  %offset.idx = add i32 %6, %.cast85
  %43 = sext i32 %offset.idx to i64
  %44 = add nsw i64 %43, -1
  %45 = getelementptr double, ptr %.unpack, i64 %44
  store <2 x double> %41, ptr %45, align 8, !tbaa !4, !alias.scope !13
  %index.next = add nuw i64 %index, 2
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !18
```
When inlining the `loop` subroutine, the code is not vectorized.
```llvm
omp.par.region6:                                  ; preds = %omp.par.region6.lr.ph, %omp.par.region6
  %14 = phi i64 [ %13, %omp.par.region6.lr.ph ], [ %27, %omp.par.region6 ]
  %15 = phi i32 [ %6, %omp.par.region6.lr.ph ], [ %26, %omp.par.region6 ]
  %16 = load i32, ptr %loadgep_, align 4, !tbaa !4
  %17 = sitofp i32 %16 to float
  %18 = fdiv contract float 1.000000e+00, %17
  %19 = fpext float %18 to double
  %.unpack = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %.unpack22 = load i64, ptr %.elt21, align 8, !tbaa !8
  %.unpack24 = load i32, ptr %.elt23, align 8, !tbaa !8
  %.unpack26 = load i8, ptr %.elt25, align 4, !tbaa !8
  %.unpack28 = load i8, ptr %.elt27, align 1, !tbaa !8
  %.unpack30 = load i8, ptr %.elt29, align 2, !tbaa !8
  %.unpack32 = load i8, ptr %.elt31, align 1, !tbaa !8
  %.unpack34.unpack.unpack = load i64, ptr %.elt33, align 8, !tbaa !8
  %.unpack34.unpack.unpack37 = load i64, ptr %.unpack34.unpack.elt36, align 8, !tbaa !8
  %.unpack34.unpack.unpack39 = load i64, ptr %.unpack34.unpack.elt38, align 8, !tbaa !8
  store ptr %.unpack, ptr %loadgep_4, align 8, !tbaa !8
  store i64 %.unpack22, ptr %loadgep_4.repack41, align 8, !tbaa !8
  store i32 %.unpack24, ptr %loadgep_4.repack43, align 8, !tbaa !8
  store i8 %.unpack26, ptr %loadgep_4.repack45, align 4, !tbaa !8
  store i8 %.unpack28, ptr %loadgep_4.repack47, align 1, !tbaa !8
  store i8 %.unpack30, ptr %loadgep_4.repack49, align 2, !tbaa !8
  store i8 %.unpack32, ptr %loadgep_4.repack51, align 1, !tbaa !8
  store i64 %.unpack34.unpack.unpack, ptr %loadgep_4.repack53, align 8, !tbaa !8
  store i64 %.unpack34.unpack.unpack37, ptr %loadgep_4.repack53.repack55, align 8, !tbaa !8
  store i64 %.unpack34.unpack.unpack39, ptr %loadgep_4.repack53.repack57, align 8, !tbaa !8
  %20 = sext i32 %15 to i64
  %21 = sub i64 %20, %.unpack34.unpack.unpack
  %22 = getelementptr double, ptr %.unpack, i64 %21
  store double %19, ptr %22, align 8, !tbaa !4
  %.unpack59 = load ptr, ptr %loadgep_2, align 8, !tbaa !8
  %.unpack61 = load i64, ptr %.elt21, align 8, !tbaa !8
  %.unpack63 = load i32, ptr %.elt23, align 8, !tbaa !8
  %.unpack65 = load i8, ptr %.elt25, align 4, !tbaa !8
  %.unpack67 = load i8, ptr %.elt27, align 1, !tbaa !8
  %.unpack69 = load i8, ptr %.elt29, align 2, !tbaa !8
  %.unpack71 = load i8, ptr %.elt31, align 1, !tbaa !8
  %.unpack73.unpack.unpack = load i64, ptr %.elt33, align 8, !tbaa !8
  %.unpack73.unpack.unpack76 = load i64, ptr %.unpack34.unpack.elt36, align 8, !tbaa !8
  %.unpack73.unpack.unpack78 = load i64, ptr %.unpack34.unpack.elt38, align 8, !tbaa !8
  store ptr %.unpack59, ptr %loadgep_6, align 8, !tbaa !8
  store i64 %.unpack61, ptr %loadgep_6.repack80, align 8, !tbaa !8
  store i32 %.unpack63, ptr %loadgep_6.repack82, align 8, !tbaa !8
  store i8 %.unpack65, ptr %loadgep_6.repack84, align 4, !tbaa !8
  store i8 %.unpack67, ptr %loadgep_6.repack86, align 1, !tbaa !8
  store i8 %.unpack69, ptr %loadgep_6.repack88, align 2, !tbaa !8
  store i8 %.unpack71, ptr %loadgep_6.repack90, align 1, !tbaa !8
  store i64 %.unpack73.unpack.unpack, ptr %loadgep_6.repack92, align 8, !tbaa !8
  store i64 %.unpack73.unpack.unpack76, ptr %loadgep_6.repack92.repack94, align 8, !tbaa !8
  store i64 %.unpack73.unpack.unpack78, ptr %loadgep_6.repack92.repack96, align 8, !tbaa !8
  %23 = sub i64 %20, %.unpack73.unpack.unpack
  %24 = getelementptr double, ptr %.unpack59, i64 %23
  %25 = load double, ptr %24, align 8, !tbaa !4
  store double %25, ptr %loadgep_8, align 8, !tbaa !4
  %26 = add i32 %15, 1
  %27 = add nsw i64 %14, -1
  %28 = icmp ugt i64 %14, 1
  br i1 %28, label %omp.par.region6, label %omp.par.region7
```
## Optimization Passes
Before the `LoopVectorizePass`, the LLVM IR for the tight loop is
```llvm
.lr.ph8.i:                                        ; preds = %.lr.ph8.i, %.lr.ph8.preheader.i
  %19 = phi i64 [ %29, %.lr.ph8.i ], [ %18, %.lr.ph8.preheader.i ]
  %20 = phi i32 [ %28, %.lr.ph8.i ], [ %6, %.lr.ph8.preheader.i ]
  %21 = load i32, ptr %12, align 4, !tbaa !4
  %22 = sitofp i32 %21 to float
  %23 = fdiv contract float 1.000000e+00, %22
  %24 = fpext float %23 to double
  %25 = sext i32 %20 to i64
  %26 = add nsw i64 %25, -1
  %27 = getelementptr double, ptr %.unpack, i64 %26
  store double %24, ptr %27, align 8, !tbaa !4
  store double %24, ptr %14, align 8, !tbaa !4
  %28 = add i32 %20, 1
  %29 = add nsw i64 %19, -1
  %30 = icmp ugt i64 %19, 1
  br i1 %30, label %.lr.ph8.i, label %_QFPloop.exit.loopexit
```
After the pass, the above code region is transformed into
```llvm
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %.cast85 = trunc i64 %index to i32
  %offset.idx = add i32 %6, %.cast85
  %36 = add i32 %offset.idx, 0
  %37 = load i32, ptr %12, align 4, !tbaa !4, !alias.scope !10, !noalias !13
  %broadcast.splatinsert = insertelement <2 x i32> poison, i32 %37, i64 0
  %broadcast.splat = shufflevector <2 x i32> %broadcast.splatinsert, <2 x i32> poison, <2 x i32> zeroinitializer
  %38 = sitofp <2 x i32> %broadcast.splat to <2 x float>
  %39 = fdiv contract <2 x float> <float 1.000000e+00, float 1.000000e+00>, %38
  %40 = fpext <2 x float> %39 to <2 x double>
  %41 = sext i32 %36 to i64
  %42 = add nsw i64 %41, -1
  %43 = getelementptr double, ptr %.unpack, i64 %42
  %44 = getelementptr double, ptr %43, i32 0
  store <2 x double> %40, ptr %44, align 8, !tbaa !4, !alias.scope !13
  %45 = extractelement <2 x double> %40, i32 1
  store double %45, ptr %14, align 8, !tbaa !4, !alias.scope !15, !noalias !17
  %index.next = add nuw i64 %index, 2
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !18
```
It is important to note that this function only undergoes one `LoopVectorizePass` pass.

### Inlined Version
`omp_subroutine` undergoes the `LoopVectorizePass` pass twice, but the pass fails to introduce vector instructions in both cases.
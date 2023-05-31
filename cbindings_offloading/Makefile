CC ?= clang
FC ?= flang-new

OMPFLAGS = -fopenmp -fopenmp-targets=amdgcn-amd-amdhsa --offload-arch=gfx90a

CFLAGS = -std=c17 -O3
FFLAGS = -O3

target: caller

offload.o: offload.f90
	$(FC) $(FFLAGS) $(OMPFLAGS) -c offload.f90 -o offload.o


liboffload.a: offload.o
	ar rcs liboffload.a offload.o

caller: caller.c liboffload.a
	$(CC) $(CFLAGS) $(OMPFLAGS)  caller.c -o caller -L/p/lustre1/rydahl1/LLVM/install/lib -L. -loffload

clean:
	rm -rf *.o *.a caller

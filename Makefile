APP ?=add_arrays

OPT ?=-O0

CC ?= clang
FC ?= flang-new

bin: bin/CC/$(APP) bin/FC/$(APP)

lib: lib/CC/$(APP).o lib/FC/$(APP).o

llvmir: ir/CC/$(APP).ll ir/FC/$(APP).ll

target: bin

CFLAGS = $(OPT) -pthread -fno-dwarf2-cfi-asm -fno-asynchronous-unwind-tables #-fopenmp #$(OPT) #std=c99 -Wall -Wextra $(OPT) -fno-pie #-fno-dwarf2-cfi-asm -fno-asynchronous-unwind-tables

FFLAGS = $(OPT) #-pie #-fno-pie

LDFLAGS = -L/p/lustre1/rydahl1/LLVM/install/lib -lpthread -lrt -pthread 

ifdef OMP
CFLAGS += -fopenmp
FFLAGS += -fopenmp
LDFLAGS += -lomp -dynamic
else
CFLAGS += -fno-pie
FFLAGS += -fno-pie
LDFLAGS += -static
endif

# Compiling source to LLVM IR
ir/CC/$(APP).ll: src/$(APP).c
	$(CC) $(CFLAGS) -emit-llvm -S src/$(APP).c -o ir/CC/$(APP).ll

ir/FC/$(APP).ll: src/$(APP).f90
	$(FC) $(FFLAGS) -emit-llvm -S src/$(APP).f90 -o ir/FC/$(APP).ll

# Compiling  LLVM IR to bitcode
bitcode/CC/$(APP).bc: ir/CC/$(APP).ll
	llvm-as ir/CC/$(APP).ll -o bitcode/CC/$(APP).bc

bitcode/FC/$(APP).bc: ir/FC/$(APP).ll
	llvm-as ir/FC/$(APP).ll -o bitcode/FC/$(APP).bc

# Compiling bitcode to object files
lib/CC/$(APP).o: bitcode/CC/$(APP).bc
	llc -filetype=obj -relocation-model=pic bitcode/CC/$(APP).bc -o lib/CC/$(APP).o

lib/FC/$(APP).o: bitcode/FC/$(APP).bc
	llc -filetype=obj -relocation-model=pic bitcode/FC/$(APP).bc -o lib/FC/$(APP).o

# Linking object files
bin/CC/$(APP): lib/CC/$(APP).o
	$(CC) $(LDFLAGS) lib/CC/$(APP).o -o bin/CC/$(APP)

bin/FC/$(APP): lib/FC/$(APP).o
	$(FC) $(LDFLAGS) lib/FC/$(APP).o -o bin/FC/$(APP)

# Dumping LLVM ir after all LLVM passes
llvmirdump:
	rm -rf ir/CC/$(APP).ll.dump ir/FC/$(APP).ll.dump
	$(CC) $(CFLAGS) -emit-llvm -mllvm -print-after-all -S src/$(APP).c -o ir/CC/$(APP).ll &> ir/CC/$(APP).ll.dump
	$(FC) $(FFLAGS) -emit-llvm -mllvm -print-after-all -S src/$(APP).f90 -o ir/FC/$(APP).ll &> ir/FC/$(APP).ll.dump

# Dumping MLIR for flang-new
mlirdump:
	rm -rf mlir/FC/$(APP).mlir mlir/FC/$(APP).mlir.dump
	$(FC) $(FFLAGS) -mmlir -mlir-print-ir-after-all -S src/$(APP).f90 -o mlir/FC/$(APP).mlir &> mlir/FC/$(APP).mlir.dump

#-static -lpthread -o bin/FC/$(APP)

# Removing files
clean:
	rm -rf ir/FC/$(APP).ll ir/CC/$(APP).ll

realclean:
	rm -rf ir/FC/* ir/CC/* bin/FC/* bin/CC/* lib/CC/* lib/FC/* bitcode/FC/* bitcode/CC/* mlir/FC/*


#clang -S -emit-llvm "./$1/test.c" -O3 -o "./$1/cbin/test_O3.ll"

#flang-new -S -emit-llvm "./$1/test.f90" -o "./$1/fbin/test.ll" 

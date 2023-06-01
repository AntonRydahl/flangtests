APP ?=add_arrays

OPT ?=-O0

CC ?= clang
FC ?= flang-new

bin: bin/CC/$(APP) bin/FC/$(APP)

lib: lib/CC/$(APP).o lib/FC/$(APP).o

llvmir: ir/CC/$(APP).ll ir/FC/$(APP).ll

CFLAGS = -fno-pie $(OPT) #std=c99 -Wall -Wextra $(OPT) -fno-pie #-fno-dwarf2-cfi-asm -fno-asynchronous-unwind-tables

FFLAGS = -fno-pie $(OPT) # -fno-pie

# Compiling source to LLVM IR
ir/CC/$(APP).ll: src/$(APP).c
	$(CC) $(CFLAGS) -emit-llvm -S  src/$(APP).c -o ir/CC/$(APP).ll

ir/FC/$(APP).ll: src/$(APP).f90
	$(FC) $(FFLAGS) -emit-llvm -S src/$(APP).f90 -o ir/FC/$(APP).ll

# Compiling  LLVM IR to bitcode
bitcode/CC/$(APP).bc: ir/CC/$(APP).ll
	llvm-as ir/CC/$(APP).ll -o bitcode/CC/$(APP).bc

bitcode/FC/$(APP).bc: ir/FC/$(APP).ll
	llvm-as ir/FC/$(APP).ll -o bitcode/FC/$(APP).bc

# Compiling bitcode to object files
lib/CC/$(APP).o: bitcode/CC/$(APP).bc
	llc -filetype=obj bitcode/CC/$(APP).bc -o lib/CC/$(APP).o

lib/FC/$(APP).o: bitcode/FC/$(APP).bc
	llc -filetype=obj bitcode/FC/$(APP).bc -o lib/FC/$(APP).o

# Linking object files
bin/CC/$(APP): lib/CC/$(APP).o
	$(CC) lib/CC/$(APP).o -static -o bin/CC/$(APP) -L/p/lustre1/rydahl1/LLVM/install/lib

bin/FC/$(APP): lib/FC/$(APP).o
	$(FC) lib/FC/$(APP).o -static -o bin/FC/$(APP) -L/p/lustre1/rydahl1/LLVM/install/lib -pthread 

#-static -lpthread -o bin/FC/$(APP)

# Removing files
clean:
	rm -rf ir/FC/$(APP).ll ir/CC/$(APP).ll

realclean:
	rm -rf ir/FC/* ir/CC/* bin/FC/* bin/CC/* lib/CC/* lib/FC/* bitcode/FC/* bitcode/CC/*


#clang -S -emit-llvm "./$1/test.c" -O3 -o "./$1/cbin/test_O3.ll"

#flang-new -S -emit-llvm "./$1/test.f90" -o "./$1/fbin/test.ll" 

APP ?=add_arrays

OPT ?=-O3

target: ir/CC/$(APP).ll ir/FC/$(APP).ll

CFLAGS = -std=c99 -Wall -Wextra -S $(OPT) -emit-llvm -fno-dwarf2-cfi-asm -fno-asynchronous-unwind-tables

FFLAGS = -S $(OPT) -Wall -Wextra -emit-llvm

ir/CC/$(APP).ll: src/$(APP).c
	$(CC) $(CFLAGS) src/$(APP).c -o ir/CC/$(APP).ll

ir/FC/$(APP).ll: src/$(APP).f90
	$(FC) $(FFLAGS) src/$(APP).f90 -o ir/FC/$(APP).ll

clean:
	rm -rf ir/FC/$(APP).ll ir/CC/$(APP).ll

realclean:
	rm -rf ir/FC/* ir/CC/*


#clang -S -emit-llvm "./$1/test.c" -O3 -o "./$1/cbin/test_O3.ll"

#flang-new -S -emit-llvm "./$1/test.f90" -o "./$1/fbin/test.ll" 

APP ?=add_arrays

target: ir/CC/$(APP).ll #ir/FC/$(APP).ll

CFLAGS = -std=c99 -march=native -v -S -emit-llvm -I/Users/rydahl1/Documents/LLVM/llvm-project/libcxx/include #/stdio.h

ir/CC/$(APP).ll: src/$(APP).c
	$(CC) $(CFLAGS) src/$(APP).c -o ir/CC/$(APP).ll

#clang -S -emit-llvm "./$1/test.c" -O3 -o "./$1/cbin/test_O3.ll"

#flang-new -S -emit-llvm "./$1/test.f90" -o "./$1/fbin/test.ll" 

mkdir "./$1/cbin"
mkdir "./$1/fbin"
mkdir "./$1/gbin"

clang -S -emit-llvm "./$1/test.c" -o "./$1/cbin/test.ll"
clang -S -emit-llvm "./$1/test.c" -O2 -o "./$1/cbin/test_O2.ll"
clang -S -emit-llvm "./$1/test.c" -O3 -o "./$1/cbin/test_O3.ll"

~/flang_install/build/bin/flang-new -fopenmp -S -emit-llvm "./$1/test.f90" -o "./$1/fbin/test.ll"
~/flang_install/build/bin/flang-new -fopenmp -S -emit-llvm "./$1/test.f90" -O2 -o "./$1/fbin/test_O2.ll"
~/flang_install/build/bin/flang-new -fopenmp -S -emit-llvm "./$1/test.f90" -O3 -o "./$1/fbin/test_O3.ll"

gfortran-10 -S "./$1/test.f90" -o "./$1/gbin/test.s"
gfortran-10 -S -O2 "./$1/test.f90" -o "./$1/gbin/test_O2.s"
gfortran-10 -S -Ofast "./$1/test.f90" -o "./$1/gbin/test_O3.s"
mkdir "./$1/bbin"

flang-new -Ofast -L ~/flang_install/install/lib "./$1/bench.f90" -o "./$1/bbin/flangtest_bin"
clang "./$1/bench.c" -O3 -o "./$1/bbin/clangtest_bin"

hyperfine --warmup 10 "./$1/bbin/flangtest_bin"
hyperfine --warmup 10 "./$1/bbin/clangtest_bin"
mkdir "./$1/bbin"

F_FILE="./$1/bench.f90"
if [ ! -e "$F_FILE" ]; then
    F_FILE="./$1/test.f90"
fi

flang-new -Ofast "$F_FILE" -o "./$1/bbin/flangtest_bin"
gfortran-10 "$F_FILE"  -Ofast -o "./$1/bbin/gforttest_bin"

#if [ $2 == "" ]

hyperfine --warmup 10 "./$1/bbin/flangtest_bin"
hyperfine --warmup 10 "./$1/bbin/gforttest_bin"

#echo Flang test
#eval "./$1/bbin/flangtest_bin"
#echo gfortran test
#eval "./$1/bbin/gforttest_bin"
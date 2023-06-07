#set -x
#module load gcc
#export PATH=/g/g92/rydahl1//LLVM/install/bin:$PATH
#export PATH=/g/g92/rydahl1//LLVM/install/lib:$PATH
#export LD_LIBRARY_PATH=/g/g92/rydahl1/LLVM/install/include:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/g/g92/rydahl1/LLVM/install/lib:$LD_LIBRARY_PATH
module load rocm
source ~/.bashrc
export FC=flang-new
export CC=clang
#export gFC=gfortran
#export gCC=gcc

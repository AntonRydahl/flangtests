Notes:
- Make sure to manually specify where the compiled runtime libraries are so the linker can actually work
- Flang's frontend doesn't make any premature stride optimizations when it comes to looping through arrays.  If you see a lot of multiplying by 1 and adding 0 in the unoptimized LLVM IR, it's because the frontend doesn't make execeptions when iterating with a step of 1.
- Something that I've noticed is that Flang doesn't seem to vectorize its operations when it seems like it could benefit from doing so.  Both clang and flang process certain operations in blocks of four, but it seems like only clang vectorizes the operations (See [fnc_add_scalar.f90](fnc_add_scalar/fbin/test_O3.ll#L28-L53) vs [fnc_add_scalar.c](fnc_add_scalar/cbin/test_O3.ll#L72)).  I'm not sure if there's a compiler flag that enables vectorization, but if not, this might be a good opportunity for optimization.
- I found that the `resize` underperforms in flang binaries compared to gfortran binaries.  It doesn't seem to be an inlining problem like I guessed earlier, but rather an issue of allocation.  In `resize_test`, `resh` allocates 3 arrays on the stack and calls malloc, whereas `resh_manual` and the C function are able to transpose the array in place.  This could be a good opportunity for optimization in cases where the size of both the original and output are known at compile time.
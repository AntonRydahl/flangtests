	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./plain_shape_test/test.f90"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	$2, %ebx
	subq	$896, %rsp
	.cfi_def_cfa_offset 928
	movl	$1, 12(%rsp)
	leaq	64(%rsp), %rbp
	leaq	12(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%r12, %rdi
	addq	$4, %rbp
	call	special_rng_@PLT
	movl	%ebx, 12(%rsp)
	addl	$1, %ebx
	movl	%eax, -4(%rbp)
	cmpl	$11, %ebx
	jne	.L2
	movl	96(%rsp), %edx
	leaq	112(%rsp), %rax
	movdqu	64(%rsp), %xmm0
	leaq	368(%rsp), %rbp
	movdqu	80(%rsp), %xmm1
	leaq	272(%rsp), %r12
	movq	%rax, 208(%rsp)
	leaq	A.7.0(%rip), %rcx
	movabsq	$1103806595072, %rax
	xorl	%r8d, %r8d
	leaq	208(%rsp), %rsi
	movl	%edx, 144(%rsp)
	movq	%rax, 232(%rsp)
	movq	%r12, %rdx
	movq	%rbp, %rdi
	movabsq	$1108101562368, %rbx
	movq	%rcx, 272(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, 296(%rsp)
	leaq	160(%rsp), %rax
	movups	%xmm0, 112(%rsp)
	movups	%xmm1, 128(%rsp)
	movq	%rax, 368(%rsp)
	movq	%rbx, 392(%rsp)
	movq	$0, 216(%rsp)
	movq	$4, 224(%rsp)
	movq	$4, 240(%rsp)
	movq	$1, 248(%rsp)
	movq	$0, 256(%rsp)
	movq	$8, 264(%rsp)
	movq	$0, 280(%rsp)
	movq	$8, 288(%rsp)
	movq	$8, 304(%rsp)
	movq	$1, 312(%rsp)
	movq	$0, 320(%rsp)
	movq	$1, 328(%rsp)
	movq	$0, 376(%rsp)
	movq	$4, 384(%rsp)
	movq	$4, 400(%rsp)
	movq	$1, 408(%rsp)
	movq	$0, 416(%rsp)
	movq	$2, 424(%rsp)
	movq	$3, 432(%rsp)
	movq	$0, 440(%rsp)
	movq	$2, 448(%rsp)
	call	_gfortran_reshape_4@PLT
	movq	368(%rsp), %rax
	movq	%rbp, %rdi
	movl	$13, 384(%rsp)
	movl	(%rax), %edx
	movl	%edx, 16(%rsp)
	movl	12(%rax), %edx
	movl	%edx, 20(%rsp)
	movl	24(%rax), %edx
	movl	%edx, 24(%rsp)
	movl	4(%rax), %edx
	movl	%edx, 28(%rsp)
	movl	16(%rax), %edx
	movl	%edx, 32(%rsp)
	movl	28(%rax), %edx
	movl	%edx, 36(%rsp)
	movl	8(%rax), %edx
	movl	%edx, 40(%rsp)
	movl	20(%rax), %edx
	movl	32(%rax), %eax
	movl	%edx, 44(%rsp)
	movl	%eax, 48(%rsp)
	leaq	.LC0(%rip), %rax
	movq	%rax, 376(%rsp)
	movabsq	$25769803904, %rax
	movq	%rax, 368(%rsp)
	call	_gfortran_st_write@PLT
	leaq	16(%rsp), %rax
	movq	%r12, %rsi
	movq	%rbp, %rdi
	xorl	%ecx, %ecx
	movl	$4, %edx
	movq	%rax, 272(%rsp)
	movq	%rbx, 296(%rsp)
	movq	$-4, 280(%rsp)
	movq	$4, 288(%rsp)
	movq	$4, 304(%rsp)
	movq	$1, 312(%rsp)
	movq	$1, 320(%rsp)
	movq	$3, 328(%rsp)
	movq	$3, 336(%rsp)
	movq	$1, 344(%rsp)
	movq	$3, 352(%rsp)
	call	_gfortran_transfer_array_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$896, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	MAIN__, .-MAIN__
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.15.1(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	A.7.0, @object
	.size	A.7.0, 16
A.7.0:
	.quad	3
	.quad	3
	.align 16
	.type	options.15.1, @object
	.size	options.15.1, 28
options.15.1:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

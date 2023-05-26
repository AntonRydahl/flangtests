	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
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
	movabsq	$1108101562368, %rbx
	subq	$896, %rsp
	.cfi_def_cfa_offset 928
	leaq	12(%rsp), %rbp
	movl	$1, 12(%rsp)
	leaq	272(%rsp), %r12
	movq	%rbp, %rdi
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$2, 12(%rsp)
	movl	%eax, 64(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$3, 12(%rsp)
	movl	%eax, 68(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$4, 12(%rsp)
	movl	%eax, 72(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$5, 12(%rsp)
	movl	%eax, 76(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$6, 12(%rsp)
	movl	%eax, 80(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$7, 12(%rsp)
	movl	%eax, 84(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$8, 12(%rsp)
	movl	%eax, 88(%rsp)
	call	special_rng_@PLT
	movq	%rbp, %rdi
	movl	$9, 12(%rsp)
	leaq	368(%rsp), %rbp
	movl	%eax, 92(%rsp)
	call	special_rng_@PLT
	movdqa	64(%rsp), %xmm2
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movdqa	.LC1(%rip), %xmm1
	movl	%eax, 96(%rsp)
	leaq	112(%rsp), %rdx
	movq	%rbp, %rdi
	movdqa	80(%rsp), %xmm3
	movdqa	.LC0(%rip), %xmm0
	movl	%eax, 144(%rsp)
	leaq	A.7.0(%rip), %rax
	movaps	%xmm1, 256(%rsp)
	movdqa	.LC2(%rip), %xmm1
	leaq	208(%rsp), %rsi
	movq	%rdx, 208(%rsp)
	movabsq	$1103806595072, %rdx
	movaps	%xmm1, 304(%rsp)
	movdqa	.LC3(%rip), %xmm1
	movq	%rax, 272(%rsp)
	leaq	160(%rsp), %rax
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm0, 240(%rsp)
	movq	%rdx, 232(%rsp)
	movq	%rdx, 296(%rsp)
	movq	%r12, %rdx
	movaps	%xmm1, 320(%rsp)
	movl	$10, 12(%rsp)
	movq	$0, 216(%rsp)
	movq	$4, 224(%rsp)
	movq	$0, 280(%rsp)
	movq	$8, 288(%rsp)
	movq	%rax, 368(%rsp)
	movdqa	.LC4(%rip), %xmm1
	movaps	%xmm0, 400(%rsp)
	movaps	%xmm1, 416(%rsp)
	movdqa	.LC5(%rip), %xmm1
	movq	%rbx, 392(%rsp)
	movaps	%xmm1, 432(%rsp)
	movq	$0, 376(%rsp)
	movq	$4, 384(%rsp)
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
	leaq	.LC6(%rip), %rax
	movq	%rax, 376(%rsp)
	movq	.LC7(%rip), %rax
	movq	%rax, 368(%rsp)
	call	_gfortran_st_write@PLT
	leaq	16(%rsp), %rax
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movdqa	.LC0(%rip), %xmm0
	xorl	%ecx, %ecx
	movl	$4, %edx
	movq	%rax, 272(%rsp)
	movq	%rbx, 296(%rsp)
	movaps	%xmm0, 304(%rsp)
	movdqa	.LC8(%rip), %xmm0
	movq	$-4, 280(%rsp)
	movaps	%xmm0, 320(%rsp)
	movdqa	.LC9(%rip), %xmm0
	movq	$4, 288(%rsp)
	movaps	%xmm0, 336(%rsp)
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	4
	.quad	1
	.align 16
.LC1:
	.quad	0
	.quad	8
	.align 16
.LC2:
	.quad	8
	.quad	1
	.align 16
.LC3:
	.quad	0
	.quad	1
	.align 16
.LC4:
	.quad	0
	.quad	2
	.align 16
.LC5:
	.quad	3
	.quad	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	128
	.long	6
	.section	.rodata.cst16
	.align 16
.LC8:
	.quad	1
	.quad	3
	.align 16
.LC9:
	.quad	3
	.quad	1
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

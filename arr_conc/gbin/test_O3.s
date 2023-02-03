	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./scratchpad/test.f90"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$656, %rsp
	.cfi_def_cfa_offset 672
	movq	16+A.0.0(%rip), %rax
	movdqa	A.0.0(%rip), %xmm1
	leaq	128(%rsp), %rbp
	movl	$7, 56(%rsp)
	movq	%rax, 144(%rsp)
	movq	%rbp, %rdi
	movq	%rax, 48(%rsp)
	leaq	.LC0(%rip), %rax
	movq	%rax, 136(%rsp)
	movq	.LC1(%rip), %rax
	movaps	%xmm1, 32(%rsp)
	movq	%rax, 128(%rsp)
	movl	$7, 152(%rsp)
	movl	$9, 144(%rsp)
	call	_gfortran_st_write@PLT
	leaq	32(%rsp), %rax
	movq	%rbp, %rdi
	xorl	%ecx, %ecx
	movq	%rax, 64(%rsp)
	leaq	64(%rsp), %rsi
	movl	$4, %edx
	movdqa	.LC2(%rip), %xmm0
	movabsq	$1103806595072, %rax
	movq	$-1, 72(%rsp)
	movaps	%xmm0, 96(%rsp)
	movdqa	.LC3(%rip), %xmm0
	movq	%rax, 88(%rsp)
	movaps	%xmm0, 112(%rsp)
	movq	$4, 80(%rsp)
	call	_gfortran_transfer_array_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$656, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbp
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
	leaq	options.8.1(%rip), %rsi
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
	.type	A.0.0, @object
	.size	A.0.0, 24
A.0.0:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.align 16
	.type	options.8.1, @object
	.size	options.8.1, 28
options.8.1:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	128
	.long	6
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.quad	4
	.quad	1
	.align 16
.LC3:
	.quad	1
	.quad	7
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

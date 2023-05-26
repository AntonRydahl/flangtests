	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./div_scalar_test/test.f90"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	movabsq	$103079215215, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$608, %rsp
	.cfi_def_cfa_offset 624
	leaq	80(%rsp), %rbp
	movq	%rax, 4(%rsp)
	leaq	.LC0(%rip), %rax
	movq	%rax, 88(%rsp)
	movq	%rbp, %rdi
	movabsq	$25769803904, %rax
	movq	%rax, 80(%rsp)
	movl	$444, 12(%rsp)
	movl	$5, 96(%rsp)
	call	_gfortran_st_write@PLT
	leaq	4(%rsp), %rax
	movq	%rbp, %rdi
	xorl	%ecx, %ecx
	movq	%rax, 16(%rsp)
	leaq	16(%rsp), %rsi
	movabsq	$1103806595072, %rax
	movl	$4, %edx
	movq	%rax, 40(%rsp)
	movq	$-1, 24(%rsp)
	movq	$4, 32(%rsp)
	movq	$4, 48(%rsp)
	movq	$1, 56(%rsp)
	movq	$1, 64(%rsp)
	movq	$3, 72(%rsp)
	call	_gfortran_transfer_array_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$608, %rsp
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
	leaq	options.4.1(%rip), %rsi
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
	.type	options.4.1, @object
	.size	options.4.1, 28
options.4.1:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

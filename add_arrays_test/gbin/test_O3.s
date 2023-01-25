	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"./add_arrays_test/test.f90"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$608, %rsp
	.cfi_def_cfa_offset 624
	movq	.LC0(%rip), %rax
	leaq	80(%rsp), %rbp
	movl	$103, 8(%rsp)
	movq	%rax, (%rsp)
	leaq	.LC1(%rip), %rax
	movq	%rbp, %rdi
	movq	%rax, 88(%rsp)
	movq	.LC2(%rip), %rax
	movl	$7, 96(%rsp)
	movq	%rax, 80(%rsp)
	call	_gfortran_st_write@PLT
	movq	%rsp, %rax
	leaq	16(%rsp), %rsi
	movq	%rbp, %rdi
	movdqa	.LC3(%rip), %xmm0
	movq	%rax, 16(%rsp)
	xorl	%ecx, %ecx
	movabsq	$1103806595072, %rax
	movl	$4, %edx
	movq	%rax, 40(%rsp)
	movaps	%xmm0, 48(%rsp)
	movdqa	.LC4(%rip), %xmm0
	movq	$-1, 24(%rsp)
	movaps	%xmm0, 64(%rsp)
	movq	$4, 32(%rsp)
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
	leaq	options.5.2(%rip), %rsi
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
	.type	options.5.2, @object
	.size	options.5.2, 28
options.5.2:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	61
	.long	82
	.align 8
.LC2:
	.long	128
	.long	6
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.quad	4
	.quad	1
	.align 16
.LC4:
	.quad	1
	.quad	3
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"test.f90"
	.text
	.section	.rodata
.LC0:
	.string	"./add_arrays_test/test.f90"
	.text
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$640, %rsp
	movq	A.0.2(%rip), %rax
	movq	%rax, -12(%rbp)
	movl	8+A.0.2(%rip), %eax
	movl	%eax, -4(%rbp)
	movq	A.1.1(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	8+A.1.1(%rip), %eax
	movl	%eax, -16(%rbp)
	movl	$1, %eax
.L3:
	cmpq	$3, %rax
	jg	.L2
	leaq	-1(%rax), %rdx
	movl	-12(%rbp,%rdx,4), %esi
	leaq	-1(%rax), %rdx
	movl	-24(%rbp,%rdx,4), %ecx
	leaq	-1(%rax), %rdx
	addl	%esi, %ecx
	movl	%ecx, -36(%rbp,%rdx,4)
	addq	$1, %rax
	jmp	.L3
.L2:
	leaq	.LC0(%rip), %rax
	movq	%rax, -568(%rbp)
	movl	$7, -560(%rbp)
	movl	$128, -576(%rbp)
	movl	$6, -572(%rbp)
	leaq	-576(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	$4, -608(%rbp)
	movq	$0, -624(%rbp)
	movq	$0, -616(%rbp)
	movq	$4, -624(%rbp)
	movb	$1, -612(%rbp)
	movb	$1, -611(%rbp)
	movq	$1, -592(%rbp)
	movq	$3, -584(%rbp)
	movq	$1, -600(%rbp)
	leaq	-36(%rbp), %rax
	movq	%rax, -640(%rbp)
	movq	$-1, -632(%rbp)
	leaq	-640(%rbp), %rsi
	leaq	-576(%rbp), %rax
	movl	$0, %ecx
	movl	$4, %edx
	movq	%rax, %rdi
	call	_gfortran_transfer_array_write@PLT
	leaq	-576(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	MAIN__, .-MAIN__
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	_gfortran_set_args@PLT
	leaq	options.5.0(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	A.0.2, @object
	.size	A.0.2, 12
A.0.2:
	.long	17
	.long	27
	.long	37
	.align 8
	.type	A.1.1, @object
	.size	A.1.1, 12
A.1.1:
	.long	44
	.long	55
	.long	66
	.align 16
	.type	options.5.0, @object
	.size	options.5.0, 28
options.5.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

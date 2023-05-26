	.file	"test.f90"
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
	movl	$1, %eax
.L3:
	cmpq	$3, %rax
	jg	.L2
	leaq	-1(%rax), %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	a.1(%rip), %rdx
	movl	(%rcx,%rdx), %ecx
	leaq	-1(%rax), %rdx
	leal	5(%rcx), %esi
	leaq	0(,%rdx,4), %rcx
	leaq	a.1(%rip), %rdx
	movl	%esi, (%rcx,%rdx)
	addq	$1, %rax
	jmp	.L3
.L2:
	nop
	popq	%rbp
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
	leaq	options.1.0(%rip), %rsi
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
	.data
	.align 8
	.type	a.1, @object
	.size	a.1, 12
a.1:
	.long	1
	.long	2
	.long	3
	.section	.rodata
	.align 16
	.type	options.1.0, @object
	.size	options.1.0, 28
options.1.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

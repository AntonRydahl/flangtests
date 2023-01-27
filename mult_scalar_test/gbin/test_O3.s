	.file	"test.f90"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.11.2(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	movl	a.1(%rip), %eax
	leal	(%rax,%rax,4), %eax
	movl	%eax, a.1(%rip)
	movl	4+a.1(%rip), %eax
	leal	(%rax,%rax,4), %eax
	movl	%eax, 4+a.1(%rip)
	movl	8+a.1(%rip), %eax
	leal	(%rax,%rax,4), %eax
	movl	%eax, 8+a.1(%rip)
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
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
	.type	options.11.2, @object
	.size	options.11.2, 28
options.11.2:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

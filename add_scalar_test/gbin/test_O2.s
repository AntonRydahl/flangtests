	.file	"test.f90"
	.text
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
	leaq	options.1.1(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	addl	$5, a.0(%rip)
	xorl	%eax, %eax
	addl	$5, 4+a.0(%rip)
	addl	$5, 8+a.0(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.data
	.align 8
	.type	a.0, @object
	.size	a.0, 12
a.0:
	.long	1
	.long	2
	.long	3
	.section	.rodata
	.align 16
	.type	options.1.1, @object
	.size	options.1.1, 28
options.1.1:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

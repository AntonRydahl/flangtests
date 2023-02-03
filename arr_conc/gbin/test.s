	.file	"test.f90"
	.text
	.section	.rodata
.LC0:
	.string	"./scratchpad/test.f90"
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
	subq	$688, %rsp
	movq	A.0.1(%rip), %rax
	movq	8+A.0.1(%rip), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	16+A.0.1(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -608(%rbp)
	movq	$0, -600(%rbp)
	movq	$4, -608(%rbp)
	movb	$1, -596(%rbp)
	movb	$1, -595(%rbp)
	movq	$1, -584(%rbp)
	movq	$0, -576(%rbp)
	movq	$6, -568(%rbp)
	movq	$4, -592(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, -624(%rbp)
	movq	$0, -616(%rbp)
	movl	$0, %eax
	movl	$1, %edx
.L3:
	cmpq	$6, %rdx
	jg	.L2
	leaq	-1(%rdx), %rsi
	movq	-624(%rbp), %rcx
	movl	-32(%rbp,%rsi,4), %esi
	movl	%esi, (%rcx,%rax,4)
	addq	$1, %rax
	addq	$1, %rdx
	jmp	.L3
.L2:
	movq	-624(%rbp), %rdx
	movl	$7, (%rdx,%rax,4)
	movl	$0, %eax
.L5:
	cmpq	$6, %rax
	jg	.L4
	movq	-624(%rbp), %rdx
	movl	(%rdx,%rax,4), %edx
	movl	%edx, -64(%rbp,%rax,4)
	addq	$1, %rax
	jmp	.L5
.L4:
	leaq	.LC0(%rip), %rax
	movq	%rax, -616(%rbp)
	movl	$9, -608(%rbp)
	movl	$128, -624(%rbp)
	movl	$6, -620(%rbp)
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	$4, -656(%rbp)
	movq	$0, -672(%rbp)
	movq	$0, -664(%rbp)
	movq	$4, -672(%rbp)
	movb	$1, -660(%rbp)
	movb	$1, -659(%rbp)
	movq	$1, -640(%rbp)
	movq	$7, -632(%rbp)
	movq	$1, -648(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, -688(%rbp)
	movq	$-1, -680(%rbp)
	leaq	-688(%rbp), %rsi
	leaq	-624(%rbp), %rax
	movl	$0, %ecx
	movl	$4, %edx
	movq	%rax, %rdi
	call	_gfortran_transfer_array_write@PLT
	leaq	-624(%rbp), %rax
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
	leaq	options.8.0(%rip), %rsi
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
	.align 16
	.type	A.0.1, @object
	.size	A.0.1, 24
A.0.1:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.align 16
	.type	options.8.0, @object
	.size	options.8.0, 28
options.8.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

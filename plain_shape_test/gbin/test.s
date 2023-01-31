	.file	"test.f90"
	.text
	.section	.rodata
.LC0:
	.string	"./plain_shape_test/test.f90"
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
	pushq	%r12
	pushq	%rbx
	subq	$960, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	$0, -816(%rbp)
	movq	$0, -808(%rbp)
	movq	$4, -816(%rbp)
	movb	$1, -804(%rbp)
	movb	$1, -803(%rbp)
	movq	$1, -792(%rbp)
	movq	$0, -784(%rbp)
	movq	$8, -776(%rbp)
	movq	$4, -800(%rbp)
	leaq	-976(%rbp), %rax
	movq	%rax, -832(%rbp)
	movq	$0, -824(%rbp)
	movl	$0, %ebx
	movl	$1, -68(%rbp)
.L3:
	movl	-68(%rbp), %eax
	cmpl	$9, %eax
	jg	.L2
	movq	-832(%rbp), %r12
	leaq	-68(%rbp), %rax
	movq	%rax, %rdi
	call	special_rng_@PLT
	movl	%eax, (%r12,%rbx,4)
	addq	$1, %rbx
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.L3
.L2:
	movq	$0, -752(%rbp)
	movq	$0, -744(%rbp)
	movq	$4, -752(%rbp)
	movb	$1, -740(%rbp)
	movb	$1, -739(%rbp)
	movq	$1, -728(%rbp)
	movq	$0, -720(%rbp)
	movq	$8, -712(%rbp)
	movq	$4, -736(%rbp)
	leaq	-928(%rbp), %rax
	movq	%rax, -768(%rbp)
	movq	$0, -760(%rbp)
	movl	$0, %eax
.L5:
	cmpq	$8, %rax
	jg	.L4
	movq	-832(%rbp), %rcx
	movq	-768(%rbp), %rdx
	movl	(%rcx,%rax,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	addq	$1, %rax
	jmp	.L5
.L4:
	leaq	-768(%rbp), %rsi
	movq	$8, -672(%rbp)
	movq	$0, -688(%rbp)
	movq	$0, -680(%rbp)
	movq	$8, -688(%rbp)
	movb	$1, -676(%rbp)
	movb	$1, -675(%rbp)
	movq	$0, -656(%rbp)
	movq	$1, -648(%rbp)
	movq	$1, -664(%rbp)
	leaq	A.7.1(%rip), %rax
	movq	%rax, -704(%rbp)
	movq	$0, -696(%rbp)
	leaq	-704(%rbp), %rdx
	movq	$0, -592(%rbp)
	movq	$0, -584(%rbp)
	movq	$4, -592(%rbp)
	movb	$2, -580(%rbp)
	movb	$1, -579(%rbp)
	movq	$1, -568(%rbp)
	movq	$0, -560(%rbp)
	movq	$2, -552(%rbp)
	movq	$3, -544(%rbp)
	movq	$0, -536(%rbp)
	movq	$2, -528(%rbp)
	movq	$4, -576(%rbp)
	leaq	-880(%rbp), %rax
	movq	%rax, -608(%rbp)
	movq	$0, -600(%rbp)
	leaq	-608(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	_gfortran_reshape_4@PLT
	movl	$0, %edx
.L9:
	cmpq	$2, %rdx
	jg	.L6
	leaq	1(%rdx), %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	-4(%rax), %r8
	movl	$0, %eax
.L8:
	cmpq	$2, %rax
	jg	.L7
	movq	-608(%rbp), %rsi
	movq	%rax, %rcx
	addq	%rcx, %rcx
	addq	%rax, %rcx
	addq	%rdx, %rcx
	leaq	1(%rax), %rdi
	addq	%r8, %rdi
	movl	(%rsi,%rcx,4), %ecx
	movl	%ecx, -64(%rbp,%rdi,4)
	addq	$1, %rax
	jmp	.L8
.L7:
	addq	$1, %rdx
	jmp	.L9
.L6:
	leaq	.LC0(%rip), %rax
	movq	%rax, -600(%rbp)
	movl	$13, -592(%rbp)
	movl	$128, -608(%rbp)
	movl	$6, -604(%rbp)
	leaq	-608(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	$4, -672(%rbp)
	movq	$0, -688(%rbp)
	movq	$0, -680(%rbp)
	movq	$4, -688(%rbp)
	movb	$2, -676(%rbp)
	movb	$1, -675(%rbp)
	movq	$1, -656(%rbp)
	movq	$3, -648(%rbp)
	movq	$1, -664(%rbp)
	movq	$1, -632(%rbp)
	movq	$3, -624(%rbp)
	movq	$3, -640(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, -704(%rbp)
	movq	$-4, -696(%rbp)
	leaq	-704(%rbp), %rsi
	leaq	-608(%rbp), %rax
	movl	$0, %ecx
	movl	$4, %edx
	movq	%rax, %rdi
	call	_gfortran_transfer_array_write@PLT
	leaq	-608(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	nop
	addq	$960, %rsp
	popq	%rbx
	popq	%r12
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
	leaq	options.15.0(%rip), %rsi
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
	.type	A.7.1, @object
	.size	A.7.1, 16
A.7.1:
	.quad	3
	.quad	3
	.align 16
	.type	options.15.0, @object
	.size	options.15.0, 28
options.15.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

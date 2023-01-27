	.file	"test.f90"
	.text
	.section	.rodata
.LC0:
	.string	"./scratchpad/test.f90"
	.align 4
.LC1:
	.long	9
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
	subq	$880, %rsp
	movq	$0, -56(%rbp)
	movl	$1, -4(%rbp)
.L11:
	cmpl	$100000, -4(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L12
	movq	$4, -560(%rbp)
	movq	$0, -576(%rbp)
	movq	$0, -568(%rbp)
	movq	$4, -576(%rbp)
	movb	$2, -564(%rbp)
	movb	$1, -563(%rbp)
	movq	$1, -544(%rbp)
	movq	$3, -536(%rbp)
	movq	$1, -552(%rbp)
	movq	$1, -520(%rbp)
	movq	$3, -512(%rbp)
	movq	$3, -528(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, -592(%rbp)
	movq	$-4, -584(%rbp)
	movq	$0, -768(%rbp)
	movq	$0, -760(%rbp)
	movq	$4, -768(%rbp)
	movb	$1, -756(%rbp)
	movb	$1, -755(%rbp)
	movq	$1, -744(%rbp)
	movq	$0, -736(%rbp)
	movq	$8, -728(%rbp)
	movq	$4, -752(%rbp)
	leaq	-880(%rbp), %rax
	movq	%rax, -784(%rbp)
	movq	$0, -776(%rbp)
	movl	$0, %edx
	movl	$1, %eax
.L4:
	cmpl	$9, %eax
	jg	.L3
	movq	-784(%rbp), %rcx
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movl	%esi, (%rcx,%rdx,4)
	addq	$1, %rdx
	addl	$1, %eax
	jmp	.L4
.L3:
	movq	$0, -704(%rbp)
	movq	$0, -696(%rbp)
	movq	$4, -704(%rbp)
	movb	$1, -692(%rbp)
	movb	$1, -691(%rbp)
	movq	$1, -680(%rbp)
	movq	$0, -672(%rbp)
	movq	$8, -664(%rbp)
	movq	$4, -688(%rbp)
	leaq	-832(%rbp), %rax
	movq	%rax, -720(%rbp)
	movq	$0, -712(%rbp)
	movl	$0, %eax
.L6:
	cmpq	$8, %rax
	jg	.L5
	movq	-784(%rbp), %rcx
	movq	-720(%rbp), %rdx
	movl	(%rcx,%rax,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	addq	$1, %rax
	jmp	.L6
.L5:
	leaq	-720(%rbp), %rsi
	movq	$8, -624(%rbp)
	movq	$0, -640(%rbp)
	movq	$0, -632(%rbp)
	movq	$8, -640(%rbp)
	movb	$1, -628(%rbp)
	movb	$1, -627(%rbp)
	movq	$0, -608(%rbp)
	movq	$1, -600(%rbp)
	movq	$1, -616(%rbp)
	leaq	A.16.2(%rip), %rax
	movq	%rax, -656(%rbp)
	movq	$0, -648(%rbp)
	leaq	-656(%rbp), %rdx
	leaq	-592(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	_gfortran_reshape_4@PLT
	movl	$-2147483648, %eax
	movl	$1, %edx
.L10:
	cmpq	$3, %rdx
	jg	.L7
	movl	$0, %esi
	movq	%rdx, %rcx
	addq	%rcx, %rcx
	addq	%rdx, %rcx
	leaq	-4(%rcx), %r8
	movl	$1, %ecx
.L9:
	cmpq	$3, %rcx
	jg	.L8
	leaq	(%rcx,%r8), %rdi
	movl	-48(%rbp,%rdi,4), %edi
	addl	%edi, %esi
	addq	$1, %rcx
	jmp	.L9
.L8:
	cmpl	%esi, %eax
	cmovl	%esi, %eax
	addq	$1, %rdx
	jmp	.L10
.L7:
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L11
.L12:
	nop
	leaq	.LC0(%rip), %rax
	movq	%rax, -584(%rbp)
	movl	$12, -576(%rbp)
	movl	$128, -592(%rbp)
	movl	$6, -588(%rbp)
	leaq	-592(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-592(%rbp), %rax
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-592(%rbp), %rax
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
.LFB2:
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
	leaq	options.23.1(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	A.16.2, @object
	.size	A.16.2, 16
A.16.2:
	.quad	3
	.quad	3
	.align 16
	.type	options.23.1, @object
	.size	options.23.1, 28
options.23.1:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

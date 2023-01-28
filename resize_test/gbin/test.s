	.file	"test.f90"
	.text
	.type	resh_manual.0, @function
resh_manual.0:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%r10, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movl	$1, %eax
.L3:
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	64(%rdx), %rdx
	movq	%rdx, %rcx
	addq	%rcx, %rcx
	addq	%rdx, %rcx
	movq	%rax, %rsi
	negq	%rsi
	subq	%rdx, %rsi
	movq	%rcx, %r8
	movl	$0, %r9d
	leaq	(%rsi,%rax), %r10
	movl	$1, %ecx
.L5:
	cmpq	$3, %rcx
	jg	.L4
	leaq	-1(%rcx), %r8
	movq	%rcx, %rdi
	imulq	%rdx, %rdi
	leaq	(%r10,%rdi), %r9
	movq	-32(%rbp), %rdi
	movl	(%rdi,%r8,4), %r8d
	movq	-8(%rbp), %rdi
	movl	%r8d, (%rdi,%r9,4)
	addq	$1, %rcx
	jmp	.L5
.L4:
	leaq	(%rax,%rax), %rcx
	leaq	(%rsi,%rcx), %r10
	movl	$1, %ecx
.L7:
	cmpq	$3, %rcx
	jg	.L6
	leaq	2(%rcx), %r8
	movq	%rcx, %rdi
	imulq	%rdx, %rdi
	leaq	(%r10,%rdi), %r9
	movq	-32(%rbp), %rdi
	movl	(%rdi,%r8,4), %r8d
	movq	-8(%rbp), %rdi
	movl	%r8d, (%rdi,%r9,4)
	addq	$1, %rcx
	jmp	.L7
.L6:
	movq	%rax, %rcx
	addq	%rcx, %rcx
	addq	%rcx, %rax
	leaq	(%rsi,%rax), %r8
	movl	$1, %eax
.L9:
	cmpq	$3, %rax
	jg	.L8
	leaq	5(%rax), %rsi
	movq	%rax, %rcx
	imulq	%rdx, %rcx
	leaq	(%r8,%rcx), %rdi
	movq	-32(%rbp), %rcx
	movl	(%rcx,%rsi,4), %esi
	movq	-8(%rbp), %rcx
	movl	%esi, (%rcx,%rdi,4)
	addq	$1, %rax
	jmp	.L9
.L8:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	resh_manual.0, .-resh_manual.0
	.section	.rodata
.LC0:
	.string	"./resize_test/test.f90"
.LC1:
	.ascii	"(I0)"
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
	subq	$704, %rsp
	movq	$0, -112(%rbp)
	leaq	-100(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	_gfortran_cpu_time_4@PLT
	movl	$1, -4(%rbp)
.L16:
	cmpl	$100000, -4(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L17
	movq	$0, -640(%rbp)
	movq	$0, -632(%rbp)
	movq	$4, -640(%rbp)
	movb	$1, -628(%rbp)
	movb	$1, -627(%rbp)
	movq	$1, -616(%rbp)
	movq	$0, -608(%rbp)
	movq	$8, -600(%rbp)
	movq	$4, -624(%rbp)
	leaq	-704(%rbp), %rax
	movq	%rax, -656(%rbp)
	movq	$0, -648(%rbp)
	movl	$0, %edx
	movl	$1, %eax
.L13:
	cmpl	$9, %eax
	jg	.L12
	movq	-656(%rbp), %rcx
	movl	-8(%rbp), %esi
	addl	%eax, %esi
	movl	%esi, (%rcx,%rdx,4)
	addq	$1, %rdx
	addl	$1, %eax
	jmp	.L13
.L12:
	movl	$0, %eax
.L15:
	cmpq	$8, %rax
	jg	.L14
	movq	-656(%rbp), %rdx
	movl	(%rdx,%rax,4), %edx
	movl	%edx, -48(%rbp,%rax,4)
	addq	$1, %rax
	jmp	.L15
.L14:
	movq	$4, -624(%rbp)
	movq	$0, -640(%rbp)
	movq	$0, -632(%rbp)
	movq	$4, -640(%rbp)
	movb	$2, -628(%rbp)
	movb	$1, -627(%rbp)
	movq	$1, -608(%rbp)
	movq	$3, -600(%rbp)
	movq	$1, -616(%rbp)
	movq	$1, -584(%rbp)
	movq	$3, -576(%rbp)
	movq	$3, -592(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, -656(%rbp)
	movq	$-4, -648(%rbp)
	leaq	-48(%rbp), %rdx
	leaq	-656(%rbp), %rax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %r10
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	resh_manual.0
	addl	$1, -4(%rbp)
	jmp	.L16
.L17:
	nop
	leaq	-104(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	_gfortran_cpu_time_4@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, -648(%rbp)
	movl	$13, -640(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -576(%rbp)
	movq	$4, -568(%rbp)
	movl	$4096, -656(%rbp)
	movl	$6, -652(%rbp)
	leaq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-96(%rbp), %rcx
	leaq	-656(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, -648(%rbp)
	movl	$14, -640(%rbp)
	movl	$128, -656(%rbp)
	movl	$6, -652(%rbp)
	leaq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movss	-104(%rbp), %xmm0
	movss	-100(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -116(%rbp)
	leaq	-116(%rbp), %rcx
	leaq	-656(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	leaq	-656(%rbp), %rax
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
.LFB3:
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
	leaq	options.24.2(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	options.24.2, @object
	.size	options.24.2, 28
options.24.2:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

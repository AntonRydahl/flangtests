	.file	"test.f90"
	.text
	.section	.rodata
.LC0:
	.string	"./mrmvrs/test.f90"
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
	subq	$720, %rsp
	leaq	-52(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	_gfortran_cpu_time_4@PLT
	movl	$1, -4(%rbp)
.L15:
	cmpl	$10000000, -4(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L16
	movq	$0, -608(%rbp)
	movq	$0, -600(%rbp)
	movq	$4, -608(%rbp)
	movb	$1, -596(%rbp)
	movb	$1, -595(%rbp)
	movq	$1, -584(%rbp)
	movq	$0, -576(%rbp)
	movq	$2, -568(%rbp)
	movq	$4, -592(%rbp)
	leaq	-68(%rbp), %rax
	movq	%rax, -624(%rbp)
	movq	$0, -616(%rbp)
	movl	$0, %edx
	movl	$1, %eax
.L4:
	cmpl	$3, %eax
	jg	.L3
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movq	-624(%rbp), %rcx
	addl	%esi, %esi
	movl	%esi, (%rcx,%rdx,4)
	addq	$1, %rdx
	addl	$1, %eax
	jmp	.L4
.L3:
	movl	$0, %eax
.L6:
	cmpq	$2, %rax
	jg	.L5
	movq	-624(%rbp), %rcx
	movq	%rax, %rdx
	addq	%rdx, %rdx
	leaq	(%rdx,%rax), %rsi
	movl	(%rcx,%rax,4), %edx
	movl	%edx, -48(%rbp,%rsi,4)
	addq	$1, %rax
	jmp	.L6
.L5:
	movq	$0, -608(%rbp)
	movq	$0, -600(%rbp)
	movq	$4, -608(%rbp)
	movb	$1, -596(%rbp)
	movb	$1, -595(%rbp)
	movq	$1, -584(%rbp)
	movq	$0, -576(%rbp)
	movq	$2, -568(%rbp)
	movq	$4, -592(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -624(%rbp)
	movq	$0, -616(%rbp)
	movl	$0, %edx
	movl	$4, %eax
.L8:
	cmpl	$6, %eax
	jg	.L7
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movq	-624(%rbp), %rcx
	addl	%esi, %esi
	movl	%esi, (%rcx,%rdx,4)
	addq	$1, %rdx
	addl	$1, %eax
	jmp	.L8
.L7:
	movl	$0, %eax
.L10:
	cmpq	$2, %rax
	jg	.L9
	movq	-624(%rbp), %rcx
	leaq	1(%rax), %rsi
	movq	%rsi, %rdx
	addq	%rdx, %rdx
	addq	%rsi, %rdx
	leaq	-2(%rdx), %rsi
	movl	(%rcx,%rax,4), %edx
	movl	%edx, -48(%rbp,%rsi,4)
	addq	$1, %rax
	jmp	.L10
.L9:
	movq	$0, -608(%rbp)
	movq	$0, -600(%rbp)
	movq	$4, -608(%rbp)
	movb	$1, -596(%rbp)
	movb	$1, -595(%rbp)
	movq	$1, -584(%rbp)
	movq	$0, -576(%rbp)
	movq	$2, -568(%rbp)
	movq	$4, -592(%rbp)
	leaq	-92(%rbp), %rax
	movq	%rax, -624(%rbp)
	movq	$0, -616(%rbp)
	movl	$0, %edx
	movl	$7, %eax
.L12:
	cmpl	$9, %eax
	jg	.L11
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movq	-624(%rbp), %rcx
	addl	%esi, %esi
	movl	%esi, (%rcx,%rdx,4)
	addq	$1, %rdx
	addl	$1, %eax
	jmp	.L12
.L11:
	movl	$0, %eax
.L14:
	cmpq	$2, %rax
	jg	.L13
	movq	-624(%rbp), %rcx
	leaq	1(%rax), %rsi
	movq	%rsi, %rdx
	addq	%rdx, %rdx
	addq	%rsi, %rdx
	leaq	-1(%rdx), %rsi
	movl	(%rcx,%rax,4), %edx
	movl	%edx, -48(%rbp,%rsi,4)
	addq	$1, %rax
	jmp	.L14
.L13:
	addl	$1, -4(%rbp)
	jmp	.L15
.L16:
	nop
	leaq	-56(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	_gfortran_cpu_time_4@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, -616(%rbp)
	movl	$19, -608(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -544(%rbp)
	movq	$4, -536(%rbp)
	movl	$4096, -624(%rbp)
	movl	$6, -620(%rbp)
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	$4, -688(%rbp)
	movq	$0, -704(%rbp)
	movq	$0, -696(%rbp)
	movq	$4, -704(%rbp)
	movb	$2, -692(%rbp)
	movb	$1, -691(%rbp)
	movq	$1, -672(%rbp)
	movq	$3, -664(%rbp)
	movq	$1, -680(%rbp)
	movq	$1, -648(%rbp)
	movq	$3, -640(%rbp)
	movq	$3, -656(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, -720(%rbp)
	movq	$-4, -712(%rbp)
	leaq	-720(%rbp), %rsi
	leaq	-624(%rbp), %rax
	movl	$0, %ecx
	movl	$4, %edx
	movq	%rax, %rdi
	call	_gfortran_transfer_array_write@PLT
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, -616(%rbp)
	movl	$20, -608(%rbp)
	movl	$128, -624(%rbp)
	movl	$6, -620(%rbp)
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movss	-56(%rbp), %xmm0
	movss	-52(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -96(%rbp)
	leaq	-96(%rbp), %rcx
	leaq	-624(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
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
	leaq	options.18.0(%rip), %rsi
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
	.type	options.18.0, @object
	.size	options.18.0, 28
options.18.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

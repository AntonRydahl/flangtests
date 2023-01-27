	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./scratchpad/test.f90"
	.section	.rodata
	.align 4
.LC1:
	.long	9
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movabsq	$1103806595072, %rbx
	subq	$840, %rsp
	.cfi_def_cfa_offset 896
	leaq	32(%rsp), %rax
	leaq	176(%rsp), %rbp
	movq	%rax, 8(%rsp)
	leaq	80(%rsp), %rax
	leaq	116(%rsp), %r14
	movq	%rax, 16(%rsp)
	leaq	128(%rsp), %rax
	leaq	240(%rsp), %r12
	movq	%rax, 24(%rsp)
	movq	%rbp, %rax
	leaq	304(%rsp), %r13
	movl	%r15d, %ebp
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L3:
	movq	8(%rsp), %rax
	movl	%ebp, %edx
	movq	$-4, 312(%rsp)
	movq	$4, 320(%rsp)
	movq	%rax, 304(%rsp)
	movabsq	$1108101562368, %rax
	movq	$4, 336(%rsp)
	movq	$1, 344(%rsp)
	movq	$1, 352(%rsp)
	movq	$3, 360(%rsp)
	movq	$3, 368(%rsp)
	movq	$1, 376(%rsp)
	movq	$3, 384(%rsp)
	movq	%rax, 328(%rsp)
	movq	16(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%edx, (%rax)
	addq	$4, %rax
	addl	%ebp, %edx
	cmpq	%rax, %r14
	jne	.L2
	movq	24(%rsp), %rax
	movdqu	80(%rsp), %xmm0
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	movdqu	96(%rsp), %xmm1
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	%rax, 176(%rsp)
	movl	112(%rsp), %eax
	addl	$1, %ebp
	movq	$0, 184(%rsp)
	movl	%eax, 160(%rsp)
	leaq	A.16.1(%rip), %rax
	movq	$4, 192(%rsp)
	movq	%rbx, 200(%rsp)
	movq	$4, 208(%rsp)
	movq	$1, 216(%rsp)
	movq	$0, 224(%rsp)
	movq	$8, 232(%rsp)
	movq	%rax, 240(%rsp)
	movq	$0, 248(%rsp)
	movq	$8, 256(%rsp)
	movq	%rbx, 264(%rsp)
	movq	$8, 272(%rsp)
	movq	$1, 280(%rsp)
	movq	$0, 288(%rsp)
	movq	$1, 296(%rsp)
	movups	%xmm0, 128(%rsp)
	movups	%xmm1, 144(%rsp)
	call	_gfortran_reshape_4@PLT
	cmpl	$100001, %ebp
	jne	.L3
	leaq	.LC0(%rip), %rax
	movq	%r13, %rdi
	movl	$12, 320(%rsp)
	movq	%rax, 312(%rsp)
	movabsq	$25769803904, %rax
	movq	%rax, 304(%rsp)
	call	_gfortran_st_write@PLT
	movq	%r13, %rdi
	movl	$4, %edx
	leaq	.LC1(%rip), %rsi
	call	_gfortran_transfer_integer_write@PLT
	movq	%r13, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$840, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
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
.LFB2:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.23.2(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	A.16.1, @object
	.size	A.16.1, 16
A.16.1:
	.quad	3
	.quad	3
	.align 16
	.type	options.23.2, @object
	.size	options.23.2, 28
options.23.2:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

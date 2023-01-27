	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"./scratchpad/test.f90"
	.section	.rodata
	.align 4
.LC8:
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
	movl	$3, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1, %r14d
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
	subq	$776, %rsp
	.cfi_def_cfa_offset 832
	movdqa	.LC0(%rip), %xmm0
	leaq	16(%rsp), %rax
	leaq	176(%rsp), %r12
	movq	%rax, 8(%rsp)
	leaq	64(%rsp), %rax
	leaq	112(%rsp), %rbp
	movq	%rax, (%rsp)
	leaq	240(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L2:
	leal	(%r14,%r14), %edx
	movq	8(%rsp), %rax
	xorl	%r8d, %r8d
	movq	%rbp, %rsi
	movl	%edx, 68(%rsp)
	leal	0(,%r14,4), %edx
	movdqa	.LC1(%rip), %xmm1
	movq	%r13, %rdi
	movl	%edx, 76(%rsp)
	addl	%r14d, %edx
	movdqa	.LC2(%rip), %xmm2
	movq	%rax, 240(%rsp)
	movdqa	.LC3(%rip), %xmm3
	movabsq	$1108101562368, %rax
	movl	%edx, 80(%rsp)
	leal	(%r15,%r15), %edx
	movq	%rax, 264(%rsp)
	movq	(%rsp), %rax
	movl	%edx, 84(%rsp)
	leal	0(,%r14,8), %edx
	movl	%edx, %ecx
	movq	%rax, 112(%rsp)
	leaq	A.16.1(%rip), %rax
	subl	%r14d, %ecx
	movl	%edx, 92(%rsp)
	addl	%r14d, %edx
	movaps	%xmm0, 272(%rsp)
	movaps	%xmm0, 144(%rsp)
	movl	%r14d, 64(%rsp)
	addl	$1, %r14d
	movl	%r15d, 72(%rsp)
	addl	$3, %r15d
	movl	%ecx, 88(%rsp)
	xorl	%ecx, %ecx
	movl	%edx, 96(%rsp)
	movq	%r12, %rdx
	movq	%rax, 176(%rsp)
	movaps	%xmm1, 288(%rsp)
	movaps	%xmm2, 304(%rsp)
	movaps	%xmm3, 160(%rsp)
	movq	$-4, 248(%rsp)
	movq	$4, 256(%rsp)
	movq	$3, 320(%rsp)
	movq	$0, 120(%rsp)
	movq	$4, 128(%rsp)
	movq	%rbx, 136(%rsp)
	movq	$0, 184(%rsp)
	movq	$8, 192(%rsp)
	movq	%rbx, 200(%rsp)
	movdqa	.LC4(%rip), %xmm4
	movdqa	.LC5(%rip), %xmm5
	movaps	%xmm4, 208(%rsp)
	movaps	%xmm5, 224(%rsp)
	call	_gfortran_reshape_4@PLT
	cmpl	$100001, %r14d
	movdqa	.LC0(%rip), %xmm0
	jne	.L2
	leaq	.LC6(%rip), %rax
	movq	%r13, %rdi
	movl	$12, 256(%rsp)
	movq	%rax, 248(%rsp)
	movq	.LC7(%rip), %rax
	movq	%rax, 240(%rsp)
	call	_gfortran_st_write@PLT
	movq	%r13, %rdi
	movl	$4, %edx
	leaq	.LC8(%rip), %rsi
	call	_gfortran_transfer_integer_write@PLT
	movq	%r13, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$776, %rsp
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	4
	.quad	1
	.align 16
.LC1:
	.quad	1
	.quad	3
	.align 16
.LC2:
	.quad	3
	.quad	1
	.align 16
.LC3:
	.quad	0
	.quad	8
	.align 16
.LC4:
	.quad	8
	.quad	1
	.align 16
.LC5:
	.quad	0
	.quad	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	128
	.long	6
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

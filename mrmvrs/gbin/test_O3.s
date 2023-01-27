	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"./mrmvrs/test.f90"
.LC3:
	.string	"(I0)"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$688, %rsp
	.cfi_def_cfa_offset 720
	leaq	8(%rsp), %rdi
	call	_gfortran_cpu_time_4@PLT
	movl	$18, %edx
	movl	$1, %eax
	movdqa	.LC0(%rip), %xmm5
	movdqa	.LC1(%rip), %xmm4
	movdqa	%xmm5, %xmm7
	movdqa	%xmm4, %xmm6
	psrlq	$32, %xmm7
	psrlq	$32, %xmm6
	.p2align 4,,10
	.p2align 3
.L2:
	movd	%eax, %xmm3
	addl	$1, %eax
	movl	%edx, 48(%rsp)
	addl	$18, %edx
	pshufd	$0, %xmm3, %xmm0
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm2
	psrlq	$32, %xmm1
	pmuludq	%xmm5, %xmm2
	movdqa	%xmm1, %xmm3
	pmuludq	%xmm4, %xmm0
	pmuludq	%xmm7, %xmm3
	pmuludq	%xmm6, %xmm1
	pshufd	$8, %xmm2, %xmm2
	pshufd	$8, %xmm0, %xmm0
	pshufd	$8, %xmm3, %xmm3
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm3, %xmm2
	punpckldq	%xmm1, %xmm0
	movaps	%xmm2, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	cmpl	$10000001, %eax
	jne	.L2
	leaq	12(%rsp), %rdi
	xorl	%eax, %eax
	leaq	160(%rsp), %rbp
	call	_gfortran_cpu_time_4@PLT
	leaq	.LC3(%rip), %rax
	movq	%rbp, %rdi
	leaq	.LC2(%rip), %rbx
	movq	%rax, 240(%rsp)
	movq	.LC4(%rip), %rax
	leaq	64(%rsp), %r12
	movq	%rbx, 168(%rsp)
	movq	%rax, 160(%rsp)
	movl	$19, 176(%rsp)
	movq	$4, 248(%rsp)
	call	_gfortran_st_write@PLT
	leaq	16(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%r12, %rsi
	movdqa	.LC5(%rip), %xmm0
	movl	$4, %edx
	movq	%rax, 64(%rsp)
	movq	%rbp, %rdi
	movabsq	$1108101562368, %rax
	movq	$-4, 72(%rsp)
	movaps	%xmm0, 96(%rsp)
	movdqa	.LC6(%rip), %xmm0
	movq	%rax, 88(%rsp)
	movaps	%xmm0, 112(%rsp)
	movdqa	.LC7(%rip), %xmm0
	movq	$4, 80(%rsp)
	movaps	%xmm0, 128(%rsp)
	movq	$3, 144(%rsp)
	call	_gfortran_transfer_array_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	movq	.LC8(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbx, 168(%rsp)
	movl	$20, 176(%rsp)
	movq	%rax, 160(%rsp)
	call	_gfortran_st_write@PLT
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$4, %edx
	movss	12(%rsp), %xmm0
	subss	8(%rsp), %xmm0
	movss	%xmm0, 64(%rsp)
	call	_gfortran_transfer_real_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$688, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
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
.LFB1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.18.0(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	2
	.long	8
	.long	14
	.long	4
	.align 16
.LC1:
	.long	10
	.long	16
	.long	6
	.long	12
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	4096
	.long	6
	.section	.rodata.cst16
	.align 16
.LC5:
	.quad	4
	.quad	1
	.align 16
.LC6:
	.quad	1
	.quad	3
	.align 16
.LC7:
	.quad	3
	.quad	1
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	128
	.long	6
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

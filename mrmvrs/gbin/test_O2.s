	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./mrmvrs/test.f90"
.LC1:
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
	movl	$14, %esi
	movl	$6, %ecx
	movl	$2, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	leal	(%rax,%rax), %edx
	movl	%eax, 16(%rsp)
	movl	%edx, 28(%rsp)
	leal	0(,%rax,4), %edx
	movl	%edx, 20(%rsp)
	addl	%eax, %edx
	movl	%edx, 32(%rsp)
	leal	(%rcx,%rcx), %edx
	movl	%edx, 44(%rsp)
	leal	0(,%rax,8), %edx
	movl	%edx, 36(%rsp)
	addl	%eax, %edx
	addl	$2, %eax
	movl	%ecx, 40(%rsp)
	addl	$6, %ecx
	movl	%esi, 24(%rsp)
	addl	$14, %esi
	movl	%edx, 48(%rsp)
	cmpl	$20000002, %eax
	jne	.L2
	leaq	12(%rsp), %rdi
	xorl	%eax, %eax
	leaq	160(%rsp), %rbp
	call	_gfortran_cpu_time_4@PLT
	leaq	.LC1(%rip), %rax
	movq	%rbp, %rdi
	leaq	.LC0(%rip), %rbx
	movq	%rax, 240(%rsp)
	leaq	64(%rsp), %r12
	movabsq	$25769807872, %rax
	movq	%rbx, 168(%rsp)
	movq	%rax, 160(%rsp)
	movl	$19, 176(%rsp)
	movq	$4, 248(%rsp)
	call	_gfortran_st_write@PLT
	leaq	16(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%r12, %rsi
	movl	$4, %edx
	movq	%rax, 64(%rsp)
	movq	%rbp, %rdi
	movabsq	$1108101562368, %rax
	movq	%rax, 88(%rsp)
	movq	$-4, 72(%rsp)
	movq	$4, 80(%rsp)
	movq	$4, 96(%rsp)
	movq	$1, 104(%rsp)
	movq	$1, 112(%rsp)
	movq	$3, 120(%rsp)
	movq	$3, 128(%rsp)
	movq	$1, 136(%rsp)
	movq	$3, 144(%rsp)
	call	_gfortran_transfer_array_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	movq	%rbp, %rdi
	movq	%rbx, 168(%rsp)
	movabsq	$25769803904, %rax
	movq	%rax, 160(%rsp)
	movl	$20, 176(%rsp)
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
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

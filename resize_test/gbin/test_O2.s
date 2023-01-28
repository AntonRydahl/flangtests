	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./resize_test/test.f90"
.LC1:
	.string	"(I0)"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$648, %rsp
	.cfi_def_cfa_offset 672
	leaq	4(%rsp), %rdi
	leaq	112(%rsp), %rbp
	call	_gfortran_cpu_time_4@PLT
	movl	$100000, %esi
	movl	$1, %edi
	leaq	148(%rsp), %rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%edi, %edx
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%edx, (%rax)
	addq	$4, %rax
	addl	$1, %edx
	cmpq	%rcx, %rax
	jne	.L2
	movl	128(%rsp), %eax
	movl	112(%rsp), %edx
	movdqu	128(%rsp), %xmm2
	movdqu	112(%rsp), %xmm1
	movl	%eax, 80(%rsp)
	movups	%xmm2, 32(%rsp)
	movl	36(%rsp), %eax
	movups	%xmm1, 16(%rsp)
	movl	%edx, 64(%rsp)
	movl	20(%rsp), %edx
	movl	%eax, 92(%rsp)
	movl	40(%rsp), %eax
	movl	%edx, 76(%rsp)
	movl	24(%rsp), %edx
	movl	%eax, 72(%rsp)
	movl	44(%rsp), %eax
	movl	%edx, 88(%rsp)
	movl	28(%rsp), %edx
	movl	%eax, 84(%rsp)
	movl	144(%rsp), %eax
	movl	%edx, 68(%rsp)
	movl	%eax, 96(%rsp)
	subl	$1, %esi
	jne	.L3
	leaq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rbx
	call	_gfortran_cpu_time_4@PLT
	leaq	.LC1(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbx, 120(%rsp)
	movq	%rax, 192(%rsp)
	movabsq	$25769807872, %rax
	movq	%rax, 112(%rsp)
	movl	$13, 128(%rsp)
	movq	$4, 200(%rsp)
	call	_gfortran_st_write@PLT
	leaq	64(%rsp), %rsi
	movl	$4, %edx
	movq	%rbp, %rdi
	call	_gfortran_transfer_integer_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	movq	%rbp, %rdi
	movq	%rbx, 120(%rsp)
	movabsq	$25769803904, %rax
	movq	%rax, 112(%rsp)
	movl	$14, 128(%rsp)
	call	_gfortran_st_write@PLT
	movss	8(%rsp), %xmm0
	subss	4(%rsp), %xmm0
	leaq	12(%rsp), %rsi
	movq	%rbp, %rdi
	movl	$4, %edx
	movss	%xmm0, 12(%rsp)
	call	_gfortran_transfer_real_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$648, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
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
.LFB3:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.24.2(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
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

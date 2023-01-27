	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"./resize_test/test.f90"
.LC3:
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
	subq	$600, %rsp
	.cfi_def_cfa_offset 624
	leaq	4(%rsp), %rdi
	call	_gfortran_cpu_time_4@PLT
	xorl	%edx, %edx
	movl	$100000, %eax
	movdqa	.LC0(%rip), %xmm1
	movd	%edx, %xmm2
	addl	$9, %edx
	pshufd	$0, %xmm2, %xmm0
	paddd	%xmm0, %xmm1
	paddd	.LC1(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%edx, 48(%rsp)
	movaps	%xmm1, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	subl	$1, %eax
	jne	.L2
	leaq	8(%rsp), %rdi
	xorl	%eax, %eax
	leaq	64(%rsp), %rbp
	call	_gfortran_cpu_time_4@PLT
	leaq	.LC3(%rip), %rax
	movq	%rbp, %rdi
	leaq	.LC2(%rip), %rbx
	movq	%rax, 144(%rsp)
	movq	.LC4(%rip), %rax
	movq	%rbx, 72(%rsp)
	movq	%rax, 64(%rsp)
	movl	$13, 80(%rsp)
	movq	$4, 152(%rsp)
	call	_gfortran_st_write@PLT
	leaq	16(%rsp), %rsi
	movl	$4, %edx
	movq	%rbp, %rdi
	call	_gfortran_transfer_integer_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	movq	.LC5(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbx, 72(%rsp)
	movl	$14, 80(%rsp)
	movq	%rax, 64(%rsp)
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
	addq	$600, %rsp
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
.LFB2:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.16.1(%rip), %rsi
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
	.type	options.16.1, @object
	.size	options.16.1, 28
options.16.1:
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
	.long	1
	.long	4
	.long	7
	.long	2
	.align 16
.LC1:
	.long	5
	.long	8
	.long	3
	.long	6
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	4096
	.long	6
	.align 8
.LC5:
	.long	128
	.long	6
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

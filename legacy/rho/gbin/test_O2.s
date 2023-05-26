	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC14:
	.string	"./rho/test.f90"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB1:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$584, %rsp
	.cfi_def_cfa_offset 624
	leaq	24(%rsp), %rdi
	call	_gfortran_cpu_time_8@PLT
	movl	$720000, %edx
	xorl	%esi, %esi
	leaq	phiprime.2(%rip), %rdi
	call	memset@PLT
	xorl	%esi, %esi
	movl	$720000, %edx
	leaq	phi.1(%rip), %rdi
	call	memset@PLT
	movsd	.LC5(%rip), %xmm5
	movsd	.LC6(%rip), %xmm3
	leaq	rhoarr.0(%rip), %rsi
	movsd	.LC8(%rip), %xmm4
	movsd	.LC7(%rip), %xmm6
	pxor	%xmm7, %xmm7
	movl	$1, %ecx
	movsd	.LC9(%rip), %xmm8
	movsd	.LC2(%rip), %xmm10
	movsd	.LC0(%rip), %xmm9
.L12:
	pxor	%xmm1, %xmm1
	movq	%rsi, %rdx
	movl	$1, %eax
	cvtsi2sdl	%ecx, %xmm1
	mulsd	%xmm5, %xmm1
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L65:
	comisd	%xmm1, %xmm8
	jbe	.L58
	comisd	%xmm4, %xmm0
	jbe	.L58
	cmpltsd	%xmm8, %xmm0
	movapd	%xmm0, %xmm2
	andpd	%xmm10, %xmm2
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %eax
	movsd	%xmm2, (%rdx)
	addq	$2400, %rdx
	cmpl	$301, %eax
	je	.L64
.L11:
	pxor	%xmm0, %xmm0
	comisd	%xmm3, %xmm1
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm5, %xmm0
	jbe	.L2
	comisd	%xmm1, %xmm6
	jbe	.L2
	comisd	%xmm3, %xmm0
	jbe	.L2
	comisd	%xmm0, %xmm6
	movapd	%xmm9, %xmm2
	ja	.L6
	.p2align 4,,10
	.p2align 3
.L2:
	comisd	%xmm4, %xmm1
	ja	.L65
.L58:
	movapd	%xmm7, %xmm2
	jmp	.L6
.L64:
	addq	$1, %rcx
	addq	$8, %rsi
	cmpq	$301, %rcx
	jne	.L12
	leaq	720000+phiprime.2(%rip), %rbp
	movsd	.LC10(%rip), %xmm6
	movsd	.LC11(%rip), %xmm5
	movl	$1, %r12d
	movq	.LC12(%rip), %xmm4
	movapd	%xmm7, %xmm3
	movapd	%xmm7, %xmm2
	movapd	%xmm7, %xmm0
	movapd	%xmm7, %xmm8
	movapd	%xmm7, %xmm1
	leaq	phi.1(%rip), %rbx
	leaq	-720000(%rbp), %r13
.L30:
	movl	%r12d, 20(%rsp)
	leaq	2408+phi.1(%rip), %rdi
	leaq	16+rhoarr.0(%rip), %rsi
	movl	$2, %r8d
	leaq	16+phiprime.2(%rip), %rcx
.L17:
	leaq	1(%r8), %r9
	movq	%rdi, %rax
	xorl	%edx, %edx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L66:
	movsd	2408(%rax), %xmm0
	movsd	(%rax), %xmm8
	addq	$2400, %rax
	movsd	-8(%rax), %xmm2
	movsd	2400(%rax), %xmm3
.L14:
	addsd	%xmm2, %xmm0
	movsd	2392(%rsi,%rdx), %xmm2
	mulsd	%xmm5, %xmm2
	addsd	%xmm3, %xmm0
	addsd	%xmm8, %xmm0
	mulsd	%xmm6, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 2392(%rcx,%rdx)
	addq	$2400, %rdx
	cmpq	$715200, %rdx
	jne	.L66
	addq	$8, %rsi
	addq	$8, %rcx
	cmpq	$299, %r8
	je	.L67
	movsd	16(%rdi), %xmm0
	movsd	(%rdi), %xmm2
	movq	%r9, %r8
	addq	$8, %rdi
	movsd	2400(%rdi), %xmm3
	movsd	-2400(%rdi), %xmm8
	jmp	.L17
.L67:
	movq	.LC3(%rip), %rax
	leaq	2400+phiprime.2(%rip), %rdx
	movapd	%xmm7, %xmm0
	xorl	%esi, %esi
	leaq	2400+phi.1(%rip), %rcx
	movq	$-1, %rdi
	movq	%rax, %xmm2
.L16:
	movl	$1, %eax
	movapd	%xmm2, %xmm3
	testl	%esi, %esi
	jne	.L19
	.p2align 4,,10
	.p2align 3
.L18:
	subsd	%xmm1, %xmm0
	addq	$1, %rax
	movapd	%xmm0, %xmm3
	andpd	%xmm4, %xmm3
	comisd	%xmm2, %xmm3
	jb	.L59
	cmpq	$301, %rax
	je	.L39
	leaq	(%rdi,%rax), %rsi
	movsd	0(%r13,%rsi,8), %xmm0
	movsd	(%rbx,%rsi,8), %xmm1
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L68:
	cmpq	$301, %rax
	je	.L39
.L22:
	movsd	-2408(%rdx,%rax,8), %xmm0
	movsd	-2408(%rcx,%rax,8), %xmm1
.L19:
	subsd	%xmm1, %xmm0
	addq	$1, %rax
	movapd	%xmm0, %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm3, %xmm2
	jbe	.L68
	cmpq	$301, %rax
	je	.L62
	movapd	%xmm2, %xmm3
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L59:
	cmpq	$301, %rax
	je	.L21
	movsd	-2408(%rdx,%rax,8), %xmm0
	movsd	-2408(%rcx,%rax,8), %xmm1
	jmp	.L18
.L39:
	movapd	%xmm3, %xmm2
.L62:
	movl	$1, %esi
.L21:
	addq	$300, %rdi
	cmpq	%rdx, %rbp
	je	.L26
	movsd	(%rdx), %xmm0
	movsd	(%rcx), %xmm1
	addq	$2400, %rdx
	addq	$2400, %rcx
	jmp	.L16
.L26:
	testl	%esi, %esi
	jne	.L27
	movq	.LC4(%rip), %rax
	movq	%rax, %xmm2
.L27:
	movl	$720000, %edx
	movq	%r13, %rsi
	movsd	%xmm2, 8(%rsp)
	leaq	phi.1(%rip), %rdi
	call	memcpy@PLT
	addl	$1, %r12d
	movsd	8(%rsp), %xmm2
	comisd	.LC13(%rip), %xmm2
	jbe	.L60
	movq	.LC10(%rip), %rax
	movsd	(%rbx), %xmm1
	pxor	%xmm7, %xmm7
	movsd	2416+phi.1(%rip), %xmm0
	movsd	2400+phi.1(%rip), %xmm2
	movq	%rax, %xmm6
	movq	.LC11(%rip), %rax
	movsd	4808+phi.1(%rip), %xmm3
	movsd	8+phi.1(%rip), %xmm8
	movq	.LC12(%rip), %xmm4
	movq	%rax, %xmm5
	jmp	.L30
.L60:
	leaq	32(%rsp), %rdi
	xorl	%eax, %eax
	leaq	48(%rsp), %rbp
	call	_gfortran_cpu_time_8@PLT
	leaq	.LC14(%rip), %rax
	movq	%rbp, %rdi
	movl	$56, 64(%rsp)
	movq	%rax, 56(%rsp)
	movabsq	$25769803904, %rax
	movq	%rax, 48(%rsp)
	call	_gfortran_st_write@PLT
	movsd	32(%rsp), %xmm0
	subsd	24(%rsp), %xmm0
	leaq	40(%rsp), %rsi
	movq	%rbp, %rdi
	movl	$8, %edx
	movsd	%xmm0, 40(%rsp)
	call	_gfortran_transfer_real_write@PLT
	leaq	20(%rsp), %rsi
	movq	%rbp, %rdi
	movl	$4, %edx
	call	_gfortran_transfer_integer_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$584, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	MAIN__, .-MAIN__
	.p2align 4
	.globl	__rhofunc_MOD_rho
	.type	__rhofunc_MOD_rho, @function
__rhofunc_MOD_rho:
.LFB0:
	.cfi_startproc
	movsd	(%rdi), %xmm0
	movsd	.LC6(%rip), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L70
	movsd	.LC7(%rip), %xmm2
	comisd	%xmm0, %xmm2
	jbe	.L70
	movsd	(%rsi), %xmm3
	comisd	%xmm1, %xmm3
	jbe	.L70
	comisd	%xmm3, %xmm2
	movsd	.LC0(%rip), %xmm1
	ja	.L69
	.p2align 4,,10
	.p2align 3
.L70:
	movsd	.LC8(%rip), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L94
	movsd	.LC9(%rip), %xmm2
	comisd	%xmm0, %xmm2
	jbe	.L94
	movsd	(%rsi), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L95
	.p2align 4,,10
	.p2align 3
.L94:
	pxor	%xmm1, %xmm1
.L69:
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L95:
	comisd	%xmm0, %xmm2
	movsd	.LC2(%rip), %xmm1
	ja	.L69
	jmp	.L94
	.cfi_endproc
.LFE0:
	.size	__rhofunc_MOD_rho, .-__rhofunc_MOD_rho
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
	leaq	options.5.3(%rip), %rsi
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
	.local	rhoarr.0
	.comm	rhoarr.0,720000,32
	.local	phi.1
	.comm	phi.1,720000,32
	.local	phiprime.2
	.comm	phiprime.2,720000,32
	.section	.rodata
	.align 16
	.type	options.5.3, @object
	.size	options.5.3, 28
options.5.3:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	-1074790400
	.align 8
.LC3:
	.long	0
	.long	-1048576
	.align 8
.LC4:
	.long	0
	.long	2146959360
	.align 8
.LC5:
	.long	1202590843
	.long	1065646817
	.align 8
.LC6:
	.long	858993459
	.long	1071854387
	.align 8
.LC7:
	.long	-1717986918
	.long	1072273817
	.align 8
.LC8:
	.long	-1717986918
	.long	1070176665
	.align 8
.LC9:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC10:
	.long	0
	.long	1070596096
	.align 8
.LC11:
	.long	1625778581
	.long	1095077197
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC13:
	.long	-1598689907
	.long	1051772663
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

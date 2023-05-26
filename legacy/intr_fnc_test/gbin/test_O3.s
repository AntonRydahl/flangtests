	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_max_sum_3x3
	.type	__test_MOD_max_sum_3x3, @function
__test_MOD_max_sum_3x3:
.LFB0:
	.cfi_startproc
	movl	4(%rdi), %eax
	addl	(%rdi), %eax
	addl	8(%rdi), %eax
	movl	%eax, %edx
	movl	16(%rdi), %eax
	addl	12(%rdi), %eax
	addl	20(%rdi), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	28(%rdi), %edx
	addl	24(%rdi), %edx
	addl	32(%rdi), %edx
	cmpl	%edx, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_max_sum_3x3, .-__test_MOD_max_sum_3x3
	.p2align 4
	.globl	__test_MOD_max_sum_open
	.type	__test_MOD_max_sum_open, @function
__test_MOD_max_sum_open:
.LFB1:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rax
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
	movq	40(%rdi), %r10
	testq	%r10, %r10
	je	.L4
	movq	(%rdi), %r11
	movq	%r10, %rsi
	movq	56(%rdi), %rdi
	subq	48(%rax), %rdi
	movq	64(%rax), %r14
	negq	%rsi
	movq	80(%rax), %r12
	leaq	1(%rdi), %rbx
	subq	72(%rax), %r12
	js	.L21
	cmpq	$1, %r10
	je	.L6
	salq	$2, %r10
	xorl	%ebp, %ebp
	movl	$-2147483648, %r9d
	addq	%r10, %r11
	testq	%rbx, %rbx
	jle	.L17
	.p2align 4,,10
	.p2align 3
.L29:
	leaq	(%r11,%rsi,4), %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rax, %r8
	addl	(%rdx), %ecx
	addq	$1, %rax
	addq	%r10, %rdx
	cmpq	%rdi, %r8
	jne	.L8
.L7:
	cmpl	%ecx, %r9d
	leaq	1(%rbp), %rax
	cmovl	%ecx, %r9d
	addq	%r14, %rsi
	cmpq	%r12, %rbp
	je	.L3
	movq	%rax, %rbp
	testq	%rbx, %rbx
	jg	.L29
.L17:
	xorl	%ecx, %ecx
	jmp	.L7
.L4:
	movq	(%rdi), %r11
	movq	56(%rdi), %rdi
	subq	48(%rax), %rdi
	movq	64(%rax), %r14
	movq	80(%rax), %r12
	leaq	1(%rdi), %rbx
	subq	72(%rax), %r12
	js	.L21
	movq	$-1, %rsi
.L6:
	movq	%rbx, %rax
	movq	%rbx, %r8
	leaq	4(%r11,%rsi,4), %rdx
	xorl	%r10d, %r10d
	andq	$-4, %rax
	shrq	$2, %r8
	leaq	0(,%r14,4), %r15
	movl	$-2147483648, %r9d
	movq	%rax, -24(%rsp)
	addq	$1, %rax
	movq	%rax, -16(%rsp)
	testq	%rbx, %rbx
	jle	.L19
	.p2align 4,,10
	.p2align 3
.L30:
	cmpq	$3, %rdi
	jbe	.L20
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rax, %rcx
	addq	$1, %rax
	salq	$4, %rcx
	movdqu	(%rdx,%rcx), %xmm1
	paddd	%xmm1, %xmm0
	cmpq	%rax, %r8
	jne	.L12
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	-24(%rsp), %rbx
	je	.L10
	movq	-16(%rsp), %rcx
.L11:
	leaq	(%rsi,%rcx), %rbp
	addl	(%r11,%rbp,4), %eax
	leaq	1(%rcx), %rbp
	cmpq	%rcx, %rdi
	jl	.L10
	leaq	(%rsi,%rbp), %r13
	addl	(%r11,%r13,4), %eax
	leaq	2(%rcx), %r13
	cmpq	%rbp, %rdi
	jl	.L10
	leaq	(%rsi,%r13), %rbp
	addq	$3, %rcx
	addl	(%r11,%rbp,4), %eax
	cmpq	%r13, %rdi
	jl	.L10
	addq	%rsi, %rcx
	addl	(%r11,%rcx,4), %eax
.L10:
	cmpl	%eax, %r9d
	cmovl	%eax, %r9d
	leaq	1(%r10), %rax
	addq	%r14, %rsi
	addq	%r15, %rdx
	cmpq	%r12, %r10
	je	.L3
	movq	%rax, %r10
	testq	%rbx, %rbx
	jg	.L30
.L19:
	xorl	%eax, %eax
	jmp	.L10
.L21:
	movl	$-2147483648, %r9d
.L3:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%r9d, %eax
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
.L20:
	.cfi_restore_state
	movl	$1, %ecx
	xorl	%eax, %eax
	jmp	.L11
	.cfi_endproc
.LFE1:
	.size	__test_MOD_max_sum_open, .-__test_MOD_max_sum_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

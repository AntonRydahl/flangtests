	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_mval_closed
	.type	__test_MOD_mval_closed, @function
__test_MOD_mval_closed:
.LFB0:
	.cfi_startproc
	movl	4(%rdi), %eax
	movl	8(%rdi), %edx
	cmpl	%eax, (%rdi)
	cmovge	(%rdi), %eax
	cmpl	%edx, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_mval_closed, .-__test_MOD_mval_closed
	.p2align 4
	.globl	__test_MOD_mval_open
	.type	__test_MOD_mval_open, @function
__test_MOD_mval_open:
.LFB1:
	.cfi_startproc
	movq	40(%rdi), %rsi
	movl	$1, %eax
	movq	%rdi, %rdx
	testq	%rsi, %rsi
	cmove	%rax, %rsi
	movq	(%rdi), %rax
	movq	56(%rdi), %rdi
	subq	48(%rdx), %rdi
	js	.L7
	salq	$2, %rsi
	xorl	%edx, %edx
	movl	$-2147483648, %r8d
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rax), %ecx
	cmpl	%ecx, %r8d
	cmovl	%ecx, %r8d
	movq	%rdx, %rcx
	addq	%rsi, %rax
	addq	$1, %rdx
	cmpq	%rdi, %rcx
	jne	.L6
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$-2147483648, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	__test_MOD_mval_open, .-__test_MOD_mval_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

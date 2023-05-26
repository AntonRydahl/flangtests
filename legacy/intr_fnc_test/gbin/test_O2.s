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
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	40(%rdi), %r8
	testq	%r8, %r8
	je	.L9
	movq	%r8, %r10
	negq	%r10
.L4:
	movq	56(%rax), %rdi
	movq	(%rax), %r12
	movq	64(%rax), %rbp
	movq	80(%rax), %rbx
	subq	48(%rax), %rdi
	subq	72(%rax), %rbx
	js	.L10
	salq	$2, %r8
	xorl	%r11d, %r11d
	movl	$-2147483648, %r9d
	addq	%r8, %r12
	testq	%rdi, %rdi
	js	.L11
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	(%r12,%r10,4), %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rax, %rsi
	addl	(%rdx), %ecx
	addq	$1, %rax
	addq	%r8, %rdx
	cmpq	%rdi, %rsi
	jne	.L7
.L6:
	cmpl	%ecx, %r9d
	leaq	1(%r11), %rax
	cmovl	%ecx, %r9d
	addq	%rbp, %r10
	cmpq	%rbx, %r11
	je	.L3
	movq	%rax, %r11
	testq	%rdi, %rdi
	jns	.L15
.L11:
	xorl	%ecx, %ecx
	jmp	.L6
.L10:
	movl	$-2147483648, %r9d
.L3:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r9d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	movq	$-1, %r10
	movl	$1, %r8d
	jmp	.L4
	.cfi_endproc
.LFE1:
	.size	__test_MOD_max_sum_open, .-__test_MOD_max_sum_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

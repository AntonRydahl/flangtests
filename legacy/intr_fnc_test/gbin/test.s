	.file	"test.f90"
	.text
	.globl	__test_MOD_max_sum_3x3
	.type	__test_MOD_max_sum_3x3, @function
__test_MOD_max_sum_3x3:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$-2147483648, %eax
	movl	$1, %edx
.L5:
	cmpq	$3, %rdx
	jg	.L2
	movl	$0, %esi
	movq	%rdx, %rcx
	addq	%rcx, %rcx
	addq	%rdx, %rcx
	leaq	-4(%rcx), %r9
	movl	$1, %ecx
.L4:
	cmpq	$3, %rcx
	jg	.L3
	leaq	(%rcx,%r9), %r8
	movq	-24(%rbp), %rdi
	movl	(%rdi,%r8,4), %edi
	addl	%edi, %esi
	addq	$1, %rcx
	jmp	.L4
.L3:
	cmpl	%esi, %eax
	cmovl	%esi, %eax
	addq	$1, %rdx
	jmp	.L5
.L2:
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_max_sum_3x3, .-__test_MOD_max_sum_3x3
	.globl	__test_MOD_max_sum_open
	.type	__test_MOD_max_sum_open, @function
__test_MOD_max_sum_open:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	40(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L9
	movl	$1, %edx
.L9:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movq	56(%rax), %rcx
	movq	-72(%rbp), %rax
	movq	48(%rax), %rsi
	movq	%rcx, %rax
	subq	%rsi, %rax
	addq	$1, %rax
	movq	%rax, -48(%rbp)
	movq	-72(%rbp), %rax
	movq	64(%rax), %rdi
	movq	-72(%rbp), %rax
	movq	80(%rax), %rcx
	movq	-72(%rbp), %rax
	movq	72(%rax), %rsi
	movq	%rcx, %rax
	subq	%rsi, %rax
	addq	$1, %rax
	movq	%rax, -56(%rbp)
	movq	%rdi, %rax
	imulq	-56(%rbp), %rax
	movq	%rdx, %rcx
	negq	%rcx
	subq	%rdi, %rcx
	movq	%rcx, %r12
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$-2147483648, %eax
	movq	-56(%rbp), %r10
	movq	-48(%rbp), %r11
	movl	$1, %ecx
.L13:
	cmpq	%r10, %rcx
	jg	.L10
	movl	$0, %r8d
	movq	%rcx, %rsi
	imulq	%rdi, %rsi
	leaq	(%r12,%rsi), %r13
	movl	$1, %esi
.L12:
	cmpq	%r11, %rsi
	jg	.L11
	movq	%rsi, %r9
	imulq	%rdx, %r9
	leaq	0(%r13,%r9), %rbx
	movq	-40(%rbp), %r9
	movl	(%r9,%rbx,4), %r9d
	addl	%r9d, %r8d
	addq	$1, %rsi
	jmp	.L12
.L11:
	cmpl	%r8d, %eax
	cmovl	%r8d, %eax
	addq	$1, %rcx
	jmp	.L13
.L10:
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	__test_MOD_max_sum_open, .-__test_MOD_max_sum_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

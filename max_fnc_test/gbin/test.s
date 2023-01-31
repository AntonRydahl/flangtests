	.file	"test.f90"
	.text
	.globl	__test_MOD_mval_closed
	.type	__test_MOD_mval_closed, @function
__test_MOD_mval_closed:
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
.L3:
	cmpq	$3, %rdx
	jg	.L2
	leaq	-1(%rdx), %rsi
	movq	-24(%rbp), %rcx
	movl	(%rcx,%rsi,4), %ecx
	cmpl	%ecx, %eax
	cmovl	%ecx, %eax
	addq	$1, %rdx
	jmp	.L3
.L2:
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_mval_closed, .-__test_MOD_mval_closed
	.globl	__test_MOD_mval_open
	.type	__test_MOD_mval_open, @function
__test_MOD_mval_open:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L7
	movl	$1, %eax
.L7:
	movq	-40(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -8(%rbp)
	movq	-40(%rbp), %rdx
	movq	56(%rdx), %rcx
	movq	-40(%rbp), %rdx
	movq	48(%rdx), %rsi
	subq	%rsi, %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movq	%rax, %rdx
	imulq	-16(%rbp), %rdx
	movq	%rax, %r9
	negq	%r9
	movq	%rdx, %r10
	movl	$0, %r11d
	movl	$-2147483648, %edx
	movq	-16(%rbp), %r8
	movl	$1, %ecx
.L9:
	cmpq	%r8, %rcx
	jg	.L8
	movq	%rcx, %rsi
	imulq	%rax, %rsi
	leaq	(%r9,%rsi), %rdi
	movq	-8(%rbp), %rsi
	movl	(%rsi,%rdi,4), %esi
	cmpl	%esi, %edx
	cmovl	%esi, %edx
	addq	$1, %rcx
	jmp	.L9
.L8:
	movl	%edx, -20(%rbp)
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	__test_MOD_mval_open, .-__test_MOD_mval_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

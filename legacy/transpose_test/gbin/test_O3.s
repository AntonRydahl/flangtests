	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_trans_manual
	.type	__test_MOD_trans_manual, @function
__test_MOD_trans_manual:
.LFB0:
	.cfi_startproc
	movq	40(%rdi), %r8
	movq	%rdi, %rdx
	testq	%r8, %r8
	je	.L3
	movq	%r8, %r10
	leaq	(%r8,%r8), %rax
	negq	%r10
	leaq	(%rax,%r8), %r9
.L2:
	movq	(%rdx), %rdi
	addq	%r10, %r8
	movq	%r10, %rcx
	movl	(%rsi), %r10d
	movq	64(%rdx), %rdx
	movl	%r10d, (%rdi,%r8,4)
	movl	4(%rsi), %r10d
	addq	%rdx, %r8
	subq	%rdx, %rcx
	movl	%r10d, (%rdi,%r8,4)
	movl	8(%rsi), %r10d
	addq	%rdx, %r8
	addq	%rcx, %rax
	addq	%rdx, %rax
	movl	%r10d, (%rdi,%r8,4)
	movl	12(%rsi), %r8d
	movl	%r8d, (%rdi,%rax,4)
	movl	16(%rsi), %r8d
	addq	%rdx, %rax
	movl	%r8d, (%rdi,%rax,4)
	movl	20(%rsi), %r8d
	addq	%rdx, %rax
	movl	%r8d, (%rdi,%rax,4)
	leaq	(%rcx,%r9), %rax
	movl	24(%rsi), %ecx
	addq	%rdx, %rax
	movl	%ecx, (%rdi,%rax,4)
	movl	28(%rsi), %ecx
	addq	%rdx, %rax
	addq	%rax, %rdx
	movl	%ecx, (%rdi,%rax,4)
	movl	32(%rsi), %eax
	movl	%eax, (%rdi,%rdx,4)
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$3, %r9d
	movl	$2, %eax
	movq	$-1, %r10
	movl	$1, %r8d
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	__test_MOD_trans_manual, .-__test_MOD_trans_manual
	.p2align 4
	.globl	__test_MOD_trans_closed
	.type	__test_MOD_trans_closed, @function
__test_MOD_trans_closed:
.LFB1:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	40(%rdi), %rcx
	movq	%rdi, %r8
	testq	%rcx, %rcx
	je	.L7
	movq	%rcx, %rdx
	leaq	(%rcx,%rcx), %rdi
	negq	%rdx
	leaq	(%rdi,%rcx), %r9
.L6:
	movq	(%r8), %rax
	movl	(%rsi), %r11d
	leaq	(%rcx,%rdx), %r10
	movq	64(%r8), %r8
	movl	4(%rsi), %ebx
	movl	%r11d, (%rax,%r10,4)
	movl	12(%rsi), %r11d
	leaq	(%rdx,%rdi), %r10
	movl	%r11d, (%rax,%r10,4)
	movl	24(%rsi), %r11d
	leaq	(%r9,%rdx), %r10
	movl	%r11d, (%rax,%r10,4)
	leaq	(%r8,%r8), %r10
	addq	%rdx, %r8
	leaq	(%rcx,%r8), %r11
	addq	%r10, %rdx
	movl	%ebx, (%rax,%r11,4)
	movl	16(%rsi), %ebx
	leaq	(%rdi,%r8), %r11
	addq	%r9, %r8
	addq	%rdx, %rcx
	addq	%rdx, %rdi
	addq	%r9, %rdx
	movl	%ebx, (%rax,%r11,4)
	movl	28(%rsi), %r11d
	movl	%r11d, (%rax,%r8,4)
	movl	8(%rsi), %r8d
	movl	%r8d, (%rax,%rcx,4)
	movl	20(%rsi), %ecx
	movl	%ecx, (%rax,%rdi,4)
	movl	32(%rsi), %ecx
	movl	%ecx, (%rax,%rdx,4)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	movl	$3, %r9d
	movl	$2, %edi
	movl	$1, %ecx
	movq	$-1, %rdx
	jmp	.L6
	.cfi_endproc
.LFE1:
	.size	__test_MOD_trans_closed, .-__test_MOD_trans_closed
	.p2align 4
	.globl	__test_MOD_trans_open
	.type	__test_MOD_trans_open, @function
__test_MOD_trans_open:
.LFB2:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movq	40(%rsi), %r10
	testq	%r10, %r10
	je	.L21
	movq	%r10, %r8
	negq	%r8
.L10:
	movq	64(%rsi), %rax
	movq	40(%rdi), %rbx
	movq	56(%rsi), %r9
	movq	80(%rsi), %r11
	movq	(%rsi), %rbp
	subq	48(%rsi), %r9
	subq	%rax, %r8
	subq	72(%rsi), %r11
	testq	%rbx, %rbx
	je	.L22
	movq	%rbx, %r13
	negq	%r13
.L11:
	movq	(%rdi), %r15
	movq	64(%rdi), %r12
	testq	%r9, %r9
	js	.L9
	testq	%r11, %r11
	js	.L9
	cmpq	$1, %rbx
	jne	.L26
	leaq	0(,%rax,4), %rdi
	leaq	(%r10,%r8), %rbx
	salq	$2, %r12
	leaq	(%r15,%r13,4), %rsi
	leaq	2(%r11), %r8
	leaq	0(%rbp,%rdi), %r13
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L19:
	leaq	0(%r13,%rbx,4), %rdx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%rdx), %ecx
	addq	%rdi, %rdx
	movl	%ecx, (%rsi,%rax,4)
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L17
	leaq	1(%rbp), %rax
	addq	%r10, %rbx
	addq	%r12, %rsi
	cmpq	%r9, %rbp
	je	.L9
	movq	%rax, %rbp
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L9:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L22:
	.cfi_restore_state
	movq	$-1, %r13
	movl	$1, %ebx
	jmp	.L11
.L21:
	movq	$-1, %r8
	movl	$1, %r10d
	jmp	.L10
.L26:
	salq	$2, %rax
	salq	$2, %rbx
	addq	%r10, %r8
	xorl	%r14d, %r14d
	addq	%rax, %rbp
	addq	%rbx, %r15
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	0(%rbp,%r8,4), %rsi
	leaq	(%r15,%r13,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L15:
	movl	(%rsi), %edi
	addq	%rax, %rsi
	movl	%edi, (%rcx)
	movq	%rdx, %rdi
	addq	%rbx, %rcx
	addq	$1, %rdx
	cmpq	%r11, %rdi
	jne	.L15
	leaq	1(%r14), %rdx
	addq	%r10, %r8
	addq	%r12, %r13
	cmpq	%r9, %r14
	je	.L9
	movq	%rdx, %r14
	jmp	.L20
	.cfi_endproc
.LFE2:
	.size	__test_MOD_trans_open, .-__test_MOD_trans_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

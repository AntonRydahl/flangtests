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
	movq	40(%rdi), %rdx
	movq	%rdi, %rax
	testq	%rdx, %rdx
	je	.L8
	movq	%rdx, %rcx
	negq	%rcx
.L6:
	movq	64(%rax), %rdi
	movq	(%rax), %rax
	addq	%rdx, %rcx
	leaq	12(%rsi), %r8
	salq	$2, %rdi
	leaq	(%rax,%rcx,4), %rax
.L7:
	movl	(%rsi), %ecx
	addq	$4, %rsi
	movl	%ecx, (%rax)
	movl	8(%rsi), %ecx
	movl	%ecx, (%rax,%rdx,4)
	movl	20(%rsi), %ecx
	movl	%ecx, (%rax,%rdx,8)
	addq	%rdi, %rax
	cmpq	%r8, %rsi
	jne	.L7
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movq	$-1, %rcx
	movl	$1, %edx
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
	movq	40(%rsi), %r12
	testq	%r12, %r12
	je	.L19
	movq	%r12, %r10
	negq	%r10
.L11:
	movq	64(%rsi), %r9
	movq	40(%rax), %r8
	movq	56(%rsi), %rbp
	movq	80(%rsi), %rdi
	movq	(%rsi), %r14
	subq	48(%rsi), %rbp
	subq	%r9, %r10
	subq	72(%rsi), %rdi
	testq	%r8, %r8
	je	.L20
	movq	%r8, %r11
	negq	%r11
.L12:
	movq	(%rax), %r13
	movq	64(%rax), %r15
	testq	%rbp, %rbp
	js	.L10
	salq	$2, %r9
	salq	$2, %r8
	addq	%r12, %r10
	xorl	%ebx, %ebx
	addq	%r9, %r14
	addq	%r8, %r13
	.p2align 4,,10
	.p2align 3
.L16:
	testq	%rdi, %rdi
	js	.L17
	leaq	(%r14,%r10,4), %rcx
	leaq	0(%r13,%r11,4), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L18:
	movl	(%rcx), %esi
	addq	%r9, %rcx
	movl	%esi, (%rdx)
	movq	%rax, %rsi
	addq	%r8, %rdx
	addq	$1, %rax
	cmpq	%rdi, %rsi
	jne	.L18
.L17:
	leaq	1(%rbx), %rax
	addq	%r12, %r10
	addq	%r15, %r11
	cmpq	%rbp, %rbx
	je	.L10
	movq	%rax, %rbx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L10:
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
.L20:
	.cfi_restore_state
	movq	$-1, %r11
	movl	$1, %r8d
	jmp	.L12
.L19:
	movq	$-1, %r10
	movl	$1, %r12d
	jmp	.L11
	.cfi_endproc
.LFE2:
	.size	__test_MOD_trans_open, .-__test_MOD_trans_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

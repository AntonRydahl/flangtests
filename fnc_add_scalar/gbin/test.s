	.file	"test.f90"
	.text
	.globl	__test_MOD_add_arr
	.type	__test_MOD_add_arr, @function
__test_MOD_add_arr:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movl	$1, %eax
.L3:
	movq	-128(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -24(%rbp)
	movq	-128(%rbp), %rdx
	movq	56(%rdx), %rcx
	movq	-128(%rbp), %rdx
	movq	48(%rdx), %rsi
	movq	%rcx, %rdx
	subq	%rsi, %rdx
	addq	$1, %rdx
	movq	%rdx, -32(%rbp)
	movq	%rax, %rdx
	imulq	-32(%rbp), %rdx
	movq	%rax, %r11
	negq	%r11
	movq	%rdx, %r12
	movl	$0, %r13d
	movq	-120(%rbp), %rdx
	movq	40(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L5
	movl	$1, %edx
.L5:
	movq	-120(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -40(%rbp)
	movq	-32(%rbp), %rcx
	movq	$4, -80(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$4, -96(%rbp)
	movb	$1, -84(%rbp)
	movb	$1, -83(%rbp)
	movq	$1, -64(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%rax, -72(%rbp)
	movq	$0, -112(%rbp)
	movq	$-1, -104(%rbp)
	leaq	-112(%rbp), %rcx
	movq	56(%rcx), %rsi
	movq	48(%rcx), %rdi
	subq	%rdi, %rsi
	movq	%rsi, %rcx
	addq	$1, %rcx
	movl	$0, %esi
	testq	%rcx, %rcx
	cmovs	%rsi, %rcx
	movslq	%ecx, %rcx
	movq	%rcx, -48(%rbp)
	movq	%rdx, %rcx
	imulq	-48(%rbp), %rcx
	movq	%rdx, %r10
	negq	%r10
	movq	%rcx, %r8
	movl	$0, %r9d
	movq	-32(%rbp), %r9
	movl	$1, %ecx
.L7:
	cmpq	%r9, %rcx
	jg	.L6
	movq	%rcx, %rsi
	imulq	%rax, %rsi
	leaq	(%r11,%rsi), %rdi
	movq	-24(%rbp), %rsi
	movl	(%rsi,%rdi,4), %esi
	movq	%rcx, %rdi
	imulq	%rdx, %rdi
	addq	%r10, %rdi
	leal	27(%rsi), %r8d
	movq	-40(%rbp), %rsi
	movl	%r8d, (%rsi,%rdi,4)
	addq	$1, %rcx
	jmp	.L7
.L6:
	nop
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr, .-__test_MOD_add_arr
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

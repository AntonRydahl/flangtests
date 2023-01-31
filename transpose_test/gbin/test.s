	.file	"test.f90"
	.text
	.globl	__test_MOD_trans_manual
	.type	__test_MOD_trans_manual, @function
__test_MOD_trans_manual:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movl	$1, %eax
.L3:
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	64(%rdx), %rdx
	movq	%rdx, %rcx
	addq	%rcx, %rcx
	addq	%rdx, %rcx
	movq	%rax, %rsi
	negq	%rsi
	subq	%rdx, %rsi
	movq	%rcx, %r8
	movl	$0, %r9d
	leaq	(%rsi,%rax), %r10
	movl	$1, %ecx
.L5:
	cmpq	$3, %rcx
	jg	.L4
	leaq	-1(%rcx), %r8
	movq	%rcx, %rdi
	imulq	%rdx, %rdi
	leaq	(%r10,%rdi), %r9
	movq	-32(%rbp), %rdi
	movl	(%rdi,%r8,4), %r8d
	movq	-8(%rbp), %rdi
	movl	%r8d, (%rdi,%r9,4)
	addq	$1, %rcx
	jmp	.L5
.L4:
	leaq	(%rax,%rax), %rcx
	leaq	(%rsi,%rcx), %r10
	movl	$1, %ecx
.L7:
	cmpq	$3, %rcx
	jg	.L6
	leaq	2(%rcx), %r8
	movq	%rcx, %rdi
	imulq	%rdx, %rdi
	leaq	(%r10,%rdi), %r9
	movq	-32(%rbp), %rdi
	movl	(%rdi,%r8,4), %r8d
	movq	-8(%rbp), %rdi
	movl	%r8d, (%rdi,%r9,4)
	addq	$1, %rcx
	jmp	.L7
.L6:
	movq	%rax, %rcx
	addq	%rcx, %rcx
	addq	%rcx, %rax
	leaq	(%rsi,%rax), %r8
	movl	$1, %eax
.L9:
	cmpq	$3, %rax
	jg	.L8
	leaq	5(%rax), %rsi
	movq	%rax, %rcx
	imulq	%rdx, %rcx
	leaq	(%r8,%rcx), %rdi
	movq	-32(%rbp), %rcx
	movl	(%rcx,%rsi,4), %esi
	movq	-8(%rbp), %rcx
	movl	%esi, (%rcx,%rdi,4)
	addq	$1, %rax
	jmp	.L9
.L8:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_trans_manual, .-__test_MOD_trans_manual
	.globl	__test_MOD_trans_closed
	.type	__test_MOD_trans_closed, @function
__test_MOD_trans_closed:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	40(%rax), %rcx
	testq	%rcx, %rcx
	jne	.L12
	movl	$1, %ecx
.L12:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	64(%rax), %rsi
	movq	%rsi, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	movq	%rcx, %rdx
	negq	%rdx
	subq	%rsi, %rdx
	movq	%rdx, %r11
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$1, %edx
.L16:
	cmpq	$3, %rdx
	jg	.L13
	leaq	-4(%rdx), %r10
	movq	%rdx, %rax
	imulq	%rsi, %rax
	leaq	(%r11,%rax), %rbx
	movl	$1, %eax
.L15:
	cmpq	$3, %rax
	jg	.L14
	movq	%rax, %rdi
	addq	%rdi, %rdi
	addq	%rax, %rdi
	leaq	(%r10,%rdi), %r8
	movq	%rax, %rdi
	imulq	%rcx, %rdi
	leaq	(%rbx,%rdi), %r9
	movq	-48(%rbp), %rdi
	movl	(%rdi,%r8,4), %r8d
	movq	-24(%rbp), %rdi
	movl	%r8d, (%rdi,%r9,4)
	addq	$1, %rax
	jmp	.L15
.L14:
	addq	$1, %rdx
	jmp	.L16
.L13:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	__test_MOD_trans_closed, .-__test_MOD_trans_closed
	.globl	__test_MOD_trans_open
	.type	__test_MOD_trans_open, @function
__test_MOD_trans_open:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$160, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -296(%rbp)
	movq	%rsi, -304(%rbp)
	movq	-304(%rbp), %rax
	movq	40(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L19
	movl	$1, %edx
.L19:
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-304(%rbp), %rax
	movq	56(%rax), %rcx
	movq	-304(%rbp), %rax
	movq	48(%rax), %rsi
	movq	%rcx, %rax
	subq	%rsi, %rax
	addq	$1, %rax
	movq	%rax, -64(%rbp)
	movq	-304(%rbp), %rax
	movq	64(%rax), %rsi
	movq	-304(%rbp), %rax
	movq	80(%rax), %rcx
	movq	-304(%rbp), %rax
	movq	72(%rax), %rdi
	movq	%rcx, %rax
	subq	%rdi, %rax
	addq	$1, %rax
	movq	%rax, -72(%rbp)
	movq	%rsi, %rax
	imulq	-72(%rbp), %rax
	movq	%rdx, %rcx
	negq	%rcx
	subq	%rsi, %rcx
	movq	%rcx, %r13
	movq	%rax, %r8
	movl	$0, %r9d
	movq	-296(%rbp), %rax
	movq	40(%rax), %r8
	testq	%r8, %r8
	jne	.L21
	movl	$1, %r8d
.L21:
	movq	-296(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-64(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	$4, -256(%rbp)
	movq	$0, -272(%rbp)
	movq	$0, -264(%rbp)
	movq	$4, -272(%rbp)
	movb	$2, -260(%rbp)
	movb	$1, -259(%rbp)
	movq	$1, -240(%rbp)
	movq	%rcx, -232(%rbp)
	movq	%rdx, -248(%rbp)
	movq	$1, -216(%rbp)
	movq	%rax, -208(%rbp)
	movq	%rsi, -224(%rbp)
	movq	$0, -288(%rbp)
	movq	$-1, -280(%rbp)
	leaq	-288(%rbp), %rax
	movq	56(%rax), %rcx
	movq	48(%rax), %rdi
	movq	%rcx, %rax
	subq	%rdi, %rax
	addq	$1, %rax
	movl	$0, %ecx
	testq	%rax, %rax
	cmovs	%rcx, %rax
	cltq
	movq	%rax, -88(%rbp)
	movq	-296(%rbp), %rax
	movq	64(%rax), %r9
	movq	-64(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	$4, -160(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -168(%rbp)
	movq	$4, -176(%rbp)
	movb	$2, -164(%rbp)
	movb	$1, -163(%rbp)
	movq	$1, -144(%rbp)
	movq	%rcx, -136(%rbp)
	movq	%rdx, -152(%rbp)
	movq	$1, -120(%rbp)
	movq	%rax, -112(%rbp)
	movq	%rsi, -128(%rbp)
	movq	$0, -192(%rbp)
	movq	$-1, -184(%rbp)
	leaq	-192(%rbp), %rax
	movq	80(%rax), %rcx
	movq	72(%rax), %rdi
	movq	%rcx, %rax
	subq	%rdi, %rax
	addq	$1, %rax
	movl	$0, %ecx
	testq	%rax, %rax
	cmovs	%rcx, %rax
	cltq
	movq	%rax, -96(%rbp)
	movq	%r9, %rax
	imulq	-96(%rbp), %rax
	movq	%r8, %rcx
	negq	%rcx
	subq	%r9, %rcx
	movq	%rcx, %r14
	movq	%rax, %r10
	movl	$0, %r11d
	movq	-72(%rbp), %r11
	movq	-64(%rbp), %rbx
	movl	$1, %eax
.L25:
	cmpq	%rbx, %rax
	jg	.L22
	movq	%rax, %rcx
	imulq	%rdx, %rcx
	leaq	0(%r13,%rcx), %rdi
	movq	%rdi, -312(%rbp)
	movq	%rax, %rcx
	imulq	%r9, %rcx
	leaq	(%r14,%rcx), %r15
	movl	$1, %ecx
.L24:
	cmpq	%r11, %rcx
	jg	.L23
	movq	%rcx, %rdi
	imulq	%rsi, %rdi
	movq	-312(%rbp), %r10
	addq	%rdi, %r10
	movq	%rcx, %rdi
	imulq	%r8, %rdi
	leaq	(%r15,%rdi), %r12
	movq	-56(%rbp), %rdi
	movl	(%rdi,%r10,4), %r10d
	movq	-80(%rbp), %rdi
	movl	%r10d, (%rdi,%r12,4)
	addq	$1, %rcx
	jmp	.L24
.L23:
	addq	$1, %rax
	jmp	.L25
.L22:
	nop
	addq	$160, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	__test_MOD_trans_open, .-__test_MOD_trans_open
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

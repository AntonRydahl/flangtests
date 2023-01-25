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
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movl	$1, %eax
.L3:
	movq	-40(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, %rdx
	addq	%rdx, %rdx
	addq	%rax, %rdx
	movq	%rax, %r8
	negq	%r8
	movq	%rdx, %rcx
	movl	$0, %ebx
	movl	$1, %edx
.L5:
	cmpq	$3, %rdx
	jg	.L4
	leaq	-1(%rdx), %rsi
	movq	-48(%rbp), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movq	%rdx, %rsi
	imulq	%rax, %rsi
	addq	%r8, %rsi
	leal	27(%rcx), %edi
	movq	-24(%rbp), %rcx
	movl	%edi, (%rcx,%rsi,4)
	addq	$1, %rdx
	jmp	.L5
.L4:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr, .-__test_MOD_add_arr
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

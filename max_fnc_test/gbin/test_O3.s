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
	movq	40(%rdi), %rax
	movq	(%rdi), %rdx
	movq	56(%rdi), %rsi
	testq	%rax, %rax
	jne	.L4
	subq	48(%rdi), %rsi
	js	.L14
.L6:
	leaq	1(%rsi), %r8
	cmpq	$2, %rsi
	jbe	.L15
	movq	%r8, %rdi
	movdqa	.LC0(%rip), %xmm2
	xorl	%eax, %eax
	shrq	$2, %rdi
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rax, %rcx
	addq	$1, %rax
	salq	$4, %rcx
	movdqu	(%rdx,%rcx), %xmm0
	movdqa	%xmm0, %xmm1
	pcmpgtd	%xmm2, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	por	%xmm0, %xmm2
	cmpq	%rax, %rdi
	jne	.L10
	movdqa	%xmm2, %xmm1
	movq	%r8, %rdi
	psrldq	$8, %xmm1
	andq	$-4, %rdi
	movdqa	%xmm1, %xmm0
	leaq	1(%rdi), %rcx
	pcmpgtd	%xmm2, %xmm0
	pand	%xmm0, %xmm1
	pandn	%xmm2, %xmm0
	por	%xmm0, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm2
	pandn	%xmm1, %xmm0
	por	%xmm2, %xmm0
	movd	%xmm0, %eax
	cmpq	%rdi, %r8
	je	.L20
.L8:
	movl	-4(%rdx,%rcx,4), %edi
	cmpl	%edi, %eax
	cmovl	%edi, %eax
	leaq	1(%rcx), %rdi
	cmpq	%rcx, %rsi
	jl	.L3
	movl	(%rdx,%rcx,4), %ecx
	cmpl	%ecx, %eax
	cmovl	%ecx, %eax
	cmpq	%rsi, %rdi
	jg	.L3
	movl	(%rdx,%rdi,4), %edx
	cmpl	%edx, %eax
	cmovl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	subq	48(%rdi), %rsi
	jns	.L21
.L14:
	movl	$-2147483648, %eax
.L3:
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	cmpq	$1, %rax
	je	.L6
	leaq	0(,%rax,4), %r8
	xorl	%ecx, %ecx
	movl	$-2147483648, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rdx), %edi
	cmpl	%edi, %eax
	cmovl	%edi, %eax
	movq	%rcx, %rdi
	addq	%r8, %rdx
	addq	$1, %rcx
	cmpq	%rsi, %rdi
	jne	.L7
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	ret
.L15:
	movl	$1, %ecx
	movl	$-2147483648, %eax
	jmp	.L8
	.cfi_endproc
.LFE1:
	.size	__test_MOD_mval_open, .-__test_MOD_mval_open
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	-2147483648
	.long	-2147483648
	.long	-2147483648
	.long	-2147483648
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_add_arr
	.type	__test_MOD_add_arr, @function
__test_MOD_add_arr:
.LFB0:
	.cfi_startproc
	movq	%rdi, %rcx
	movq	40(%rsi), %rdx
	movl	$1, %r8d
	movq	(%rsi), %rdi
	movq	40(%rcx), %rax
	movq	56(%rsi), %r9
	testq	%rdx, %rdx
	movq	(%rcx), %rcx
	cmove	%r8, %rdx
	testq	%rax, %rax
	cmove	%r8, %rax
	subq	48(%rsi), %r9
	js	.L1
	cmpq	$1, %rax
	jne	.L13
	cmpq	$1, %rdx
	jne	.L13
	leaq	1(%r9), %r8
	cmpq	$2, %r9
	jbe	.L12
	movq	%r8, %rsi
	movdqa	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	xorl	%edx, %edx
	shrq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L10:
	movdqu	(%rdi,%rax), %xmm0
	addq	$1, %rdx
	paddd	%xmm1, %xmm0
	movups	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rsi
	jne	.L10
	movq	%r8, %rdx
	andq	$-4, %rdx
	leaq	1(%rdx), %rax
	cmpq	%rdx, %r8
	je	.L16
.L9:
	leaq	-1(%rax), %rsi
	movl	(%rdi,%rsi,4), %edx
	addl	$27, %edx
	movl	%edx, (%rcx,%rsi,4)
	leaq	1(%rax), %rsi
	cmpq	%rax, %r9
	jl	.L1
	movl	(%rdi,%rax,4), %edx
	addl	$27, %edx
	movl	%edx, (%rcx,%rax,4)
	cmpq	%rsi, %r9
	jl	.L1
	movl	(%rdi,%rsi,4), %eax
	addl	$27, %eax
	movl	%eax, (%rcx,%rsi,4)
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	salq	$2, %rdx
	movq	%rdi, %r8
	salq	$2, %rax
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%r8), %esi
	addq	%rdx, %r8
	addl	$27, %esi
	movl	%esi, (%rcx)
	movq	%rdi, %rsi
	addq	%rax, %rcx
	addq	$1, %rdi
	cmpq	%r9, %rsi
	jne	.L8
	ret
.L12:
	movl	$1, %eax
	jmp	.L9
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr, .-__test_MOD_add_arr
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	27
	.long	27
	.long	27
	.long	27
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

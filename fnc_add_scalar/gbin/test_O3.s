	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_add_arr_opt
	.type	__test_MOD_add_arr_opt, @function
__test_MOD_add_arr_opt:
.LFB0:
	.cfi_startproc
	movq	40(%rdi), %rax
	movslq	(%rdx), %r8
	movq	(%rdi), %rdx
	testq	%rax, %rax
	jne	.L2
	testq	%r8, %r8
	jle	.L16
.L4:
	leaq	-1(%r8), %rax
	cmpq	$2, %rax
	jbe	.L10
	movq	%r8, %rcx
	movdqa	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	shrq	$2, %rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L8:
	movdqu	(%rsi,%rax), %xmm0
	paddd	%xmm1, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L8
	movq	%r8, %rcx
	andq	$-4, %rcx
	leaq	1(%rcx), %rax
	cmpq	%rcx, %r8
	je	.L17
.L7:
	leaq	-1(%rax), %rdi
	movl	(%rsi,%rdi,4), %ecx
	addl	$27, %ecx
	movl	%ecx, (%rdx,%rdi,4)
	leaq	1(%rax), %rcx
	cmpq	%r8, %rcx
	jg	.L1
	movl	(%rsi,%rax,4), %edi
	addl	$27, %edi
	movl	%edi, (%rdx,%rax,4)
	addq	$2, %rax
	cmpq	%rax, %r8
	jl	.L1
	movl	(%rsi,%rcx,4), %eax
	addl	$27, %eax
	movl	%eax, (%rdx,%rcx,4)
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	testq	%r8, %r8
	jle	.L1
	cmpq	$1, %rax
	je	.L4
	leaq	0(,%rax,4), %rcx
	leaq	(%rsi,%r8,4), %rdi
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rsi), %eax
	addq	$4, %rsi
	addl	$27, %eax
	movl	%eax, (%rdx)
	addq	%rcx, %rdx
	cmpq	%rdi, %rsi
	jne	.L6
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	ret
.L16:
	ret
.L10:
	movl	$1, %eax
	jmp	.L7
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr_opt, .-__test_MOD_add_arr_opt
	.p2align 4
	.globl	__test_MOD_add_arr
	.type	__test_MOD_add_arr, @function
__test_MOD_add_arr:
.LFB1:
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
	js	.L18
	cmpq	$1, %rax
	jne	.L30
	cmpq	$1, %rdx
	jne	.L30
	leaq	1(%r9), %r8
	cmpq	$2, %r9
	jbe	.L29
	movq	%r8, %rsi
	movdqa	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	xorl	%edx, %edx
	shrq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L27:
	movdqu	(%rdi,%rax), %xmm0
	addq	$1, %rdx
	paddd	%xmm1, %xmm0
	movups	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rsi
	jne	.L27
	movq	%r8, %rdx
	andq	$-4, %rdx
	leaq	1(%rdx), %rax
	cmpq	%rdx, %r8
	je	.L32
.L26:
	leaq	-1(%rax), %rsi
	movl	(%rdi,%rsi,4), %edx
	addl	$27, %edx
	movl	%edx, (%rcx,%rsi,4)
	leaq	1(%rax), %rsi
	cmpq	%rax, %r9
	jl	.L18
	movl	(%rdi,%rax,4), %edx
	addl	$27, %edx
	movl	%edx, (%rcx,%rax,4)
	cmpq	%rsi, %r9
	jl	.L18
	movl	(%rdi,%rsi,4), %eax
	addl	$27, %eax
	movl	%eax, (%rcx,%rsi,4)
.L18:
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	salq	$2, %rdx
	movq	%rdi, %r8
	salq	$2, %rax
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L25:
	movl	(%r8), %esi
	addq	%rdx, %r8
	addl	$27, %esi
	movl	%esi, (%rcx)
	movq	%rdi, %rsi
	addq	%rax, %rcx
	addq	$1, %rdi
	cmpq	%r9, %rsi
	jne	.L25
	ret
.L29:
	movl	$1, %eax
	jmp	.L26
	.cfi_endproc
.LFE1:
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

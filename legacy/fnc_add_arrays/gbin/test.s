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
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1, %eax
.L3:
	cmpq	$3, %rax
	jg	.L2
	leaq	-1(%rax), %rcx
	movq	-8(%rbp), %rdx
	movl	(%rdx,%rcx,4), %esi
	leaq	-1(%rax), %rcx
	movq	-16(%rbp), %rdx
	movl	(%rdx,%rcx,4), %edx
	leaq	-1(%rax), %rcx
	addl	%edx, %esi
	movq	-8(%rbp), %rdx
	movl	%esi, (%rdx,%rcx,4)
	addq	$1, %rax
	jmp	.L3
.L2:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr, .-__test_MOD_add_arr
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

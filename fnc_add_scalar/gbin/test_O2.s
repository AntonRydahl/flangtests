	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_add_arr
	.type	__test_MOD_add_arr, @function
__test_MOD_add_arr:
.LFB0:
	.cfi_startproc
	movq	40(%rdi), %rdx
	testq	%rdx, %rdx
	je	.L3
	leaq	(%rdx,%rdx), %r8
.L2:
	movl	(%rsi), %ecx
	movq	(%rdi), %rax
	addl	$27, %ecx
	movl	%ecx, (%rax)
	movl	4(%rsi), %ecx
	addl	$27, %ecx
	movl	%ecx, (%rax,%rdx,4)
	movl	8(%rsi), %edx
	addl	$27, %edx
	movl	%edx, (%rax,%r8,4)
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$2, %r8d
	movl	$1, %edx
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr, .-__test_MOD_add_arr
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

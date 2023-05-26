	.file	"test.f90"
	.text
	.p2align 4
	.globl	__test_MOD_add_arr
	.type	__test_MOD_add_arr, @function
__test_MOD_add_arr:
.LFB0:
	.cfi_startproc
	movl	(%rsi), %eax
	addl	%eax, (%rdi)
	movl	4(%rsi), %eax
	addl	%eax, 4(%rdi)
	movl	8(%rsi), %eax
	addl	%eax, 8(%rdi)
	ret
	.cfi_endproc
.LFE0:
	.size	__test_MOD_add_arr, .-__test_MOD_add_arr
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

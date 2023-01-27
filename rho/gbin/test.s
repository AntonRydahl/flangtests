	.file	"test.f90"
	.text
	.globl	__rhofunc_MOD_rho
	.type	__rhofunc_MOD_rho, @function
__rhofunc_MOD_rho:
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
	movsd	(%rax), %xmm0
	comisd	.LC0(%rip), %xmm0
	seta	%al
	movzbl	%al, %edx
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC1(%rip), %xmm0
	comisd	%xmm1, %xmm0
	seta	%al
	movzbl	%al, %eax
	andl	%eax, %edx
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	comisd	.LC0(%rip), %xmm0
	seta	%al
	movzbl	%al, %eax
	andl	%eax, %edx
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC1(%rip), %xmm0
	comisd	%xmm1, %xmm0
	seta	%al
	movzbl	%al, %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	.L2
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L2:
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	comisd	.LC3(%rip), %xmm0
	seta	%al
	movzbl	%al, %edx
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC4(%rip), %xmm0
	comisd	%xmm1, %xmm0
	seta	%al
	movzbl	%al, %eax
	andl	%eax, %edx
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	comisd	.LC3(%rip), %xmm0
	seta	%al
	movzbl	%al, %eax
	andl	%eax, %edx
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC4(%rip), %xmm0
	comisd	%xmm1, %xmm0
	seta	%al
	movzbl	%al, %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	.L4
	movsd	.LC5(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L4:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
.L3:
	movsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__rhofunc_MOD_rho, .-__rhofunc_MOD_rho
	.section	.rodata
.LC15:
	.string	"./rho/test.f90"
	.text
	.type	MAIN__, @function
MAIN__:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$616, %rsp
	.cfi_offset 3, -24
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -60(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	_gfortran_cpu_time_8@PLT
	leaq	phiprime.3(%rip), %rax
	movl	$720000, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	phi.2(%rip), %rax
	movl	$720000, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$1, -28(%rbp)
.L10:
	cmpl	$300, -28(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L29
	movl	$1, -32(%rbp)
.L9:
	cmpl	$300, -32(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L30
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-28(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-32(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	movl	-32(%rbp), %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-301(%rax), %rbx
	leaq	-80(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	__rhofunc_MOD_rho
	movq	%xmm0, %rax
	leaq	0(,%rbx,8), %rcx
	leaq	rhoarr.1(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addl	$1, -32(%rbp)
	jmp	.L9
.L30:
	nop
	addl	$1, -28(%rbp)
	jmp	.L10
.L29:
	nop
.L7:
	movsd	-24(%rbp), %xmm0
	comisd	.LC8(%rip), %xmm0
	seta	%al
	movzbl	%al, %eax
	xorl	$1, %eax
	testl	%eax, %eax
	jne	.L31
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	$2, -28(%rbp)
.L16:
	cmpl	$299, -28(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L32
	movl	$2, -32(%rbp)
.L15:
	cmpl	$299, -32(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L33
	movl	-32(%rbp), %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	addl	$1, %eax
	cltq
	addq	%rdx, %rax
	subq	$301, %rax
	leaq	0(,%rax,8), %rdx
	leaq	phi.2(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	movl	-32(%rbp), %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cltq
	addq	%rdx, %rax
	subq	$301, %rax
	leaq	0(,%rax,8), %rdx
	leaq	phi.2(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	subq	$301, %rax
	leaq	0(,%rax,8), %rdx
	leaq	phi.2(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm0, %xmm1
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	subq	$301, %rax
	leaq	0(,%rax,8), %rdx
	leaq	phi.2(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC10(%rip), %xmm0
	divsd	%xmm0, %xmm1
	movsd	-40(%rbp), %xmm0
	movsd	.LC10(%rip), %xmm2
	divsd	%xmm2, %xmm0
	movsd	.LC11(%rip), %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movl	-32(%rbp), %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	subq	$301, %rax
	leaq	0(,%rax,8), %rdx
	leaq	rhoarr.1(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movl	-32(%rbp), %eax
	cltq
	imulq	$300, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	subq	$301, %rax
	addsd	%xmm1, %xmm0
	leaq	0(,%rax,8), %rdx
	leaq	phiprime.3(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -32(%rbp)
	jmp	.L15
.L33:
	nop
	addl	$1, -28(%rbp)
	jmp	.L16
.L32:
	nop
	movsd	.LC12(%rip), %xmm0
	movl	$0, %edi
	movl	$1, %edx
.L24:
	cmpq	$300, %rdx
	jg	.L17
	imulq	$300, %rdx, %rax
	leaq	-301(%rax), %rcx
	imulq	$300, %rdx, %rax
	leaq	-301(%rax), %rsi
	movl	$1, %eax
.L23:
	cmpq	$300, %rax
	jg	.L18
	testl	%edi, %edi
	je	.L19
	leaq	(%rax,%rcx), %r8
	leaq	0(,%r8,8), %r9
	leaq	phiprime.3(%rip), %r8
	movsd	(%r9,%r8), %xmm1
	leaq	(%rax,%rsi), %r8
	leaq	0(,%r8,8), %r9
	leaq	phi.2(%rip), %r8
	movsd	(%r9,%r8), %xmm2
	subsd	%xmm2, %xmm1
	movq	.LC13(%rip), %xmm2
	andpd	%xmm2, %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L20
	leaq	(%rax,%rcx), %r8
	leaq	0(,%r8,8), %r9
	leaq	phiprime.3(%rip), %r8
	movsd	(%r9,%r8), %xmm0
	leaq	(%rax,%rsi), %r8
	leaq	0(,%r8,8), %r9
	leaq	phi.2(%rip), %r8
	movsd	(%r9,%r8), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC13(%rip), %xmm1
	andpd	%xmm1, %xmm0
	jmp	.L20
.L19:
	leaq	(%rax,%rcx), %r8
	leaq	0(,%r8,8), %r9
	leaq	phiprime.3(%rip), %r8
	movsd	(%r9,%r8), %xmm1
	leaq	(%rax,%rsi), %r8
	leaq	0(,%r8,8), %r9
	leaq	phi.2(%rip), %r8
	movsd	(%r9,%r8), %xmm2
	subsd	%xmm2, %xmm1
	movq	.LC13(%rip), %xmm2
	andpd	%xmm2, %xmm1
	comisd	%xmm0, %xmm1
	jb	.L20
	leaq	(%rax,%rcx), %rdi
	leaq	0(,%rdi,8), %r8
	leaq	phiprime.3(%rip), %rdi
	movsd	(%r8,%rdi), %xmm0
	leaq	(%rax,%rsi), %rdi
	leaq	0(,%rdi,8), %r8
	leaq	phi.2(%rip), %rdi
	movsd	(%r8,%rdi), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC13(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movl	$1, %edi
.L20:
	addq	$1, %rax
	jmp	.L23
.L18:
	addq	$1, %rdx
	jmp	.L24
.L17:
	testl	%edi, %edi
	jne	.L25
	movsd	.LC14(%rip), %xmm0
.L25:
	movsd	%xmm0, -24(%rbp)
	leaq	phi.2(%rip), %rax
	leaq	phiprime.3(%rip), %rcx
	movl	$720000, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	jmp	.L7
.L31:
	nop
	leaq	-56(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	_gfortran_cpu_time_8@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, -616(%rbp)
	movl	$54, -608(%rbp)
	movl	$128, -624(%rbp)
	movl	$6, -620(%rbp)
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movsd	-56(%rbp), %xmm0
	movsd	-48(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	leaq	-88(%rbp), %rcx
	leaq	-624(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	leaq	-60(%rbp), %rcx
	leaq	-624(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	MAIN__, .-MAIN__
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	_gfortran_set_args@PLT
	leaq	options.5.0(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.local	phiprime.3
	.comm	phiprime.3,720000,32
	.local	phi.2
	.comm	phi.2,720000,32
	.local	rhoarr.1
	.comm	rhoarr.1,720000,32
	.section	.rodata
	.align 16
	.type	options.5.0, @object
	.size	options.5.0, 28
options.5.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.align 8
.LC0:
	.long	858993459
	.long	1071854387
	.align 8
.LC1:
	.long	-1717986918
	.long	1072273817
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	-1717986918
	.long	1070176665
	.align 8
.LC4:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC5:
	.long	0
	.long	-1074790400
	.align 8
.LC7:
	.long	1202590843
	.long	1065646817
	.align 8
.LC8:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC9:
	.long	-350469331
	.long	1058682594
	.align 8
.LC10:
	.long	0
	.long	1074790400
	.align 8
.LC11:
	.long	1780140784
	.long	1034122779
	.align 8
.LC12:
	.long	0
	.long	-1048576
	.align 16
.LC13:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC14:
	.long	0
	.long	2146959360
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"test.f90"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC20:
	.string	"./rho/test.f90"
	.text
	.p2align 4
	.type	MAIN__, @function
MAIN__:
.LFB1:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$584, %rsp
	.cfi_def_cfa_offset 640
	leaq	24(%rsp), %rdi
	movl	$0, 20(%rsp)
	call	_gfortran_cpu_time_8@PLT
	movl	$720000, %edx
	xorl	%esi, %esi
	leaq	phiprime.2(%rip), %rdi
	call	memset@PLT
	xorl	%esi, %esi
	movl	$720000, %edx
	leaq	phi.1(%rip), %rdi
	call	memset@PLT
	leaq	rhoarr.0(%rip), %rcx
	movl	$1, %esi
	movsd	.LC5(%rip), %xmm9
	movapd	.LC8(%rip), %xmm11
	leaq	720000(%rcx), %rax
	movapd	.LC9(%rip), %xmm14
	movapd	.LC13(%rip), %xmm13
	movapd	.LC15(%rip), %xmm10
.L20:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%esi, %xmm0
	mulsd	.LC2(%rip), %xmm0
	comisd	.LC3(%rip), %xmm0
	ja	.L2
	movsd	.LC4(%rip), %xmm4
	movq	%rcx, %rdx
	comisd	%xmm0, %xmm4
	ja	.L3
	comisd	%xmm9, %xmm0
	ja	.L4
	.p2align 4,,10
	.p2align 3
.L6:
	movq	$0x000000000, (%rdx)
	addq	$2400, %rdx
	cmpq	%rax, %rdx
	jne	.L6
.L5:
	addq	$1, %rsi
	addq	$8, %rcx
	addq	$8, %rax
	cmpq	$301, %rsi
	jne	.L20
	movapd	.LC16(%rip), %xmm4
	movapd	.LC17(%rip), %xmm3
	movl	$1, %r12d
	leaq	717600+phi.1(%rip), %rbp
	movq	.LC18(%rip), %xmm2
	leaq	722400+phiprime.2(%rip), %rbx
.L35:
	movl	%r12d, 20(%rsp)
	leaq	2400+phi.1(%rip), %rcx
	leaq	2408+rhoarr.0(%rip), %r14
	leaq	2408+phiprime.2(%rip), %r13
	movq	%rcx, %rax
.L37:
	movapd	(%rax), %xmm0
	leaq	16(%rax), %r9
	movq	%r14, %rsi
	movq	%r13, %rdx
	leaq	2408(%rax), %r8
	leaq	-2392(%rax), %rdi
	xorl	%r10d, %r10d
	leaq	32(%rax), %r11
.L21:
	addpd	(%r9), %xmm0
	movupd	(%rdi), %xmm6
	addl	$2, %r10d
	movq	%r11, %r15
	movupd	(%rsi), %xmm1
	addq	$32, %r9
	addq	$32, %r8
	addq	$32, %rdi
	movupd	-32(%r8), %xmm7
	addq	$32, %rsi
	addq	$32, %rdx
	addq	$32, %r11
	mulpd	%xmm3, %xmm1
	addpd	%xmm7, %xmm0
	addpd	%xmm6, %xmm0
	mulpd	%xmm4, %xmm0
	addpd	%xmm1, %xmm0
	movups	%xmm0, -32(%rdx)
	movapd	-16(%r9), %xmm0
	movapd	-32(%r9), %xmm1
	movupd	-16(%r8), %xmm7
	movupd	-16(%rdi), %xmm6
	addpd	%xmm0, %xmm1
	movupd	-16(%rsi), %xmm5
	mulpd	%xmm3, %xmm5
	addpd	%xmm7, %xmm1
	addpd	%xmm6, %xmm1
	mulpd	%xmm4, %xmm1
	addpd	%xmm5, %xmm1
	movups	%xmm1, -16(%rdx)
	cmpl	$148, %r10d
	jne	.L21
	movapd	(%r9), %xmm0
	addpd	(%r15), %xmm0
	addq	$2400, %rax
	addq	$2400, %r14
	movupd	(%r8), %xmm1
	addq	$2400, %r13
	addpd	%xmm1, %xmm0
	movupd	(%rdi), %xmm1
	addpd	%xmm1, %xmm0
	movupd	(%rsi), %xmm1
	mulpd	%xmm3, %xmm1
	mulpd	%xmm4, %xmm0
	addpd	%xmm1, %xmm0
	movups	%xmm0, (%rdx)
	cmpq	%rbp, %rax
	jne	.L37
	movq	.LC1(%rip), %rax
	leaq	2400+phiprime.2(%rip), %rdx
	xorl	%esi, %esi
	movq	%rax, %xmm0
.L31:
	movl	$1, %eax
	testl	%esi, %esi
	jne	.L60
	.p2align 4,,10
	.p2align 3
.L23:
	movsd	-2408(%rdx,%rax,8), %xmm1
	subsd	-2408(%rcx,%rax,8), %xmm1
	addq	$1, %rax
	andpd	%xmm2, %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L63
	cmpq	$301, %rax
	jne	.L23
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L4:
	movq	$0x000000000, (%rdx)
	addq	$2400, %rdx
	cmpq	%rax, %rdx
	jne	.L4
	jmp	.L5
.L2:
	movsd	.LC4(%rip), %xmm3
	movsd	.LC12(%rip), %xmm1
	movq	%rcx, %rdx
	comisd	%xmm0, %xmm3
	ja	.L9
	comisd	%xmm0, %xmm1
	ja	.L10
	comisd	%xmm9, %xmm0
	ja	.L11
.L12:
	movq	$0x000000000, (%rdx)
	addq	$2400, %rdx
	cmpq	%rax, %rdx
	jne	.L12
	jmp	.L5
.L11:
	movq	$0x000000000, (%rdx)
	addq	$2400, %rdx
	cmpq	%rax, %rdx
	jne	.L11
	jmp	.L5
.L9:
	comisd	%xmm9, %xmm0
	ja	.L15
	comisd	%xmm0, %xmm1
	jbe	.L17
	movdqa	.LC0(%rip), %xmm7
	movdqa	.LC7(%rip), %xmm6
	movapd	.LC8(%rip), %xmm2
	movapd	.LC13(%rip), %xmm5
	movapd	.LC14(%rip), %xmm4
	movapd	.LC15(%rip), %xmm3
.L16:
	movdqa	%xmm7, %xmm1
	movapd	%xmm5, %xmm8
	addq	$9600, %rdx
	cvtdq2pd	%xmm1, %xmm0
	mulpd	%xmm2, %xmm0
	pshufd	$238, %xmm1, %xmm1
	paddd	%xmm6, %xmm7
	cvtdq2pd	%xmm1, %xmm1
	mulpd	%xmm2, %xmm1
	cmpltpd	%xmm0, %xmm8
	cmpltpd	%xmm4, %xmm0
	pand	%xmm8, %xmm0
	movapd	%xmm5, %xmm8
	cmpltpd	%xmm1, %xmm8
	cmpltpd	%xmm4, %xmm1
	andpd	%xmm3, %xmm0
	movlpd	%xmm0, -9600(%rdx)
	movhpd	%xmm0, -7200(%rdx)
	pand	%xmm8, %xmm1
	andpd	%xmm3, %xmm1
	movlpd	%xmm1, -4800(%rdx)
	movhpd	%xmm1, -2400(%rdx)
	cmpq	%rdx, %rax
	jne	.L16
	jmp	.L5
.L17:
	movq	$0x000000000, (%rdx)
	addq	$2400, %rdx
	cmpq	%rax, %rdx
	jne	.L17
	jmp	.L5
.L3:
	comisd	%xmm9, %xmm0
	jbe	.L8
	movdqa	.LC0(%rip), %xmm7
	movdqa	.LC7(%rip), %xmm6
	movapd	.LC8(%rip), %xmm2
	movapd	.LC9(%rip), %xmm5
	movapd	.LC10(%rip), %xmm4
	movapd	.LC11(%rip), %xmm3
.L7:
	movdqa	%xmm7, %xmm1
	movapd	%xmm5, %xmm8
	addq	$9600, %rdx
	cvtdq2pd	%xmm1, %xmm0
	mulpd	%xmm2, %xmm0
	pshufd	$238, %xmm1, %xmm1
	paddd	%xmm6, %xmm7
	cvtdq2pd	%xmm1, %xmm1
	mulpd	%xmm2, %xmm1
	cmpltpd	%xmm0, %xmm8
	cmpltpd	%xmm4, %xmm0
	pand	%xmm8, %xmm0
	movapd	%xmm5, %xmm8
	cmpltpd	%xmm1, %xmm8
	cmpltpd	%xmm4, %xmm1
	andpd	%xmm3, %xmm0
	movlpd	%xmm0, -9600(%rdx)
	movhpd	%xmm0, -7200(%rdx)
	pand	%xmm8, %xmm1
	andpd	%xmm3, %xmm1
	movlpd	%xmm1, -4800(%rdx)
	movhpd	%xmm1, -2400(%rdx)
	cmpq	%rax, %rdx
	jne	.L7
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	movq	$0x000000000, (%rdx)
	addq	$2400, %rdx
	cmpq	%rax, %rdx
	jne	.L8
	jmp	.L5
.L15:
	comisd	%xmm0, %xmm1
	ja	.L43
	movdqa	.LC0(%rip), %xmm1
	movapd	.LC9(%rip), %xmm5
	movapd	.LC10(%rip), %xmm4
	movapd	.LC11(%rip), %xmm3
.L19:
	movdqa	%xmm1, %xmm0
	movapd	%xmm5, %xmm6
	addq	$9600, %rdx
	cvtdq2pd	%xmm0, %xmm2
	mulpd	%xmm11, %xmm2
	pshufd	$238, %xmm0, %xmm0
	paddd	.LC7(%rip), %xmm1
	cvtdq2pd	%xmm0, %xmm0
	mulpd	%xmm11, %xmm0
	cmpltpd	%xmm2, %xmm6
	cmpltpd	%xmm4, %xmm2
	pand	%xmm6, %xmm2
	movapd	%xmm5, %xmm6
	cmpltpd	%xmm0, %xmm6
	cmpltpd	%xmm4, %xmm0
	andpd	%xmm3, %xmm2
	movlpd	%xmm2, -9600(%rdx)
	movhpd	%xmm2, -7200(%rdx)
	pand	%xmm6, %xmm0
	andpd	%xmm3, %xmm0
	movlpd	%xmm0, -4800(%rdx)
	movhpd	%xmm0, -2400(%rdx)
	cmpq	%rax, %rdx
	jne	.L19
	jmp	.L5
.L10:
	comisd	%xmm9, %xmm0
	movdqa	.LC0(%rip), %xmm7
	movdqa	.LC7(%rip), %xmm6
	movapd	.LC8(%rip), %xmm2
	movapd	.LC13(%rip), %xmm5
	movapd	.LC14(%rip), %xmm4
	movapd	.LC15(%rip), %xmm3
	ja	.L13
	pcmpeqd	%xmm8, %xmm8
.L14:
	movdqa	%xmm7, %xmm0
	movapd	%xmm5, %xmm12
	addq	$9600, %rdx
	cvtdq2pd	%xmm0, %xmm1
	mulpd	%xmm2, %xmm1
	pshufd	$238, %xmm0, %xmm0
	paddd	%xmm6, %xmm7
	cvtdq2pd	%xmm0, %xmm0
	mulpd	%xmm2, %xmm0
	cmpltpd	%xmm1, %xmm12
	cmpltpd	%xmm4, %xmm1
	pand	%xmm12, %xmm1
	movapd	%xmm5, %xmm12
	cmpltpd	%xmm0, %xmm12
	cmpltpd	%xmm4, %xmm0
	pxor	%xmm8, %xmm1
	andnpd	%xmm3, %xmm1
	movlpd	%xmm1, -9600(%rdx)
	pand	%xmm12, %xmm0
	movhpd	%xmm1, -7200(%rdx)
	pxor	%xmm8, %xmm0
	andnpd	%xmm3, %xmm0
	movlpd	%xmm0, -4800(%rdx)
	movhpd	%xmm0, -2400(%rdx)
	cmpq	%rax, %rdx
	jne	.L14
	jmp	.L5
.L13:
	movdqa	%xmm7, %xmm1
	movapd	%xmm5, %xmm8
	addq	$9600, %rdx
	cvtdq2pd	%xmm1, %xmm0
	mulpd	%xmm2, %xmm0
	pshufd	$238, %xmm1, %xmm1
	paddd	%xmm6, %xmm7
	cvtdq2pd	%xmm1, %xmm1
	mulpd	%xmm2, %xmm1
	cmpltpd	%xmm0, %xmm8
	cmpltpd	%xmm4, %xmm0
	pand	%xmm8, %xmm0
	movapd	%xmm5, %xmm8
	cmpltpd	%xmm1, %xmm8
	cmpltpd	%xmm4, %xmm1
	andpd	%xmm3, %xmm0
	movlpd	%xmm0, -9600(%rdx)
	movhpd	%xmm0, -7200(%rdx)
	pand	%xmm8, %xmm1
	andpd	%xmm3, %xmm1
	movlpd	%xmm1, -4800(%rdx)
	movhpd	%xmm1, -2400(%rdx)
	cmpq	%rax, %rdx
	jne	.L13
	jmp	.L5
.L43:
	movdqa	.LC0(%rip), %xmm3
	pcmpeqd	%xmm4, %xmm4
.L18:
	movdqa	%xmm3, %xmm0
	movapd	%xmm13, %xmm2
	movapd	%xmm13, %xmm1
	addq	$9600, %rdx
	cvtdq2pd	%xmm0, %xmm12
	mulpd	%xmm11, %xmm12
	pshufd	$238, %xmm0, %xmm0
	movapd	%xmm14, %xmm15
	cvtdq2pd	%xmm0, %xmm0
	mulpd	%xmm11, %xmm0
	paddd	.LC7(%rip), %xmm3
	movapd	%xmm12, %xmm6
	cmpltpd	%xmm12, %xmm2
	cmpltpd	%xmm12, %xmm15
	cmpltpd	%xmm0, %xmm1
	movapd	%xmm0, %xmm5
	cmpltpd	.LC14(%rip), %xmm6
	cmpltpd	.LC10(%rip), %xmm12
	cmpltpd	.LC14(%rip), %xmm5
	pand	%xmm2, %xmm6
	movapd	%xmm14, %xmm2
	movdqa	%xmm6, %xmm8
	cmpltpd	%xmm0, %xmm2
	pand	%xmm1, %xmm5
	pandn	%xmm15, %xmm8
	movapd	%xmm0, %xmm1
	movdqa	%xmm15, %xmm0
	movdqa	%xmm12, %xmm15
	por	%xmm6, %xmm0
	movdqa	%xmm5, %xmm7
	pandn	%xmm8, %xmm15
	pand	%xmm12, %xmm8
	pxor	%xmm4, %xmm0
	movapd	.LC11(%rip), %xmm12
	cmpltpd	.LC10(%rip), %xmm1
	por	%xmm15, %xmm0
	pandn	%xmm2, %xmm7
	andpd	%xmm8, %xmm12
	andnpd	%xmm10, %xmm8
	orpd	%xmm12, %xmm8
	movapd	%xmm10, %xmm12
	andpd	%xmm6, %xmm12
	andnpd	%xmm8, %xmm6
	orpd	%xmm12, %xmm6
	movapd	%xmm6, %xmm8
	movapd	%xmm0, %xmm6
	movdqa	%xmm2, %xmm0
	por	%xmm5, %xmm0
	movdqa	%xmm1, %xmm2
	pand	%xmm7, %xmm1
	pandn	%xmm7, %xmm2
	pxor	%xmm4, %xmm0
	andnpd	%xmm8, %xmm6
	por	%xmm2, %xmm0
	movapd	.LC11(%rip), %xmm2
	movlpd	%xmm6, -9600(%rdx)
	movhpd	%xmm6, -7200(%rdx)
	andpd	%xmm1, %xmm2
	andnpd	%xmm10, %xmm1
	orpd	%xmm2, %xmm1
	movapd	%xmm10, %xmm2
	andpd	%xmm5, %xmm2
	andnpd	%xmm1, %xmm5
	orpd	%xmm2, %xmm5
	andnpd	%xmm5, %xmm0
	movlpd	%xmm0, -4800(%rdx)
	movhpd	%xmm0, -2400(%rdx)
	cmpq	%rax, %rdx
	jne	.L18
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L25:
	cmpq	$301, %rax
	je	.L61
.L60:
	movapd	%xmm0, %xmm1
.L24:
	movsd	-2408(%rdx,%rax,8), %xmm0
	subsd	-2408(%rcx,%rax,8), %xmm0
	addq	$1, %rax
	andpd	%xmm2, %xmm0
	comisd	%xmm1, %xmm0
	ja	.L25
.L63:
	cmpq	$301, %rax
	jne	.L24
	movapd	%xmm1, %xmm0
.L61:
	movl	$1, %esi
.L26:
	addq	$2400, %rdx
	addq	$2400, %rcx
	cmpq	%rdx, %rbx
	jne	.L31
	testl	%esi, %esi
	movsd	%xmm0, 8(%rsp)
	movl	$720000, %edx
	leaq	phiprime.2(%rip), %rsi
	leaq	phi.1(%rip), %rdi
	je	.L32
	call	memcpy@PLT
	addl	$1, %r12d
	movsd	8(%rsp), %xmm0
	comisd	.LC19(%rip), %xmm0
	movapd	.LC16(%rip), %xmm4
	movapd	.LC17(%rip), %xmm3
	movq	.LC18(%rip), %xmm2
	ja	.L35
	jmp	.L34
.L32:
	call	memcpy@PLT
.L34:
	leaq	32(%rsp), %rdi
	xorl	%eax, %eax
	leaq	48(%rsp), %rbp
	call	_gfortran_cpu_time_8@PLT
	leaq	.LC20(%rip), %rax
	movq	%rbp, %rdi
	movl	$56, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	.LC21(%rip), %rax
	movq	%rax, 48(%rsp)
	call	_gfortran_st_write@PLT
	movsd	32(%rsp), %xmm0
	subsd	24(%rsp), %xmm0
	leaq	40(%rsp), %rsi
	movq	%rbp, %rdi
	movl	$8, %edx
	movsd	%xmm0, 40(%rsp)
	call	_gfortran_transfer_real_write@PLT
	leaq	20(%rsp), %rsi
	movq	%rbp, %rdi
	movl	$4, %edx
	call	_gfortran_transfer_integer_write@PLT
	movq	%rbp, %rdi
	call	_gfortran_st_write_done@PLT
	addq	$584, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	MAIN__, .-MAIN__
	.p2align 4
	.globl	__rhofunc_MOD_rho
	.type	__rhofunc_MOD_rho, @function
__rhofunc_MOD_rho:
.LFB0:
	.cfi_startproc
	movsd	(%rdi), %xmm0
	movsd	.LC3(%rip), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L66
	movsd	.LC12(%rip), %xmm2
	comisd	%xmm0, %xmm2
	jbe	.L66
	movsd	(%rsi), %xmm3
	comisd	%xmm1, %xmm3
	jbe	.L66
	comisd	%xmm3, %xmm2
	movsd	.LC22(%rip), %xmm1
	ja	.L65
	.p2align 4,,10
	.p2align 3
.L66:
	movsd	.LC5(%rip), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L90
	movsd	.LC4(%rip), %xmm2
	comisd	%xmm0, %xmm2
	jbe	.L90
	movsd	(%rsi), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L91
	.p2align 4,,10
	.p2align 3
.L90:
	pxor	%xmm1, %xmm1
.L65:
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L91:
	comisd	%xmm0, %xmm2
	movsd	.LC23(%rip), %xmm1
	ja	.L65
	jmp	.L90
	.cfi_endproc
.LFE0:
	.size	__rhofunc_MOD_rho, .-__rhofunc_MOD_rho
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_gfortran_set_args@PLT
	leaq	options.5.3(%rip), %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.local	rhoarr.0
	.comm	rhoarr.0,720000,32
	.local	phi.1
	.comm	phi.1,720000,32
	.local	phiprime.2
	.comm	phiprime.2,720000,32
	.section	.rodata
	.align 16
	.type	options.5.3, @object
	.size	options.5.3, 28
options.5.3:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1
	.long	2
	.long	3
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	-1048576
	.align 8
.LC2:
	.long	1202590843
	.long	1065646817
	.align 8
.LC3:
	.long	858993459
	.long	1071854387
	.align 8
.LC4:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC5:
	.long	-1717986918
	.long	1070176665
	.section	.rodata.cst16
	.align 16
.LC7:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC8:
	.long	1202590843
	.long	1065646817
	.long	1202590843
	.long	1065646817
	.align 16
.LC9:
	.long	-1717986918
	.long	1070176665
	.long	-1717986918
	.long	1070176665
	.align 16
.LC10:
	.long	-1717986918
	.long	1071225241
	.long	-1717986918
	.long	1071225241
	.align 16
.LC11:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	-1717986918
	.long	1072273817
	.section	.rodata.cst16
	.align 16
.LC13:
	.long	858993459
	.long	1071854387
	.long	858993459
	.long	1071854387
	.align 16
.LC14:
	.long	-1717986918
	.long	1072273817
	.long	-1717986918
	.long	1072273817
	.align 16
.LC15:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC16:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.align 16
.LC17:
	.long	1625778581
	.long	1095077197
	.long	1625778581
	.long	1095077197
	.align 16
.LC18:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC19:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC21:
	.long	128
	.long	6
	.align 8
.LC22:
	.long	0
	.long	1072693248
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",@progbits

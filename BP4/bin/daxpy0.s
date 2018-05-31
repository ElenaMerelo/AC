	.file	"daxpy.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"N\303\272mero de argumentos inv\303\241lido, introduzca tama\303\261o."
	.align 8
.LC4:
	.string	"Tiempo de ejecuci\303\263n: %11.9f \t / y[0]=%5.3f / y[%d]=%5.3f\n"
	.text
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
	addq	$-128, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -100(%rbp)
	je	.L2
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L2:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -76(%rbp)
	movl	-76(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	-76(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$0, -84(%rbp)
	jmp	.L3
.L4:
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-84(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -84(%rbp)
.L3:
	movl	-84(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L4
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -80(%rbp)
	jmp	.L5
.L6:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-72(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC2(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -80(%rbp)
.L5:
	movl	-80(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L6
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-76(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movq	-64(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-76(%rbp), %edx
	movq	-56(%rbp), %rax
	movapd	%xmm1, %xmm2
	movl	%edx, %esi
	movapd	%xmm0, %xmm1
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$3, %eax
	call	printf
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	1374389535
	.long	1074339512
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.5.0-12ubuntu1~16.04) 5.5.0 20171010"
	.section	.note.GNU-stack,"",@progbits

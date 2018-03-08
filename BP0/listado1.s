	.file	"listado1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo(seg.): %11.9f\t/Tama\303\261o vectores:%u\t/V1[0] + V2[0]= V3[0](%8.6f+%8.6f=%8.6f)// V1[%d] + V2[%d]= V3[%d](%8.6f+%8.6f=%8.6f)/\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L16
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %r15
	movl	%eax, %ecx
	movl	%eax, %eax
	leaq	22(,%rax,8), %rsi
	shrq	$4, %rsi
	salq	$4, %rsi
	subq	%rsi, %rsp
	leaq	7(%rsp), %rbx
	subq	%rsi, %rsp
	leaq	7(%rsp), %r12
	subq	%rsi, %rsp
	leaq	7(%rsp), %r13
	shrq	$3, %rbx
	shrq	$3, %r12
	movq	%rbx, -104(%rbp)
	leaq	0(,%rbx,8), %r14
	shrq	$3, %r13
	testl	%r15d, %r15d
	movq	%r12, -112(%rbp)
	leaq	0(,%r12,8), %rbx
	leaq	0(,%r13,8), %r12
	je	.L3
	pxor	%xmm1, %xmm1
	movsd	.LC1(%rip), %xmm3
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L6:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm7
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	addsd	%xmm1, %xmm2
	movsd	%xmm7, (%rbx,%rax,8)
	movsd	%xmm2, (%r14,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ecx
	ja	.L6
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	movl	%ecx, -116(%rbp)
	call	clock_gettime
	movl	-116(%rbp), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movsd	(%r14,%rax,8), %xmm0
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, (%r12,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ecx
	ja	.L7
.L8:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	-72(%rbp), %rax
	subq	-88(%rbp), %rax
	leal	-1(%r15), %esi
	pxor	%xmm0, %xmm0
	movl	%r15d, %edx
	pxor	%xmm1, %xmm1
	movq	%rsi, %rcx
	movsd	(%r12,%rsi,8), %xmm6
	movl	%esi, %r9d
	cvtsi2sdq	%rax, %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	movsd	(%rbx,%rsi,8), %xmm5
	movsd	(%r14,%rsi,8), %xmm4
	movl	%esi, %r8d
	movsd	0(,%r13,8), %xmm3
	movl	$.LC3, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movq	-112(%rbp), %rax
	movsd	0(,%rax,8), %xmm2
	movq	-104(%rbp), %rax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(,%rax,8), %xmm1
	movl	$7, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	-56(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L17
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L3:
	.cfi_restore_state
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L8
.L17:
	call	__stack_chk_fail
.L16:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

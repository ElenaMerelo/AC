	.file	"daxpy.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"N\303\272mero de argumentos inv\303\241lido, introduzca tama\303\261o."
	.align 8
.LC4:
	.string	"Tiempo de ejecuci\303\263n: %11.9f \t / y[0]=%5.3f / y[%d]=%5.3f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jne	.L17
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %r12
	movq	%rax, %r13
	movl	%eax, %r14d
	salq	$2, %r12
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	testl	%r13d, %r13d
	movq	%rax, %rbx
	jle	.L3
	movsd	.LC1(%rip), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	cvtsi2sd	%eax, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, 0(%rbp,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r14d
	jg	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movsd	.LC2(%rip), %xmm2
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	pxor	%xmm4, %xmm4
	cvtss2sd	0(%rbp,%rax,4), %xmm0
	cvtss2sd	(%rbx,%rax,4), %xmm1
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm4
	movss	%xmm4, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r14d
	jg	.L6
.L7:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%r13d, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC4, %esi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtss2sd	-4(%rbx,%r12), %xmm2
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	(%rbx), %xmm1
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L18
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L7
.L18:
	call	__stack_chk_fail
.L17:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst8,"aM",@progbits,8
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

	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"N\303\272mero de argumentos inv\303\241lido, introduzca tama\303\261o."
.LC4:
	.string	"Tiempo de ejecuci\303\263n: %11.9f \t / y[0]=%5.3f / y[%d]=%5.3f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	je	.L2
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L2:
	movq	8(%rsi), %rdi
	call	atoi
	movslq	%eax, %rbp
	movq	%rbp, %r12
	salq	$2, %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc
	movsd	.LC1(%rip), %xmm1
	movq	%rax, %rbx
	xorl	%eax, %eax
.L3:
	cmpl	%r12d, %eax
	jge	.L10
	cvtsi2sd	%eax, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, 0(%r13,%rax,4)
	incq	%rax
	jmp	.L3
.L10:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movsd	.LC2(%rip), %xmm2
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %r12d
	jle	.L11
	cvtss2sd	0(%r13,%rax,4), %xmm0
	cvtss2sd	(%rbx,%rax,4), %xmm1
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm4
	movss	%xmm4, (%rbx,%rax,4)
	incq	%rax
	jmp	.L5
.L11:
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	%r12d, %edx
	cvtss2sd	-4(%rbx,%rbp), %xmm2
	movl	$.LC4, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$3, %al
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvtss2sd	(%rbx), %xmm1
	call	__printf_chk
	movq	%r13, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail
.L7:
	addq	$56, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE20:
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

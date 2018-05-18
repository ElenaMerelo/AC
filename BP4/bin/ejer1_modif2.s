	.file	"ejer1_modif2.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Tiempo de ejecuci\303\263n: %11.9f\t / r[0]= %d\t / r[4999]= %d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edi, %edi
	movl	$s, %ebx
	subq	$160048, %rsp
	.cfi_def_cfa_offset 160064
	movq	%fs:40, %rax
	movq	%rax, 160040(%rsp)
	xorl	%eax, %eax
	call	time
	movl	%eax, %edi
	call	srand
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand
	movl	%eax, (%rbx)
	addq	$8, %rbx
	call	rand
	movl	%eax, -4(%rbx)
	cmpq	$s+40000, %rbx
	jne	.L2
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime
	leaq	32(%rsp), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%edi, %ecx
	movl	%edi, %esi
	movl	$s, %eax
	negl	%ecx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rsi,%rdx,2), %esi
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	addl	%edx, %ecx
	cmpq	$s+40000, %rax
	jne	.L3
	cmpl	%ecx, %esi
	jge	.L4
	movl	%esi, (%r8)
.L5:
	addl	$5000, %edi
	addq	$4, %r8
	cmpl	$200000000, %edi
	jne	.L6
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$.LC1, %esi
	pxor	%xmm0, %xmm0
	movl	160028(%rsp), %ecx
	movl	32(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC0(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	xorl	%eax, %eax
	movq	160040(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L13
	addq	$160048, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movl	%ecx, (%r8)
	jmp	.L5
.L13:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

	.file	"ejer1_modif3.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Tiempo de ejecuci\303\263n: %11.9f\t / r[0]= %d\t / r[39999]= %d\n"
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
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$s+40000, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	$s, %ebx
	movq	%rbx, %rbp
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand
	movl	%eax, 0(%rbp)
	addq	$8, %rbp
	call	rand
	movl	%eax, -4(%rbp)
	cmpq	%rbp, %r12
	jne	.L2
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	addl	(%rbx), %eax
	addl	4(%rbx), %edx
	addq	$8, %rbx
	cmpq	$s+40000, %rbx
	jne	.L3
	leal	(%rdx,%rdx,2), %edx
	addl	%eax, %eax
	movl	$r+12, %ecx
	leal	15000(%rax), %esi
	leal	200015000(%rax), %r9d
	leal	-15000(%rdx), %edi
	subl	$30000, %edx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L20:
	leal	-15000(%rsi), %r8d
	movl	%r8d, -12(%rcx)
	leal	20000(%rdx), %r8d
	cmpl	%r8d, %eax
	jge	.L6
.L21:
	leal	-10000(%rsi), %r8d
	movl	%r8d, -8(%rcx)
	leal	10000(%rdx), %r8d
	cmpl	%r8d, %eax
	jge	.L8
.L22:
	leal	-5000(%rsi), %r8d
	cmpl	%edx, %eax
	movl	%r8d, -4(%rcx)
	jge	.L10
.L23:
	movl	%esi, (%rcx)
.L11:
	addl	$20000, %esi
	addq	$16, %rcx
	subl	$20000, %edi
	subl	$40000, %edx
	cmpl	%r9d, %esi
	je	.L19
.L12:
	leal	30000(%rdx), %r8d
	cmpl	%r8d, %eax
	jl	.L20
	leal	15000(%rdi), %r8d
	movl	%r8d, -12(%rcx)
	leal	20000(%rdx), %r8d
	cmpl	%r8d, %eax
	jl	.L21
.L6:
	leal	10000(%rdi), %r8d
	movl	%r8d, -8(%rcx)
	leal	10000(%rdx), %r8d
	cmpl	%r8d, %eax
	jl	.L22
.L8:
	leal	5000(%rdi), %r8d
	cmpl	%edx, %eax
	movl	%r8d, -4(%rcx)
	jl	.L23
.L10:
	movl	%edi, (%rcx)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L19:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$1, %edi
	pxor	%xmm0, %xmm0
	movl	r+159996(%rip), %ecx
	movl	r(%rip), %edx
	movl	$.LC1, %esi
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
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L24
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.comm	r,160000,32
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.5.0-12ubuntu1~16.04) 5.5.0 20171010"
	.section	.note.GNU-stack,"",@progbits

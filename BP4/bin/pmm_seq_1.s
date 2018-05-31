	.file	"pmm_seq_1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\303\272mero de filas y columnas de la matriz"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio"
	.align 8
.LC3:
	.string	"Tiempo de ejecuci\303\263n: %11.9f\t / r[0][0]= %d\t / r[%d][%d]= %d\n"
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jne	.L37
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	movq	%rax, (%rsp)
	movl	%eax, %r15d
	cltq
	movq	%rax, 8(%rsp)
	movq	%rax, %r13
	salq	$3, %rax
	movq	%rax, %rbp
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %rbp
	movq	%rbx, %rax
	jle	.L3
	subl	$1, %eax
	leaq	0(,%r13,4), %r13
	movl	%r15d, 28(%rsp)
	movl	%eax, 24(%rsp)
	leaq	8(,%rax,8), %rax
	xorl	%ebx, %ebx
	movq	%rax, %r15
.L4:
	movq	%r13, %rdi
	call	malloc
	movq	%r13, %rdi
	movq	%rax, (%r12,%rbx)
	call	malloc
	movq	%r13, %rdi
	movq	%rax, (%r14,%rbx)
	call	malloc
	movq	%rax, 0(%rbp,%rbx)
	addq	$8, %rbx
	cmpq	%rbx, %r15
	jne	.L4
	movl	28(%rsp), %r15d
	xorl	%r9d, %r9d
.L5:
	movq	(%r12,%r9,8), %rdi
	movq	(%r14,%r9,8), %rsi
	movl	%r9d, %edx
	movq	0(%rbp,%r9,8), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%edx, (%rdi,%rax,4)
	movl	%eax, (%rsi,%rax,4)
	addl	$1, %edx
	movl	$0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L6
	addq	$1, %r9
	cmpl	%r9d, %r15d
	jg	.L5
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	movl	$4, %ebx
	call	clock_gettime
	movl	(%rsp), %eax
	leaq	8(%r14), %r8
	leal	-2(%rax), %r13d
	cmpl	$-1, %r13d
	je	.L8
.L38:
	movq	%rbx, %rcx
	addq	-8(%r8), %rcx
	movl	%r13d, %eax
	leaq	-4(%rbx), %r10
	leaq	4(,%rax,4), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%r10, %rdx
	addq	(%r8,%rax,2), %rdx
	movl	(%rcx,%rax), %esi
	movl	(%rdx), %edi
	movl	%edi, (%rcx,%rax)
	addq	$4, %rax
	movl	%esi, (%rdx)
	cmpq	%rax, %r9
	jne	.L9
	subl	$1, %r13d
	addq	$4, %rbx
	addq	$8, %r8
	cmpl	$-1, %r13d
	jne	.L38
.L8:
	xorl	%ebx, %ebx
.L13:
	movq	0(%rbp,%rbx,8), %r9
	movq	(%r12,%rbx,8), %rdi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L15:
	movl	(%r9,%r8,4), %ecx
	movq	(%r14,%r8,8), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%rdi,%rax,4), %edx
	imull	(%rsi,%rax,4), %edx
	addq	$1, %rax
	addl	%edx, %ecx
	cmpl	%eax, %r15d
	jg	.L11
	movl	%ecx, (%r9,%r8,4)
	addq	$1, %r8
	cmpl	%r8d, %r15d
	jg	.L15
	addq	$1, %rbx
	cmpl	%ebx, %r15d
	jg	.L13
.L14:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	16(%rsp), %rax
	pxor	%xmm0, %xmm0
	movq	0(%rbp), %rdx
	movl	24(%rsp), %ebx
	movl	$.LC3, %esi
	movl	$1, %edi
	movq	-8(%rbp,%rax), %rcx
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movl	(%rdx), %edx
	movl	%ebx, %r8d
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC2(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	8(%rsp), %rax
	movl	-4(%rcx,%rax,4), %r9d
	movl	%ebx, %ecx
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movl	%ebx, %eax
	xorl	%ebx, %ebx
	leaq	8(,%rax,8), %r13
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L18
.L17:
	movq	(%r12,%rbx), %rdi
	call	free
	movq	(%r14,%rbx), %rdi
	call	free
	movq	0(%rbp,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %r13
	jne	.L17
.L18:
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L39
	addq	$88, %rsp
	.cfi_remember_state
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
.L3:
	.cfi_restore_state
	testq	%r14, %r14
	sete	%dl
	testq	%r12, %r12
	sete	%al
	orb	%al, %dl
	jne	.L20
	testq	%rbp, %rbp
	je	.L20
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	(%rsp), %rax
	subl	$1, %eax
	movl	%eax, 24(%rsp)
	jmp	.L14
.L20:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L39:
	call	__stack_chk_fail
.L37:
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
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.5.0-12ubuntu1~16.04) 5.5.0 20171010"
	.section	.note.GNU-stack,"",@progbits

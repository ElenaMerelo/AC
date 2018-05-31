	.file	"pmm_seq.c"
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
	jne	.L30
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	movq	%rax, (%rsp)
	movl	%eax, %r14d
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
	movq	%rax, %r15
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %rbp
	movq	%rbx, %rax
	jle	.L3
	subl	$1, %eax
	leaq	0(,%r13,4), %r13
	movl	%r14d, 28(%rsp)
	movl	%eax, 24(%rsp)
	leaq	8(,%rax,8), %rax
	xorl	%ebx, %ebx
	movq	%rax, %r14
.L4:
	movq	%r13, %rdi
	call	malloc
	movq	%r13, %rdi
	movq	%rax, (%r12,%rbx)
	call	malloc
	movq	%r13, %rdi
	movq	%rax, (%r15,%rbx)
	call	malloc
	movq	%rax, 0(%rbp,%rbx)
	addq	$8, %rbx
	cmpq	%rbx, %r14
	jne	.L4
	movl	28(%rsp), %r14d
	xorl	%r9d, %r9d
.L5:
	movq	(%r12,%r9,8), %rdi
	movq	(%r15,%r9,8), %rsi
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
	cmpl	%eax, %r14d
	jg	.L6
	addq	$1, %r9
	cmpl	%r9d, %r14d
	jg	.L5
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	call	clock_gettime
	movl	24(%rsp), %eax
	leaq	4(,%rax,4), %r11
.L15:
	movq	0(%rbp,%rbx,8), %r8
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%r8,%rsi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movq	(%r15,%rax,8), %rdx
	movl	(%rdx,%rsi), %edx
	imull	(%rdi,%rax,4), %edx
	addq	$1, %rax
	addl	%edx, %ecx
	cmpl	%eax, %r14d
	jg	.L8
	movl	%ecx, (%r8,%rsi)
	addq	$4, %rsi
	cmpq	%r11, %rsi
	jne	.L11
	addq	$1, %rbx
	cmpl	%ebx, %r14d
	jg	.L15
.L10:
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
	jle	.L14
.L13:
	movq	(%r12,%rbx), %rdi
	call	free
	movq	(%r15,%rbx), %rdi
	call	free
	movq	0(%rbp,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %r13
	jne	.L13
.L14:
	movq	%r12, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L31
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
	testq	%r15, %r15
	sete	%dl
	testq	%r12, %r12
	sete	%al
	orb	%al, %dl
	jne	.L16
	testq	%rbp, %rbp
	je	.L16
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	(%rsp), %rax
	subl	$1, %eax
	movl	%eax, 24(%rsp)
	jmp	.L10
.L16:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L31:
	call	__stack_chk_fail
.L30:
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

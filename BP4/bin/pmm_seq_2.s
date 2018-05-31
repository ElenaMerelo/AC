	.file	"pmm_seq_2.c"
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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jne	.L36
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbp
	movq	%rax, 48(%rsp)
	movl	%eax, %ebx
	cltq
	movq	%rax, 64(%rsp)
	movq	%rax, %r12
	salq	$3, %rax
	movq	%rax, %r15
	movq	%rax, %rdi
	movq	%rax, 72(%rsp)
	call	malloc
	movq	%r15, %rdi
	movq	%rax, 16(%rsp)
	call	malloc
	movq	%r15, %rdi
	movq	%rax, %r14
	movq	%rax, 40(%rsp)
	call	malloc
	testl	%ebp, %ebp
	movq	%rax, %r15
	movq	%rax, 24(%rsp)
	jle	.L3
	leal	-1(%rbp), %eax
	movl	%ebx, (%rsp)
	movq	16(%rsp), %rbx
	leaq	0(,%r12,4), %r12
	xorl	%ebp, %ebp
	leaq	8(,%rax,8), %r13
	movl	%eax, 60(%rsp)
.L4:
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, (%rbx,%rbp)
	call	malloc
	movq	%r12, %rdi
	movq	%rax, (%r14,%rbp)
	call	malloc
	movq	%rax, (%r15,%rbp)
	addq	$8, %rbp
	cmpq	%rbp, %r13
	jne	.L4
	movl	(%rsp), %ebx
	movq	16(%rsp), %r9
	xorl	%r8d, %r8d
	movq	40(%rsp), %r10
	movq	24(%rsp), %r11
.L5:
	movq	(%r9,%r8,8), %rdi
	movq	(%r10,%r8,8), %rsi
	movl	%r8d, %edx
	movq	(%r11,%r8,8), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%edx, (%rdi,%rax,4)
	movl	%eax, (%rsi,%rax,4)
	addl	$1, %edx
	movl	$0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L6
	addq	$1, %r8
	cmpl	%r8d, %ebx
	jg	.L5
	leaq	80(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	movl	$4, %r10d
	addq	$8, %rax
	movq	%rax, 32(%rsp)
	movq	%rax, %rdi
	movl	48(%rsp), %eax
	leal	-2(%rax), %r11d
	cmpl	$-1, %r11d
	je	.L8
.L37:
	movq	%r10, %rcx
	addq	-8(%rdi), %rcx
	movl	%r11d, %eax
	leaq	-4(%r10), %rbp
	leaq	4(,%rax,4), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rbp, %rdx
	addq	(%rdi,%rax,2), %rdx
	movl	(%rcx,%rax), %esi
	movl	(%rdx), %r8d
	movl	%r8d, (%rcx,%rax)
	addq	$4, %rax
	movl	%esi, (%rdx)
	cmpq	%rax, %r9
	jne	.L9
	subl	$1, %r11d
	addq	$4, %r10
	addq	$8, %rdi
	cmpl	$-1, %r11d
	jne	.L37
.L8:
	movl	60(%rsp), %eax
	movq	40(%rsp), %rcx
	movq	$0, 8(%rsp)
	shrl	$2, %eax
	salq	$5, %rax
	leaq	40(%rcx,%rax), %rax
	movq	%rax, (%rsp)
.L11:
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rax
	movq	32(%rsp), %r14
	movq	(%rsi,%rax,8), %r13
	movq	24(%rsp), %rsi
	movq	(%rsi,%rax,8), %r15
	.p2align 4,,10
	.p2align 3
.L15:
	movq	-8(%r14), %r12
	movq	(%r14), %rbp
	xorl	%eax, %eax
	movq	8(%r14), %r11
	movq	16(%r14), %r10
	xorl	%r8d, %r8d
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L12:
	movl	0(%r13,%rax,4), %edx
	movl	(%r12,%rax,4), %r9d
	imull	%edx, %r9d
	addl	%r9d, %ecx
	movl	0(%rbp,%rax,4), %r9d
	imull	%edx, %r9d
	addl	%r9d, %esi
	movl	(%r11,%rax,4), %r9d
	imull	%edx, %r9d
	imull	(%r10,%rax,4), %edx
	addq	$1, %rax
	addl	%r9d, %edi
	addl	%edx, %r8d
	cmpl	%eax, %ebx
	jg	.L12
	movl	%ecx, (%r15)
	movl	%esi, 4(%r15)
	addq	$32, %r14
	movl	%edi, 8(%r15)
	movl	%r8d, 12(%r15)
	addq	$16, %r15
	cmpq	(%rsp), %r14
	jne	.L15
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	cmpl	%eax, %ebx
	jg	.L11
.L14:
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	movq	72(%rsp), %rbx
	movl	$.LC3, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	movq	-8(%rax,%rbx), %rcx
	movq	(%rax), %rdx
	movq	104(%rsp), %rax
	subq	88(%rsp), %rax
	movl	60(%rsp), %ebx
	movl	(%rdx), %edx
	cvtsi2sdq	%rax, %xmm0
	movq	96(%rsp), %rax
	subq	80(%rsp), %rax
	movl	%ebx, %r8d
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC2(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	movl	-4(%rcx,%rax,4), %r9d
	movl	%ebx, %ecx
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movl	%ebx, %eax
	xorl	%ebx, %ebx
	leaq	8(,%rax,8), %rbp
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jle	.L18
	movq	16(%rsp), %r12
	movq	40(%rsp), %r13
	movq	24(%rsp), %r14
.L17:
	movq	(%r12,%rbx), %rdi
	call	free
	movq	0(%r13,%rbx), %rdi
	call	free
	movq	(%r14,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbp, %rbx
	jne	.L17
.L18:
	movq	16(%rsp), %rdi
	call	free
	movq	40(%rsp), %rdi
	call	free
	movq	24(%rsp), %rdi
	call	free
	xorl	%eax, %eax
	movq	120(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L38
	addq	$136, %rsp
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
	cmpq	$0, 40(%rsp)
	sete	%dl
	cmpq	$0, 16(%rsp)
	sete	%al
	orb	%al, %dl
	jne	.L20
	cmpq	$0, 24(%rsp)
	je	.L20
	leaq	80(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	48(%rsp), %rax
	subl	$1, %eax
	movl	%eax, 60(%rsp)
	jmp	.L14
.L20:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L38:
	call	__stack_chk_fail
.L36:
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

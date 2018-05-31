	.file	"daxpy.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"N\303\272mero de argumentos inv\303\241lido, introduzca tama\303\261o."
	.align 8
.LC13:
	.string	"Tiempo de ejecuci\303\263n: %11.9f \t / y[0]=%5.3f / y[%d]=%5.3f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB14:
	.section	.text.startup,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jne	.L47
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %rbp
	movq	%rax, %rbx
	salq	$2, %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %r13
	jle	.L3
	movq	%r12, %rax
	andl	$15, %eax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$5, %ebx
	cmovbe	%ebx, %eax
	testl	%eax, %eax
	je	.L25
	cmpl	$1, %eax
	movl	$0x3dcccccd, (%r12)
	je	.L26
	cmpl	$2, %eax
	movl	$0x3f8ccccd, 4(%r12)
	je	.L27
	cmpl	$3, %eax
	movl	$0x40066666, 8(%r12)
	je	.L28
	cmpl	$5, %eax
	movl	$0x40466666, 12(%r12)
	jne	.L29
	movl	$0x40833333, 16(%r12)
	movl	$5, %edx
.L6:
	cmpl	%eax, %ebx
	je	.L48
.L5:
	movl	%ebx, %edi
	leal	-1(%rbx), %esi
	movl	%eax, %r9d
	subl	%eax, %edi
	leal	-4(%rdi), %ecx
	subl	%eax, %esi
	shrl	$2, %ecx
	addl	$1, %ecx
	cmpl	$2, %esi
	leal	0(,%rcx,4), %r8d
	jbe	.L8
	movl	%edx, 44(%rsp)
	leaq	(%r12,%r9,4), %rsi
	xorl	%eax, %eax
	movd	44(%rsp), %xmm3
	movapd	.LC8(%rip), %xmm2
	pshufd	$0, %xmm3, %xmm0
	movdqa	.LC7(%rip), %xmm3
	paddd	.LC6(%rip), %xmm0
.L9:
	movdqa	%xmm0, %xmm4
	cvtdq2pd	%xmm0, %xmm1
	addl	$1, %eax
	pshufd	$238, %xmm0, %xmm0
	addq	$16, %rsi
	addpd	%xmm2, %xmm1
	paddd	%xmm3, %xmm4
	cvtdq2pd	%xmm0, %xmm0
	addpd	%xmm2, %xmm0
	cvtpd2ps	%xmm1, %xmm1
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm1
	movaps	%xmm1, -16(%rsi)
	cmpl	%ecx, %eax
	jnb	.L49
	movdqa	%xmm4, %xmm0
	jmp	.L9
.L49:
	addl	%r8d, %edx
	cmpl	%r8d, %edi
	je	.L11
.L8:
	pxor	%xmm0, %xmm0
	movslq	%edx, %rax
	movsd	.LC9(%rip), %xmm2
	pxor	%xmm5, %xmm5
	cvtsi2sd	%edx, %xmm0
	addsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	movss	%xmm5, (%r12,%rax,4)
	leal	1(%rdx), %eax
	cmpl	%eax, %ebx
	jle	.L11
	pxor	%xmm1, %xmm1
	addl	$2, %edx
	movslq	%eax, %rcx
	pxor	%xmm6, %xmm6
	cmpl	%edx, %ebx
	cvtsi2sd	%eax, %xmm1
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm6
	movss	%xmm6, (%r12,%rcx,4)
	jle	.L11
	pxor	%xmm0, %xmm0
	movslq	%edx, %rax
	pxor	%xmm7, %xmm7
	cvtsi2sd	%edx, %xmm0
	addsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm7
	movss	%xmm7, (%r12,%rax,4)
.L11:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	%r13, %rax
	andl	$15, %eax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$4, %ebx
	cmovbe	%ebx, %eax
.L17:
	testl	%eax, %eax
	je	.L50
.L23:
	pxor	%xmm1, %xmm1
	cmpl	$1, %eax
	movsd	.LC11(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	(%r12), %xmm1
	pxor	%xmm7, %xmm7
	mulsd	%xmm0, %xmm1
	cvtss2sd	0(%r13), %xmm2
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm7
	movss	%xmm7, 0(%r13)
	je	.L32
	pxor	%xmm1, %xmm1
	cmpl	$2, %eax
	pxor	%xmm2, %xmm2
	pxor	%xmm7, %xmm7
	cvtss2sd	4(%r12), %xmm1
	cvtss2sd	4(%r13), %xmm2
	mulsd	%xmm0, %xmm1
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm7
	movss	%xmm7, 4(%r13)
	je	.L33
	pxor	%xmm1, %xmm1
	cmpl	$4, %eax
	pxor	%xmm2, %xmm2
	pxor	%xmm5, %xmm5
	cvtss2sd	8(%r12), %xmm1
	cvtss2sd	8(%r13), %xmm2
	mulsd	%xmm0, %xmm1
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm5
	movss	%xmm5, 8(%r13)
	jne	.L34
	pxor	%xmm1, %xmm1
	movl	$4, %edx
	pxor	%xmm6, %xmm6
	cvtss2sd	12(%r12), %xmm1
	mulsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	12(%r13), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, 12(%r13)
.L19:
	cmpl	%eax, %ebx
	je	.L22
.L18:
	movl	%ebx, %r8d
	leal	-1(%rbx), %edi
	movl	%eax, %esi
	subl	%eax, %r8d
	leal	-4(%r8), %ecx
	subl	%eax, %edi
	shrl	$2, %ecx
	addl	$1, %ecx
	cmpl	$2, %edi
	leal	0(,%rcx,4), %r9d
	jbe	.L21
	salq	$2, %rsi
	movapd	.LC10(%rip), %xmm4
	leaq	(%r12,%rsi), %r10
	xorl	%eax, %eax
	addq	%r13, %rsi
	xorl	%edi, %edi
.L13:
	movups	(%r10,%rax), %xmm3
	addl	$1, %edi
	cvtps2pd	%xmm3, %xmm0
	movaps	(%rsi,%rax), %xmm2
	mulpd	%xmm4, %xmm0
	cvtps2pd	%xmm2, %xmm1
	movhps	%xmm3, (%rsp)
	movhps	%xmm2, 16(%rsp)
	addpd	%xmm1, %xmm0
	cvtps2pd	(%rsp), %xmm1
	cvtps2pd	16(%rsp), %xmm2
	cvtpd2ps	%xmm0, %xmm0
	mulpd	%xmm4, %xmm1
	addpd	%xmm2, %xmm1
	cvtpd2ps	%xmm1, %xmm1
	movlhps	%xmm1, %xmm0
	movaps	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%ecx, %edi
	jb	.L13
	addl	%r9d, %edx
	cmpl	%r9d, %r8d
	je	.L22
.L21:
	pxor	%xmm1, %xmm1
	movslq	%edx, %rcx
	movsd	.LC11(%rip), %xmm0
	leaq	0(%r13,%rcx,4), %rax
	pxor	%xmm2, %xmm2
	cvtss2sd	(%r12,%rcx,4), %xmm1
	pxor	%xmm5, %xmm5
	mulsd	%xmm0, %xmm1
	cvtss2sd	(%rax), %xmm2
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm5
	movss	%xmm5, (%rax)
	leal	1(%rdx), %eax
	cmpl	%ebx, %eax
	jge	.L22
	pxor	%xmm1, %xmm1
	cltq
	addl	$2, %edx
	pxor	%xmm2, %xmm2
	leaq	0(%r13,%rax,4), %rcx
	pxor	%xmm6, %xmm6
	cmpl	%ebx, %edx
	cvtss2sd	(%r12,%rax,4), %xmm1
	cvtss2sd	(%rcx), %xmm2
	mulsd	%xmm0, %xmm1
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm6
	movss	%xmm6, (%rcx)
	jge	.L22
	pxor	%xmm1, %xmm1
	movslq	%edx, %rdx
	leaq	0(%r13,%rdx,4), %rax
	pxor	%xmm7, %xmm7
	cvtss2sd	(%r12,%rdx,4), %xmm1
	mulsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	(%rax), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm7
	movss	%xmm7, (%rax)
.L22:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	movl	%ebx, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC13, %esi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	cvtss2sd	-4(%r13,%rbp), %xmm2
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC12(%rip), %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	0(%r13), %xmm1
	call	__printf_chk
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	xorl	%eax, %eax
	movq	88(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L51
	addq	$104, %rsp
	.cfi_remember_state
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
.L50:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L18
.L48:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	%r13, %rax
	andl	$15, %eax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$5, %ebx
	je	.L17
	movl	%ebx, %eax
	jmp	.L23
.L25:
	xorl	%edx, %edx
	jmp	.L5
.L34:
	movl	$3, %edx
	jmp	.L19
.L32:
	movl	$1, %edx
	jmp	.L19
.L33:
	movl	$2, %edx
	jmp	.L19
.L28:
	movl	$3, %edx
	jmp	.L6
.L29:
	movl	$4, %edx
	jmp	.L6
.L26:
	movl	$1, %edx
	jmp	.L6
.L27:
	movl	$2, %edx
	jmp	.L6
.L3:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L22
.L51:
	call	__stack_chk_fail
.L47:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE14:
	.section	.text.startup
.LHOTE14:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC7:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC8:
	.long	2576980378
	.long	1069128089
	.long	2576980378
	.long	1069128089
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	2576980378
	.long	1069128089
	.section	.rodata.cst16
	.align 16
.LC10:
	.long	1374389535
	.long	1074339512
	.long	1374389535
	.long	1074339512
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	1374389535
	.long	1074339512
	.align 8
.LC12:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.5.0-12ubuntu1~16.04) 5.5.0 20171010"
	.section	.note.GNU-stack,"",@progbits

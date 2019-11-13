	.file	"mm-ijk.c"
	.text
	.comm	A,1048576,32
	.comm	B,1048576,32
	.comm	C,1048576,32
	.section	.rodata
	.align 8
.LC5:
	.string	"FORMA ijk (%d), Milisegundos = %9f \n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	$0, -8(%rbp)
	jmp	.L3
.L4:
	cvtss2sd	-16(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	movss	%xmm0, A(,%rax,4)
	cvtss2sd	-16(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	movss	%xmm0, B(,%rax,4)
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, C(,%rax,4)
	cvtss2sd	-16(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, -16(%rbp)
	addl	$1, -8(%rbp)
.L3:
	cmpl	$511, -8(%rbp)
	jle	.L4
	addl	$1, -4(%rbp)
.L2:
	cmpl	$511, -4(%rbp)
	jle	.L5
	movl	$0, %eax
	call	GetTime
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L6
.L11:
	movl	$0, -8(%rbp)
	jmp	.L7
.L10:
	movl	$0, -12(%rbp)
	jmp	.L8
.L9:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	movss	C(,%rax,4), %xmm1
	movl	-12(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	movss	A(,%rax,4), %xmm2
	movl	-8(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	movss	B(,%rax,4), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	movss	%xmm0, C(,%rax,4)
	addl	$1, -12(%rbp)
.L8:
	cmpl	$511, -12(%rbp)
	jle	.L9
	addl	$1, -8(%rbp)
.L7:
	cmpl	$511, -8(%rbp)
	jle	.L10
	addl	$1, -4(%rbp)
.L6:
	cmpl	$511, -4(%rbp)
	jle	.L11
	movl	$0, %eax
	call	GetTime
	movd	%xmm0, %eax
	movl	%eax, -24(%rbp)
	movss	-24(%rbp), %xmm0
	subss	-20(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$512, %esi
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	981668463
	.align 8
.LC1:
	.long	858993459
	.long	1074475827
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC4:
	.long	1202590843
	.long	1066695393
	.ident	"GCC: (SUSE Linux) 7.4.0"
	.section	.note.GNU-stack,"",@progbits

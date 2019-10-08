	.file	"prova.c"
	.text
	.globl	a
	.data
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	2
	.globl	b
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.long	3
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L2
.L4:
	movl	a, %edx
	movl	b, %eax
	cmpl	%eax, %edx
	jne	.L3
	movl	b, %edx
	movl	a, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	b, %eax
	addl	%edx, %eax
	movl	%eax, b
.L3:
	addl	$1, -4(%ebp)
.L2:
	cmpl	$299, -4(%ebp)
	jle	.L4
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 7.4.0"
	.section	.note.GNU-stack,"",@progbits

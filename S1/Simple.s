	.file	"Simple.c"
	.text
	.section	.rodata
.LC0:
	.string	"Resultado = %lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	movl	$0, -24(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L2
.L3:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	%eax, -24(%ebp)
	adcl	%edx, -20(%ebp)
	addl	$1, -16(%ebp)
	adcl	$0, -12(%ebp)
.L2:
	cmpl	$0, -12(%ebp)
	js	.L3
	cmpl	$0, -12(%ebp)
	jg	.L6
	cmpl	$2999999, -16(%ebp)
	jbe	.L3
.L6:
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	-24(%ebp)
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 7.4.0"
	.section	.note.GNU-stack,"",@progbits

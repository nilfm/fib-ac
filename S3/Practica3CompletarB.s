.text
	.align 4
	.globl OperaMat
	.type	OperaMat, @function
OperaMat:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp						# res: -4(%ebp)
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	
# Aqui has de introducir el codigo
	movl    $0, -4(%ebp)					# res = 0
	movl	$0, -8(%ebp)					# i = 0
	jmp 	condi

fori:
	movl 	$0, -12(%ebp)					# j = 0

forj:
	movl 	-8(%ebp), %ecx
	imull	$16, %ecx, %edx					# edx = 16*i
	movl	8(%ebp), %ebx					# ebx = @Matriz
	movl	(%ebx, %edx), %eax				# eax = (@Matriz+16*i)
	addl	-12(%ebp), %eax					# eax = (@Matriz+16*i)+j
	subl	%eax, -4(%ebp)
	
	incl	-12(%ebp)
condj:
	cmpl	$3, -12(%ebp)					# if (j >= 3) end for
	jl 		forj

	movl	12(%ebp), %ebx
	addl	%ebx, -8(%ebp)
condi:
	cmpl 	$3, -8(%ebp)					# if (i >= 3) end for
	jl 		fori
	
# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx	
	movl 	%ebp,%esp
	popl 	%ebp
	ret

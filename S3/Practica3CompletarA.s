.text
	.align 4
	.globl OperaVec
	.type	OperaVec, @function
OperaVec:
	pushl	%ebp					# OK
	movl	%esp, %ebp				# @Vector: 8, elementos: 12
	subl	$16, %esp				# i: -8, res: -4
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	8(%ebp), %eax			# eax = @Vector
	movl	(%eax), %eax			# eax = Vector[0]
	movl	%eax, -4(%ebp)			# res = Vector[0]
	
	
# Aqui has de introducir el codigo
	movl 	$1, -8(%ebp)				# i = 0
	movl	8(%ebp), %eax			# eax = @Vector
	jmp 	cond
	
for:
	movl    -8(%ebp), %ecx
	movl 	(%eax, %ecx, 4), %edx	# edx = Vector[i]
	cmpl 	-4(%ebp), %edx			# if (Vector[i] >= res) goto cond
	jge		cond
	movl 	%edx, -4(%ebp)			# res = Vector[i]
	
cond:
	incl 	-8(%ebp)				# i++
	movl    -8(%ebp), %ecx
	cmpl 	12(%ebp), %ecx			# if (i >= elementos) end for
	jl for 
	
	
# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx
	movl 	%ebp,%esp
	popl 	%ebp
	ret

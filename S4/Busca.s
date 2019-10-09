 .text
	.align 4
	.globl Buscar
	.type Buscar,@function
Buscar:
	pushl %ebp
    movl %esp, %ebp
    subl $16, %esp
    
    movl $-1, -4(%ebp)						# trobat = -1
    movl $0, -16(%ebp)						# low = 0
    movl $0, -8(%ebp)						# mid = low = 0
    movl 24(%ebp), %eax						# eax = N
    decl %eax								# eax = N-1
    movl %eax, -12(%ebp)					# high = N-1
    jmp condicio							# goto condicio

while:
    pushl 8(%ebp)							# push v
    pushl 20(%ebp)							
    pushl 16(%ebp)	
    pushl 12(%ebp)							# push X
    leal -8(%ebp), %eax						# eax = &mid
    pushl %eax								# push &mid
    leal -12(%ebp), %eax					# eax = &high
    pushl %eax								# push &high
    leal -16(%ebp), %eax					# eax = &low
    pushl %eax								# push &low
    call BuscarElemento						# BuscarElemento(&low, &high, &mid, X, v)
    addl $28, %esp							# restore esp
    movl %eax, -4(%ebp)						# trobat = BuscarElemento(...)
    cmpl $0, -4(%ebp) 						# if (trobat >= 0) break
    jge endwhile
    
condicio:
	movl -16(%ebp), %ecx					# ecx = low
	cmpl -12(%ebp), %ecx					# if (low <= high) goto while
	jle while
	
endwhile:
	movl -4(%ebp), %eax						# return trobat
	
    movl %ebp, %esp
    popl %ebp
    ret

 .text
	.align 4
	.globl BuscarElemento
	.type BuscarElemento,@function
BuscarElemento:
    pushl %ebp
    movl %esp, %ebp
    
    movl 16(%ebp), %ecx                 # ecx = mid
    movl (%ecx), %ecx                   # ecx = *mid
    imull $12, %ecx, %ecx               # ecx = *mid*12
    movl 32(%ebp), %edx                 # edx = @v
    movl 4(%ecx, %edx), %ecx            # edx = @v+*mid*12+4 = v[*mid].k
    cmpl 24(%ebp), %ecx                 # if X.k != v[*mid].k goto else 
    jne else
if:
    movl 16(%ebp), %eax                 # eax = mid
    movl (%eax), %eax                   # eax = *mid
    jmp endif                           # goto endif, return *mid
else:
    movl 16(%ebp), %ecx                 # ecx = mid
    movl 12(%ebp), %edx                 # edx = high
    movl (%edx), %edx                   # edx = *high
    cmpl %edx, (%ecx)                   # if *mid >= *high goto else2
    jge else2
if2:
    movl %edx, (%ecx)                   # *mid = *high
    movl 8(%ebp), %eax                  # eax = low
    incl (%eax)                         # (*low)++
    jmp endif2                          # goto endif2
else2:
    movl 8(%ebp), %edx                  # edx = low
    movl (%edx), %edx                   # edx = *low
    movl %edx, (%ecx)                   # *mid = *low
    movl 12(%ebp), %eax                 # eax = high
    decl (%eax)                         # (*high)--
endif2:
    movl $-1, %eax                      # return -1
endif:
    movl %ebp, %esp
    popl %ebp
    ret

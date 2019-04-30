# Purpose: return the square of the number
# 2^2 = 4

.section .data
.section .text

.globl _start
_start:
# I want to calculate the square of 4
pushl $4
call square
addl $4, %esp
movl $1, %eax
int $0x80

# This is the actual square function
.type square, @function
square:
push %ebp
movl %esp, %ebp

# Take the number into ebx
movl 8(%ebp), %ebx
imull %ebx, %ebx

movl %ebp, %esp
popl %ebp
ret

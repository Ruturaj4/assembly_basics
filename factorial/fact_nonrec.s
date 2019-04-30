#PURPOSE - Given a number, this program computes the
# factorial. For example, the factorial of
# 3 is 3 * 2 * 1, or 6. The factorial of
# 4 is 4 * 3 * 2 * 1, or 24, and so on.
#

#This program shows how to call a function recursively.

.section .data

.section .text

.globl _start
.globl factorial

_start:
pushl $4	#The number we want to get the factorial of
call factorial

addl $4, %esp
movl $1, %eax
int $0x80

# This is the actual factorial function
.type factorial, @function
factorial:
pushl %ebp
movl %esp, %ebp

movl 8(%ebp), %eax
movl %eax, %ebx
start:
# compare and see if the number is 1
decl %eax
imull %eax, %ebx
cmpl $1, %eax
je end
jmp start

end:
movl %ebp, %esp
popl %ebp
ret

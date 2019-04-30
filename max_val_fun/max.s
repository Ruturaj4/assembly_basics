# This program returns the maximum of the last list,
# using functions

.section .data

data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

data_items2:
.long 3,67,34,224,45,75,54,34,44,33,22,11,66,0

data_items3:
.long 3,67,34,223,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
.globl max

_start:
leal data_items, %ecx
# pushing the register value on the stack
call max
movl $0, %edi
leal data_items2, %ecx
call max
movl $0, %edi
leal data_items3, %ecx
call max
movl $1, %eax
int $0x80

.type max, @function
max:
pushl %ebp
movl %esp, %ebp
movl $0, %edi
movl (%ecx), %eax
movl %eax, %ebx

start:
cmpl $0, %eax
je exit
incl %edi
movl (%ecx,%edi,4), %eax
cmpl %ebx, %eax
jle start

movl %eax, %ebx
jmp start

exit:
movl %ebp, %esp
popl %ebp
ret

#PURPOSE: This program finds the maximum number of a
# set of data items.
#

#VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
# to terminate the data
#

.section .data
data_items:
.long 44,67,34,222,45,75,54,34,44,33,22,11,66,0
.section .text
.globl _start
_start:

movl $0, %edi
movl data_items(,%edi, 4), %eax
movl %eax, %ebx

loop:
cmpl $0, %eax
je exit
incl %edi
movl data_items(, %edi,4), %eax
cmpl %ebx, %eax
jle loop
movl %eax, %ebx
jmp loop

exit:
movl $1, %eax
movl _start, %ebx
int $0x80








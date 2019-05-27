#Write a program that will create a file called heynow.txt and write the words
#"Hey diddle diddle!" into it.

.section .data

#system call numbers
.equ SYS_OPEN, 5
.equ SYS_WRITE, 4
.equ SYS_READ, 3
.equ SYS_CLOSE, 6
.equ SYS_EXIT, 1

.equ O_RDONLY, 0
.equ O_CREATE_WRONLY_TRUNC, 03101

#system call interrupt
.equ LINUX_SYSCALL, 0x80

heydiddle:
.ascii "Hey diddle diddle!\n"

#Length of the string
heydiddle_end:
.equ heydiddle_len, heydiddle_end - heydiddle

# Name of the output file
filename:
.ascii "heynow.txt"

.section .text

.globl _start
_start:
###INITIALIZE PROGRAM###
#save the stack pointer

movl %esp, %ebp

# Open the output file
open_fd_out:
#open the output file
movl $SYS_OPEN, %eax
#output filename into %ebx
movl $filename, %ebx
#flags for writing to the file
movl $O_CREATE_WRONLY_TRUNC, %ecx
#mode for new file (if it’s created)
movl $0666, %edx
#call Linux
int $LINUX_SYSCALL

#Write to the file
movl %eax, %ebx
#Actual text
movl $heydiddle, %ecx
#Length of the text
movl $heydiddle_len, %edx
movl $SYS_WRITE, %eax
int $LINUX_SYSCALL

#Close the file
movl $SYS_CLOSE, %eax
int $LINUX_SYSCALL

mov $0, %ebx
movl $SYS_EXIT, %eax
int $LINUX_SYSCALL


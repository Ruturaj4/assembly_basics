# Create a program that uses a loop to write 30 identical records to a file.

.include "linux.s"
.include "record-def.s"

.section .data

.equ FILE_DES, -4

file_name:
.ascii "records.dat\0"

record1:
.ascii "NPC1\0"
.rept 35
.byte 0
.endr

.ascii "NPC2\0"
.rept 31
.byte 0
.endr

.ascii "NPCADD\0"
.rept 233
.byte 0
.endr

.long 44

.globl _start
_start:
movl  %esp, %ebp
#a place for the file descriptor
subl  $4, %esp

#open the file
movl  $SYS_OPEN, %eax
movl  $file_name, %ebx
movl  $0101, %ecx
movl  $0660, %edx
int   $LINUX_SYSCALL

#save the file descriptor
movl  %eax, FILE_DES(%ebp)

# We can make the loop using the same logic
# using rept and endr instructions
# Write 30 identical records
.rept 30
movl  $SYS_WRITE, %eax
movl  FILE_DES(%ebp), %ebx
movl  $record1, %ecx
movl  $RECORD_SIZE, %edx
int   $LINUX_SYSCALL
.endr

#close the file
movl  $SYS_CLOSE, %eax
movl  FILE_DES(%ebp), %ebx
int   $LINUX_SYSCALL

movl  $SYS_EXIT, %eax
movl  $0, %ebx
int   $LINUX_SYSCALL



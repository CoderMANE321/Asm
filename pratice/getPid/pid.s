.section .data
.section .text
.globl  _start

_start:
    #gets pid
    movl $20, %eax
    int $0x80

    #exit program       
    movl $1, %eax    
    movl $0, %ebx    
    int $0x80       

.section .data
    data_items: 
        .long 3,4,67,5,78,89,90,344,2,5,8,7,9,23,45,67,0

.section .text
.globl  _start

_start:
    movl $0, %edi    
    movl data_items(,%edi,4), %eax    
    movl %eax, %ebx 

start_loop:
    cmpl $0, %eax
    je loop_exit
    incl  %edi    
    movl data_items(,%edi,4), %eax 
    cmpl %ebx, %eax
    jle start_loop

    movl %eax, %ebx
    jmp start_loop

loop_exit:
    movl %ebx, %ebx
    movl $1, %eax
    int $0x80

section .data
    data_items dd 3,4,67,5,78,89,90,344,2,5,8,7,9,23,45,67
    data_length equ 15

section .text
    global _start

_start:
    mov ecx, 0                  ; Initialize index to 0
    mov eax, [data_items]      ; Load first item
    mov ebx, eax               ; Store it in ebx as the initial maximum

start_loop:
    cmp ecx, data_length        ; Compare index with data_length
    jge loop_exit               ; If index >= data_length, exit loop

    mov eax, [data_items + ecx*4]  ; Load current item
    cmp eax, ebx               ; Compare with current maximum
    jle skip_update            ; If current item <= max, skip update

    mov ebx, eax               ; Update maximum

skip_update:
    inc ecx                    ; Increment index
    jmp start_loop             ; Repeat the loop

loop_exit:
    ; Exit
    mov eax, 1                 ; SYS_exit
    xor ebx, ebx               ; Exit code 0
    int 0x80                   ; Make the system call

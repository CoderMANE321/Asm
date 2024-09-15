.section .data

.section .text

.globl _start

_start:
    # Call power(2, 3)
    movq $2, %rdi            # base = 2
    movq $3, %rsi            # exponent = 3
    call power               # call the C power function
    movq %rax, %rdi          # move result of 2^3 to rdi (for exit status)

    # Call power(5, 2)
    movq $5, %rdi            # base = 5
    movq $2, %rsi            # exponent = 2
    call power               # call the C power function
    addq %rax, %rdi          # add result of 5^2 to previous result (2^3)

    # Use edi (lower 32 bits of rdi) as the exit status
    movq $60, %rax           # syscall: exit (60)
    syscall                  # invoke the syscall to exit

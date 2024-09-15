    .section .data
    # No data section needed for this example

    .section .text
    .globl _start
    .globl _factorial

_start:
    pushl   $4             # Push argument for factorial function (4)
    call    _factorial     # Call factorial function
    addl    $4, %esp       # Clean up the stack after the call

    movl    %eax, %ebx     # Move the result into ebx (for exit status)
    movl    $1, %eax       # Syscall number for exit (1)
    int     $0x80          # Make the syscall to exit

.type   _factorial, @function
_factorial:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %eax  # Get argument n from the stack
    cmpl    $1, %eax       # Compare n with 1
    je      end_factorial  # If n == 1, jump to end_factorial

    decl    %eax           # Decrement n
    pushl   %eax           # Push n-1 onto the stack
    call    _factorial     # Recursive call to factorial
    movl    8(%ebp), %ebx  # Restore n from the stack
    imull   %ebx, %eax     # Multiply the result by n

end_factorial:
    movl    %ebp, %esp     # Restore stack pointer
    popl    %ebp           # Restore base pointer
    ret                    # Return from function

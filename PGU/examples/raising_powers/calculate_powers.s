    .type power, @function
power:
    pushl   %ebp
    movl    %esp, %ebp
    subl    $4, %esp
    
    movl    8(%ebp), %ebx   # Base
    movl    12(%ebp), %ecx  # Exponent

    movl    %ebx, -4(%ebp)  # Initialize result with base

power_loop_start:
    cmpl    $1, %ecx
    je      end_power
    movl    -4(%ebp), %eax
    imull   %ebx, %eax      # Multiply result by base
    movl    %eax, -4(%ebp)  # Store result back

    decl    %ecx
    jmp     power_loop_start
    
end_power:
    movl    -4(%ebp), %eax
    movl    %ebp, %esp
    popl    %ebp
    ret

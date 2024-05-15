```markdown
# MIPS Program for Determining Solutions of a Quadratic Polynomial

## Description
This MIPS assembly program determines the nature of solutions of a quadratic polynomial in the form ax^2 + bx + c.
- The coefficients a, b, and c are inputted by the user.
- The program then calculates the discriminant (b^2 - 4ac) to determine whether the polynomial has real solutions, distinct real solutions, or no real solutions.
- Messages indicating the nature of the solutions are displayed to the user.

## Usage
1. Run the program in a MIPS assembly environment.
2. Enter the coefficients a, b, and c when prompted.
3. The program will then determine the nature of solutions of the quadratic polynomial and display the appropriate message.
4. The program will exit after displaying the message.

## Implementation Details
- The program prompts the user to enter the coefficients a, b, and c.
- It calculates the discriminant (b^2 - 4ac) using the entered coefficients.
- Based on the value of the discriminant, the program determines whether the polynomial has real solutions, distinct real solutions, or no real solutions.
- Messages indicating the nature of solutions are displayed accordingly.

## Files
- `quadratic_polynomial.asm`: The MIPS assembly code for the quadratic polynomial solver program.

## Requirements
- A MIPS assembly environment to run the program.

## Instructions for Running the Program
1. Load the `quadratic_polynomial.asm` file into your MIPS assembly environment.
2. Assemble and run the program.
3. Follow the on-screen instructions to input the coefficients a, b, and c.
4. View the output message to determine the nature of solutions of the quadratic polynomial.

```
```assembly
.data
    msg1: .asciiz "The polynomial has distinct real solutions."
    msg2: .asciiz "The polynomial has coincident real solutions."
    msg3: .asciiz "The polynomial has no real solutions."
    msg4: .asciiz "Enter the first parameter:"
    msg5: .asciiz "Enter the second parameter:"
    msg6: .asciiz "Enter the third parameter:"
.text
    .globl main
    .ent main
    main:
        li $t5, 1
        # first parameter in $t0
        la $a0, msg4
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        # second parameter in $t1
        la $a0, msg5
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
        # third parameter in $t2
        la $a0, msg6
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t2, $v0

        
        mul $t3, $t1, $t1  # $t3 = b^2
        sll $t2, $t2, 2    # $t2 = 4*c
        mul $t4, $t2, $t0  # $t4 = 4*a*c
        sub $t3, $t3, $t4  # $t3 = b^2 - 4*a*c

        sgt $t0, $t3, $0
        beq $t0, $t5, greater
        slt $t0, $t3, $0
        beq $t0, $t5, lesser
        la $a0, msg2
        li $v0, 4
        syscall
        j end
    greater:
        la $a0, msg1
        li $v0, 4
        syscall
        j end
    lesser:
        la $a0, msg3
        li $v0, 4
        syscall
        j end
    end:
        li $v0, 10
        syscall
    .end main
```

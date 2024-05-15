.data
    msg1: .asciiz "The string is not a palindrome!"
    msg2: .asciiz "The string is a palindrome!" 
    # t0 = counter for how many letters are input
    # t1 = newline character
    # t2 = first 2, then the number of letters to check
    # t3 = last added letter
    # t4 = address of the first added letter
    # t5 = register only used to reset the stack pointer

.text
    .globl main
    .ent main
    main:
        li $t0, 0
        li $t1, 10
        li $t2, 2
        move $t4, $sp
        move $t5, $sp
    while:
        li $v0, 12
        syscall
        beq $v0, $t1, end
        addi $sp, $sp, -1
        sb $v0, ($sp)
        addi $t0, $t0, 1
        j while
    end:
        beq $t2, $0, good_ending
        div $t0, $t2
        mflo $t2
        lb $t3, ($sp)
        lb $t6, -1($t4)
        bne $t3, $t6, error
        addi $sp, $sp, 1
        addi $t4, $t4, -1
        addi $t2, $t2, -1
        j end
    good_ending:
        li $v0, 4
        la $a0, msg2
        syscall
        move $sp, $t5
        li $v0, 10
        syscall
    error:
        li $v0, 4
        la $a0, msg1
        syscall
        move $sp, $t5
        li $v0, 10
        syscall
    .end main


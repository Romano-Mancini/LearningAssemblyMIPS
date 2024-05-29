.data
    matrix: 
            .word 3
            .word 1
            .word 2
            .word 1
            .word 4 
            .word 1
            .word 2
            .word 1
            .word 3
.text
    .globl main
    .ent main
    main:
        la $t0, matrix
        lw $a0, ($t0)
        lw $a1, 4($t0)
        lw $a2, 8($t0)
        lw $a3, 12($t0)
        addi $sp, $sp, -20
        lw $t1, 16($t0)
        sw $t1, ($sp)
        lw $t1, 20($t0)
        sw $t1, 4($sp)
        lw $t1, 24($t0)
        sw $t1, 8($sp)
        lw $t1, 28($t0)
        sw $t1, 12($sp)
        lw $t1, 32($t0)
        sw $t1, 16($sp)

        jal determinant3x3
        addi $sp, $sp, 20
        move $a0, $v0
        
        li $v0, 1
        syscall
        
        li $v0, 10
        syscall
        
    determinant3x3:
        # stores the return address into the stack
        addi $sp, $sp, -4
        sw $ra, ($sp)

        addi $sp, $sp, -16
        sw $a0, ($sp)
        sw $a1, 4($sp)
        sw $a2, 8($sp)
        sw $a3, 12($sp)

        lw $a0, 20($sp)
        lw $a1, 24($sp)
        lw $a2, 32($sp)
        lw $a3, 36($sp)
        jal determinant2x2
        lw $a1, 0($sp)
        mul $s0, $a1, $v0

        lw $a0, 12($sp)
        lw $a1, 24($sp)
        lw $a2, 28($sp)
        lw $a3, 36($sp)
        jal determinant2x2
        lw $a1, 4($sp)
        mul $s1, $a1, $v0

        lw $a0, 12($sp)
        lw $a1, 20($sp)
        lw $a2, 28($sp)
        lw $a3, 32($sp)
        jal determinant2x2
        lw $a1, 8($sp)
        mul $s2, $a1, $v0

        li $v0, 0
        add $v0, $v0, $s0
        sub $v0, $v0, $s1
        add $v0, $v0, $s2
        addi $sp, $sp, 16
        
        lw $ra, ($sp)
        addi $sp, $sp, 4
        jr $ra 

    determinant2x2:
        mul $t0, $a0, $a3
        mul $t1, $a1, $a2
        sub $v0, $t0, $t1
        jr $ra
    .end main


# stack:
#    9th matrix element
#    8th matrix element
#    7th matrix element
#    6th matrix element
#    5th matrix element
#    $ra
#    4th matrix element
#    3rd matrix element
#    2nd matrix element
#    1st matrix element

# expected result:
#   18
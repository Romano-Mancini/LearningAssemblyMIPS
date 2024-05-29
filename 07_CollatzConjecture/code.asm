	.data
.text
    .globl main
    .ent main
    main:
        li $a0, 19
        li $a1, 2
        li $a2, 3
        li $a3, 1
        jal CollatzProcedure
        
        move $a0, $v0
        li $v0, 1
        syscall
        
        li $v0, 10
        syscall

    CollatzProcedure:
        beq $a0, $t1, end
        li $t1, 1
        div $a0, $a1
        mfhi $t0
        addi $a3, $a3, 1
        beq $t0, $0, even

        mul $a0, $a2, $a0
        addi $a0, $a0, 1
        addi $sp, $sp, -4
        sw $ra, ($sp)
        jal CollatzProcedure
        lw $ra, ($sp)
        addi $sp, $sp, 4
        jr $ra

        even:
            div $a0, $a0, $a1
            addi $sp, $sp, -4
            sw $ra, ($sp)
            jal CollatzProcedure
            lw $ra, ($sp)
            addi $sp, $sp, 4
            jr $ra
        
        end:
            move $v0, $a3
            jr $ra
        
    .end main
.data
.text
    .globl main
    .ent main
    main:
        li $t0, 4
        li $t1, 2
        li $t2, -5
        li $t3, 3
        li $s0, 8
        li $s1, 4
        li $s2, 27
        li $s3, 9
        li $s4, 64
        li $s5, 16
        li $a0, 0
        li $a1, 0
        li $a2, 0
        li $a3, 0

        add $a0, $t0, $t1
        add $a0, $a0, $t2
        add $a0, $a0, $t3

        mul $a1, $t0, $s0
        mul $t4, $t1, $s1
        li $t5, 2
        mul $t6, $t2, $t5
        add $a1, $a1, $t4
        add $a1, $a1, $t6
        add $a1, $a1, $t3

        li $t7, 3
        mul $t4, $t0, $s2
        mul $t5, $t1, $s3
        mul $t6, $t2, $t7
        add $a2, $a2, $t4
        add $a2, $a2, $t5
        add $a2, $a2, $t6
        add $a2, $a2, $t3

        li $t7, 4
        mul $t4, $t0, $s4
        mul $t5, $t1, $s5
        mul $t6, $t2, $t7
        add $a3, $a3, $t4
        add $a3, $a3, $t5
        add $a3, $a3, $t6
        add $a3, $a3, $t3

        addi $sp, $sp, -20
        sw $t0, ($sp) 
        sw $t1, 4($sp) 
        sw $t2, 8($sp) 
        sw $t3, 12($sp) 

        li $t7, 7 # N
        sw $t7, 16($sp)

        jal polynomial

        lw $t0, ($sp) 
        lw $t1, 4($sp) 
        lw $t2, 8($sp) 
        lw $t3, 12($sp) 
        lw $t7, 16($sp)
        addi $sp, $sp, 20

        move $a0, $v0
        li $v0, 1
        syscall
        li $v0, 10
        syscall

    polynomial:
        addi $sp, $sp, -24
        sw $s0, ($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $s3, 12($sp)
        sw $s4, 16($sp)
        sw $s5, 20($sp)

        sub $t0, $a1, $a0
        sub $t1, $a2, $a1
        sub $t2, $a3, $a2
        sub $s0, $t1, $t0
        sub $s1, $t2, $t1
        sub $s2, $s1, $s0
        move $v0, $a3

        li $t3, 0
        addi $t7, $t7, -4

        loop:
            beq $t3, $t7, end
            add $s1, $s1, $s2
            add $t2, $t2, $s1
            add $v0, $v0, $t2
            addi $t3, $t3, 1
            j loop  
    
        end:
            lw $s0, ($sp)
            lw $s1, 4($sp)
            lw $s2, 8($sp)
            lw $s3, 12($sp)
            lw $s4, 16($sp)
            lw $s5, 20($sp)
            addi $sp, $sp, 24
            jr $ra
    .end main
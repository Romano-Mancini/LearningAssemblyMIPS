.data
.text
    .globl main
    .ent main
    # a0: n, a1: k
    main:
        li $a0, 12
        li $a1, 2
        jal simple_combinations
        move $a0, $v0
        li $v0, 1
        syscall
        li $v0, 10
        syscall
    .end main

    # t0: current value of n, $t1: 1, $t2: current numerator, $t3: n-k+1, $t4: current denominator, $t5: current value of k
    simple_combinations:
        move $t0, $a0
        li $t1, 1
        li $t2, 1
        sub $t3, $a0, $a1
        addi $t3, $t3, 1
        move $t5, $a1
        li $t4, 1
        loop:
            blt $t0, $t3, denominator
            mul $t2, $t2, $t0
            addi $t0, $t0, -1 
            j loop
        denominator:
            beq $t5, $t1, end
            mul $t4, $t4, $t5
            addi $t5, $t5, -1
            j denominator
        end:
            div $v0, $t2, $t4
            jr $ra
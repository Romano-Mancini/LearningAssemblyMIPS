DIM = 5
.data
    arr1:       .word 56, 12, 98, 129, 58
    arr2:       .word 1, 0, 245, 129, 12
    result:     .space DIM
.text
    .globl main
    .ent main
    main:
        la $a0, arr1
        la $a1, arr2
        la $a2, result
        li $a3, DIM
        jal ComputeHammingDistance

        # result printing procedure
        li $t0, 0
        la $a2, result
        print_loop:
            beq $t0, $a3, end_program
            lb $a0, ($a2)
            li $v0, 1
            syscall
            li $a0, 32
            li $v0, 11
            syscall
            addi $a2, $a2, 1
            addi $t0, $t0, 1
            j print_loop
            
        end_program:
            li $v0, 10
            syscall
    
    ComputeHammingDistance:
        # $t0: counter word, $t1: counter bit, $t4: DIM, $t5 = 32 (word dim), $t6: partial Hamming Distance
        li $t0, 0
        li $t4, DIM
        li $t5, 32
        outer_loop:
            li $t6, 0
            beq $t0, $t4, end
            li $t1, 0
            lw $t2, ($a0)
            lw $t3, ($a1)
            xor $t2, $t2, $t3
            inner_loop:
                beq $t1, $t5, save
                andi $t7, $t2, 1
                add $t6, $t6, $t7
                srl $t2, $t2, 1
                addi $t1, $t1, 1
                j inner_loop
            save:
                sb $t6, ($a2)
                addi $a2, $a2, 1
                addi $t0, $t0, 1
                addi $a0, $a0, 4
                addi $a1, $a1, 4
                j outer_loop
        end:
            jr $ra
    .end main
.data
    matrix:
        .word 1, 2, 1
        .word 2, 5, 3    
        .word 1, 3, 0    
    dim: .word 3
.text
    .globl main
    .ent main
main:
        # $t0 = dim
        la $t0, dim
        lw $t0, ($t0)

        # $t1 = matrix address
        la $t1, matrix

        # $t2 = counter
        li $t2, 0

        # $t3 = max_counter
        mul $t3, $t0, $t0

        # check if it's diagonal, $t4 = zero counter
        diagonal:
            beq $t2, $t3, end_diagonal      # check if the matrix is finished
            beq $t2, $0, ver_div_zero       # check if it's the first element of the matrix
            beq $t4, $t0, ver_div_zero      # check if it's on the diagonal
            # check if there are zeros not on the diagonal,
            lw $t5, ($t1)
            bne $t5, $0, out_of_diagonal
            addi $t2, $t2, 1
            addi $t4, $t4, 1
            addi $t1, $t1, 4
            j diagonal

            ver_div_zero:
                li $t4, 0
                lw $t5, ($t1)
                addi $t1, $t1, 4
                addi $t2, $t2, 1
                beq $t5, $0, out_of_diagonal
                j diagonal

            end_diagonal:
                li $a0, 2
                li $v0, 1
                syscall
    
        # $t0 = dim, $t1 = matrix address, $t2 = counter, $t3 = max_counter, $t4 = i, $t5 = j
        out_of_diagonal:
            la $t1, matrix
            li $t2, 0
            li $t4, 0
            li $t5, 0

        symmetric:
            beq $t2, $t3, good_end_symmetric
            beq $t5, $t0, update_indexes
            bne $t4, $t5, check_equal
            addi $t5, $t5, 1
            addi $t2, $t2, 1
            j symmetric

        update_indexes:
            li $t5, 0
            addi $t4, $t4, 1
            j symmetric

        check_equal:
            # address + (i*dim + j)*sizeof(int) = address + (j*dim + i)*sizeof(int)?
            mul $t6, $t4, $t0
            add $t6, $t6, $t5
            sll $t6, $t6, 2
            add $t6, $t6, $t1

            mul $t7, $t5, $t0
            add $t7, $t7, $t4
            sll $t7, $t7, 2
            add $t7, $t7, $t1

            lw $t6, ($t6) 
            lw $t7, ($t7)
            bne $t6, $t7, bad_end_symmetric 

            addi $t5, $t5, 1
            addi $t2, $t2, 1
            j symmetric

        good_end_symmetric:
            li $a0, 1
            li $v0, 1
            syscall
            li $v0, 10
            syscall

        bad_end_symmetric:
            li $a0, 0
            li $v0, 1
            syscall
            li $v0, 10
            syscall
    .end main

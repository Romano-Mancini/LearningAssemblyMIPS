.data
    msg: .asciiz "*"
    msg2: .asciiz "\n"
.text
    .globl main
    .ent main
    main:
        li $a0, 8
        jal printTriangle
        jal printSquare
        li $v0, 10
        syscall

    .end main

    # $t0: rows counter
    # $t1: current column counter
    # $t2: max_stars to print at that row   
    printTriangle:
        li $t0, 0
        li $t2, 0
        outer_loop1:
            beq $t0, $a0, end_loop1
            addi $t0, $t0, 1
            li $t1, 0
            addi $t2, $t2, 1
            inner_loop1:
                beq $t1, $t2, end_inner_loop1
                addi $sp, $sp, -4
                sw $a0, ($sp)
                la $a0, msg
                li $v0, 4
                syscall
                lw $a0, ($sp)
                addi $sp, $sp, 4
                addi $t1, $t1, 1
                j inner_loop1
            j outer_loop1
            end_inner_loop1:
                la $a0, msg2
                li $v0, 4
                syscall
                li $a0, 8
                j outer_loop1
        end_loop1:
            jr $ra

    # t0: rows counter
    # t1: current columns counter
    printSquare:
        li $t0, 0
        li $t1, 0
        outer_loop2:
            addi $t0, $t0, 1
            beq $t0, $a0, end_loop1
            li $t1, 0
            inner_loop2:
                beq $t1, $a0, end_inner_loop2
                addi $sp, $sp, -4
                sw $a0, ($sp)
                la $a0, msg
                li $v0, 4
                syscall
                lw $a0, ($sp)
                addi $sp, $sp, 4
                addi $t1, $t1, 1
                j inner_loop2
            j outer_loop2
            end_inner_loop2:
                la $a0, msg2
                li $v0, 4
                syscall
                li $a0, 8
                j outer_loop2
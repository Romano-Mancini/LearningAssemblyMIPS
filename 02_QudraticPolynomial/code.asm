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

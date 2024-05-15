.data
    input_fac: .asciiz "\n\nFactorial: "
    input_retry: .asciiz "\nRetry? [y/n] "
    msg_result: .asciiz "Result: "
    msg_undefined: .asciiz "undefined"
    msg_thanks: .asciiz "\n Thank you!\n\n"


.text
.globl main

main:
    li $v0, 4
    la $a0, input_fac
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0 msg_result
    syscall
    move $t2, $t1


    beq $t1, 0, is_one
    beq $t1, 1, is_one
    blt $t1, 0, undefined
    bgt $t1, 0, factorial


is_one:
    li $v0, 1
    li $a0, 1
    syscall
    j retry

undefined:
    li $v0, 4
    la $a0, msg_undefined
    syscall
    j retry

factorial:
    sub $t2, $t2, 1
    mul $t1, $t1, $t2
    bne $t2, 1, factorial

    li $v0, 1
    move $a0, $t1
    syscall

    j retry


retry:
    li $v0, 4
    la $a0, input_retry
    syscall

    li $v0, 12
    syscall

    beq $v0, 110, exit
    beq $v0, 121, main
    j retry


exit:
    li $v0, 4
    la $a0, msg_thanks
    syscall

    li $v0 10
    syscall


.data
    msg_instruction: .asciiz "\n\nEnter your numbers"
    prompt_num1: .asciiz "\nNum 1: "
    prompt_num2: .asciiz "Num 2: "
    prompt_operation: .asciiz "\nChoose your operation\n  [1] Addition\n  [2] Subtraction\n  [3] Multiplication\n  [4] Division\n"
    prompt_retry: .asciiz "\nRetry? [y/n] "
    msg_result: .asciiz "\nResult: "
    msg_thanks: .asciiz "\nThank you!\n\n"


.text
.globl main

main:
    li $v0, 4
    la $a0, msg_instruction
    syscall

    li $v0, 4
    la $a0, prompt_num1
    syscall
    li $v0, 6
    syscall
    mov.s $f1, $f0

    li $v0, 4
    la $a0, prompt_num2
    syscall
    li $v0, 6
    syscall
    mov.s $f2, $f0

    li $v0, 4
    la $a0, prompt_operation
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msg_result
    syscall

    beq $t1, 1, plus
    beq $t1, 2, minus
    beq $t1, 3, times
    beq $t1, 4, divide

plus:
    add.s $f12, $f1, $f2
    j retry

minus:
    sub.s $f12, $f1, $f2
    j retry

times:
    mul.s $f12, $f1, $f2
    j retry
    
divide:
    div.s $f12, $f1, $f2
    j retry


retry:
    li $v0, 2
    syscall

    li $v0, 4
    la $a0, prompt_retry
    syscall

    li $v0, 12
    syscall

    beq $v0, 121, main
    beq $v0, 110, exit




exit:
    li $v0, 4
    la $a0, msg_thanks
    syscall

    li $v0, 10
    syscall
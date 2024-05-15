##################################################################################################################
##                                                                                                              ##
##    MIPS Assembly Program for Basic Arithmetic Operations                                                     ##
##                                                                                                              ##
##    This program prompts the user to enter two numbers and select an arithmetic operation (Addition,          ##
##    Subtraction, Multiplication, Division). It then performs the selected operation and displays the result.  ##
##    After displaying the result, it asks the user if they want to retry or exit.                              ##
##                                                                                                              ##
##################################################################################################################

.data
    smg_instruction:    .asciiz "\nPlease enter your numbers"
    prompt_num1:        .asciiz "\nNum 1: "
    prompt_num2:        .asciiz "Num 2: "
    prompt_op:          .asciiz "\nSelect an operation: \n   [1] Addition\n   [2] Subtraction\n   [3] Multiplication\n   [4] Division\n"
    prompt_retry:       .asciiz "\n\nRetry? \n   [1] Yes\n   [0] No\n"
    msg_thanks:         .asciiz "\nThank you!\n\n"
    msg_result:         .asciiz "\nResult: "
    msg_remainder:      .asciiz " r."

.text
    .globl main

main:
    # Display instruction message
    li $v0, 4
    la $a0, smg_instruction
    syscall

    # Prompt for the first number
    li $v0, 4
    la $a0, prompt_num1
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Prompt for the second number
    li $v0, 4
    la $a0, prompt_num2
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Prompt to select an operation
    li $v0, 4
    la $a0, prompt_op
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    # Display result message
    li $v0, 4
    la $a0, msg_result
    syscall

    # Check the operation selected and perform the corresponding arithmetic
    beq $t3, 1, plus
    beq $t3, 2, minus
    beq $t3, 3, times
    beq $t3, 4, divide

plus:
    add $a0, $t1, $t2
    j print_res

minus:
    sub $a0, $t1, $t2
    j print_res

times:
    mul $a0, $t1, $t2
    j print_res

divide:
    div $t1, $t2
    li $v0, 1
    mflo $a0
    syscall

    # Display remainder for division
    li $v0, 4
    la $a0, msg_remainder
    syscall

    li $v0, 1
    mfhi $a0
    syscall
    j retry

print_res:
    li $v0, 1
    syscall
    j retry

retry:
    # Prompt to retry or exit
    li $v0, 4
    la $a0, prompt_retry
    syscall

    li $v0, 5
    syscall

    # Check user's choice and either restart or exit
    beq $v0, 1, main
    beq $v0, 0, exit

exit:
    # Display thank you message and exit
    li $v0, 4
    la $a0, msg_thanks
    syscall

    li $v0, 10
    syscall

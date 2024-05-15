.data   
promp1:     .asciiz "Num 1: "
promp2:     .asciiz "Num 2: "
promp3:     .asciiz "\n  [1] Addition\n  [2] Subtraction\n  [3] Multiplication\n  [4] Division\nEnter your operation: "
sum_msg:    .asciiz "\nSum: "
diff_msg:   .asciiz "\nDifference: "
prod_msg:   .asciiz "\nProduct: "
quot_msg:   .asciiz "\nQuotient: "
rem_msg:    .asciiz " r."

.text   
            .globl  main

main:       
    # get user input for num1
    li      $v0,    4
    la      $a0,    promp1
    syscall 
    li      $v0,    5
    syscall 
    move    $s0,    $v0

    # get user input for num2
    li      $v0,    4
    la      $a0,    promp2
    syscall 
    li      $v0,    5
    syscall 
    move    $s1,    $v0

    # get operation
    li      $v0,    4
    la      $a0,    promp3
    syscall 
    li      $v0,    5
    syscall 
    move    $s2,    $v0

    beq     $s2,    1,        addition            # If $s2 == 1, jump to addition
    beq     $s2,    2,        subtraction         # If $s2 == 2, jump to subtraction
    beq     $s2,    3,        multiplication      # If $s2 == 3, jump to multiplication
    beq     $s2,    4,        division            # If $s2 == 4, jump to division


addition:   
    li      $v0,    4
    la      $a0,    sum_msg
    syscall 
    li      $v0,    1
    add     $a0,    $s0,        $s1
    syscall 
    j       terminate     # Jump to terminate

subtraction:
    li      $v0,    4
    la      $a0,    diff_msg
    syscall 
    li      $v0,    1
    sub     $a0,    $s0,        $s1
    syscall 
    j       terminate     # Jump to terminate

multiplication:
    li      $v0,    4
    la      $a0,    prod_msg
    syscall 
    li      $v0,    1
    mul     $a0,    $s0,        $s1
    syscall 
    j       terminate     # Jump to terminate

division:   
    div     $s0,    $s1
    mflo    $s0   # quotient
    mfhi    $s1   # remainder

    li      $v0,    4
    la      $a0,    quot_msg
    syscall 
    li      $v0,    1
    move    $a0,    $s0
    syscall 

    li      $v0,    4
    la      $a0,    rem_msg
    syscall 
    li      $v0,    1
    move    $a0,    $s1
    syscall 

    j       terminate     # Jump to terminate

terminate:  
    li      $v0,    10
    syscall 
.data   
promp1:     .asciiz "Num 1: "
promp2:     .asciiz "Num 2: "
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

    # move to co-processor for float operation
    mtc1    $s0,    $f1
    mtc1    $s1,    $f2           

    # add
    li      $v0,    4
    la      $a0,    sum_msg
    syscall 
    li      $v0,    1
    add     $a0,    $s0,        $s1
    syscall 

    # minus
    li      $v0,    4
    la      $a0,    diff_msg
    syscall 
    li      $v0,    1
    sub     $a0,    $s0,        $s1
    syscall 

    # times
    li      $v0,    4
    la      $a0,    prod_msg
    syscall 
    li      $v0,    1
    mul     $a0,    $s0,        $s1
    syscall 

    # div
    li      $v0,    4
    la      $a0,    quot_msg
    syscall 

    div     $s0,    $s1
    mflo    $s2
    mfhi    $s3

    li      $v0,    1
    move    $a0,    $s2
    syscall 

    li      $v0,    4
    la      $a0,    rem_msg
    syscall 

    li      $v0,    1
    move    $a0,    $s3
    syscall 

    li      $v0,    4
    la      $a0,    quot_msg
    syscall 
    li      $v0,    2
    div.s   $f12,   $f1,        $f2
    syscall 

    # terminate
    li      $v0,    10
    syscall 

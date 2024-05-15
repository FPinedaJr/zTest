.data   
input_1:    .asciiz "Input 1: "
input_2:    .asciiz "Input 2: "

sum:        .asciiz "Sum: "
diff:       .asciiz "Difference: "
prod:       .asciiz "Product: "
quot:       .asciiz "Quotient: "

new_line:   .asciiz "\n"

.text   
            .globl  main

main:       
    # USER PROMPT

    # Prints input_1
    la      $a0,    input_1
    li      $v0,    4
    syscall 

    # Reads  user input
    li      $v0,    5
    syscall 

    # Moves input to temp 1
    move    $t1,    $v0

    # Prints input_2
    la      $a0,    input_2
    li      $v0,    4
    syscall 

    # Reads user input
    li      $v0,    5
    syscall 

    # Moves input to temp 2
    move    $t2,    $v0


    # NEW LINE
    la      $a0,    new_line
    li      $v0,    4
    syscall 

    # Process:
    #     $t1 = first input, $t2 = second input
    #     do operation on $t1 and $t2
    #     store result in $t0
    #     print the results
    #     repeat


    # ADDITION
    add     $t0,    $t1,        $t2

    # Prints sum
    la      $a0,    sum
    li      $v0,    4
    syscall 

    move    $a0,    $t0
    li      $v0,    1
    syscall 


    # NEW LINE
    la      $a0,    new_line
    li      $v0,    4
    syscall 


    # SUBTRACTION
    sub     $t0,    $t1,        $t2

    # prints difference
    la      $a0,    diff
    li      $v0,    4
    syscall 

    move    $a0,    $t0
    li      $v0,    1
    syscall 


    # NEW LINE
    la      $a0,    new_line
    li      $v0,    4
    syscall 


    # MULTIPLICATION
    mul     $t0,    $t1,        $t2

    # prints product
    la      $a0,    prod
    li      $v0,    4
    syscall 

    move    $a0,    $t0
    li      $v0,    1
    syscall 


    # NEW LINE
    la      $a0,    new_line
    li      $v0,    4
    syscall 


    # DIVISION
    mtc1    $t1,    $f1
    mtc1    $t2,    $f2

    div.s   $f12,   $f1,        $f2

    # prints quotient
    la      $a0,    quot
    li      $v0,    4
    syscall 

    li      $v0,    2
    syscall 


    # Exit the program
    li      $v0,    10
    syscall 
.data   
num1:   .word   60
num2:   .word   9

.text   
        .globl  main

main:   
    lw      $t0,    num1
    lw      $t1,    num2

    mult    $t0,    $t1
    mflo    $s0     # mflo = move from lo

    li      $v0,    1
    move    $a0,    $s0
    syscall 

    li      $v0,    10
    syscall 

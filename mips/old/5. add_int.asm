.data   
num1:   .word   60
num2:   .word   9

.text   
        .globl  main

main:   
    lw      $s0,    num1
    lw      $s1,    num2

    li      $v0,    1
    add     $a0,    $s0,    $s1
    syscall 

    li      $v0,    10
    syscall 
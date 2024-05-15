.data   
num1:   .word   9
num2:   .word   60

.text   
        .globl  main

main:    
    lw      $s0,    num1    
    lw      $s1,    num2

    li      $v0,    1
    sub     $a0,    $s0,    $s1
    syscall 

    li      $v0,    10
    syscall 
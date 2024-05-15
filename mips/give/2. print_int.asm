.data   
num:    .word   69

.text   
        .globl  main

main:   
    li      $v0,    1   # means you want to print an integer
    lw      $a0,    num # load word(int)
    syscall 

    li      $v0,    10
    syscall 
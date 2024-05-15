.data   
char:   .byte   'x'        # characters must be enclosed with single quotes not double

.text   
        .globl  main
main:   
    li      $v0,    4
    la      $a0,    char
    syscall 

    li      $v0,    10
    syscall 
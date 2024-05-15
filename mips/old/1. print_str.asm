
# for declaring and assigning variable
.data   
msg:    .asciiz "hello, world\n"   # string must be enclosed with double quotes not single 

.text   
        .globl  main

main:   
    li      $v0,    4     # means you want to print a str
    la      $a0,    msg
    syscall 

    li      $v0,    10
    syscall 
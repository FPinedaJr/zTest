.data   
pi: .float  3.14

.text   
    .globl  main

main:
    li      $v0,    2
    lwc1    $f12,    pi # load from co-processor, must use f12 
    syscall 

    li      $v0,    10
    syscall 



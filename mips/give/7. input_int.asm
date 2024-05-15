.data
    prompt: .asciiz "Enter a number: "
    msg: .asciiz "Your number is "


.text
.globl main

main:

# print the promp
li $v0, 4   
la $a0, prompt
syscall

# get userinput
li $v0, 5   # read input
syscall
move $t0, $v0 # move to temporary variable since $v0 will be overwritten

# print the msg
li $v0, 4
la $a0, msg
syscall

# print the number(int) from input
li $v0, 1
move $a0, $t0
syscall




li $v0, 10
syscall
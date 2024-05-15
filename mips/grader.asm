.data
    msg_thanks: .asciiz "\nThank you!\n\n"
    msg_invalid: .asciiz "\nerror: invalid"
    msg_ave_grade: .asciiz "\nAverage: "
    msg_failed: .asciiz "\nSorry, you failed"
    msg_passed: .asciiz "\nSo you passed huh..."
    msg_honor: .asciiz "\nCongrats, your with honor"
    msg_highest: .asciiz "\nWow! You are with highest honor"
    input_subs: .asciiz "\n\nHow many subject do you have? "
    input_retry: .asciiz "\n\nRetry? [y/n] "
    input_grade: .asciiz "Subject "
    colon: .asciiz " : "
    zero_g: .float 0.0
    fail_g: .float 75.0
    pass_g: .float 90.0
    honor_g: .float 95.0
    highest_g: .float 100.0

# f1 = num of subs(float)
# f2 = average grade(float)
# f3 = running grade(float)
# t1 = num of subs(float)
# t2 = counter (int)
# t3 = running grade (int)


.text
.globl main
main:
    li $t1, 0
    li $t2, 0
    li $t3, 0
    lwc1 $f1, zero_g
    lwc1 $f2, zero_g
    lwc1 $f3, zero_g


    li $v0, 4
    la $a0, input_subs
    syscall

    li $v0, 5
    syscall
    move $t1, $v0


    move $s0, $t1
    mtc1 $s0, $f1
    cvt.s.w $f1, $f1

    li $t2, 1

    ble $t1, 0, invalid
    j get_grade





get_grade:
    li $v0, 4
    la $a0, input_grade
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, colon
    syscall

    li $v0, 5
    syscall

    add $t3, $t3, $v0  
    addi $t2, $t2, 1

    bgt $t2, $t1, get_average
    j get_grade


get_average:
    move $s0, $t3
    mtc1 $s0, $f3
    cvt.s.w $f3, $f3

    div.s $f2, $f3, $f1
    
    li $v0, 4
    la $a0, msg_ave_grade
    syscall

    li $v0, 2
    mov.s $f12, $f2
    syscall

    j categorize_grade

categorize_grade: 
    lwc1 $f4, zero_g
    lwc1 $f5, fail_g
    lwc1 $f6, pass_g
    lwc1 $f7, honor_g
    lwc1 $f8, highest_g
    c.le.s $f2, $f4
    bc1t invalid
    c.lt.s $f2, $f5
    bc1t failed
    c.lt.s $f2, $f6
    bc1t passed
    c.lt.s $f2, $f7
    bc1t honor
    c.le.s $f2, $f8
    bc1t highest
    j  invalid

failed:
    li $v0, 4
    la $a0, msg_failed
    syscall
    j retry
passed:
    li $v0, 4
    la $a0, msg_passed
    syscall
    j retry
honor:
    li $v0, 4
    la $a0, msg_honor
    syscall
    j retry
highest:
    li $v0, 4
    la $a0, msg_highest
    syscall
    j retry


invalid:
    li $v0, 4
    la $a0, msg_invalid
    syscall
    j retry


retry:
    li $v0, 4
    la $a0, input_retry
    syscall

    li $v0, 12
    syscall

    beq $v0, 121, main
    beq $v0, 110, exit
    j retry




exit:
    li $v0, 4
    la $a0, msg_thanks
    syscall

    li $v0, 10
    syscall
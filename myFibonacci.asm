.data
n: .word 1
printf: .asciiz "n= "

.text
lw $t1, n($zero)
lw $t3, n($zero)
li $v0, 4
la $a0, printf
syscall

li $v0, 5
syscall
move $t0, $v0
fibo: 	beq $t0, $zero, end
	addi $a0, $t3, 0
	li $v0, 1
	syscall
	add $t3, $t1, $t2
	addi $t2, $t1, 0
	addi $t1, $t3, 0
	addi $t0, $t0, -1
	j fibo


end: li $v0, 10
	syscall
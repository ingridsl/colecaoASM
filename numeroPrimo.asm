.data
n: .word 0
np: .word 0
printf: .asciiz "n= "
mensagem1: .asciiz "o "
mensagem2: .asciiz "-ésimo primo é: "

.text

li $v0, 4
la $a0, printf
syscall

li $v0, 5
syscall
move $t0, $v0
li $t1, 1
li $t4, 0

primo:	beq $t3, $t0, end
	li $t5, 2
	div $t1, $t5
	mfhi $t2
	jal guarda1
guarda1:beq $t1, $t5, igual

igual:	li $t5, 0
	bne $t2, $zero, quase
	li $t5, 3
	div $t1, $t5
	mfhi $t2
	jal guarda2
guarda2:beq $t1, $t5,  igual1
	bne $t2, $zero, quase
	li $t5, 5
	div $t1, $t5
	mfhi $t2
	jal guarda3
guarda3:beq $t1, $t5,  igual2

	bne $t2, $zero, quase
	li $t5, 7
	div $t1, $t5
	mfhi $t2
	jal guarda4
guarda4:beq $t1, $t5,  igual3

	bne $t2, $zero, quase
	li $t5, 11
	div $t1, $t5
	mfhi $t2
	jal guarda5
guarda5:beq $t1, $t5,  igual4

	bne $t2, $zero, quase
	beq $t4, 5, sucesso
	addi $t1, $t1, 1
	li $t4, 0
	j primo
	
quase: 	mflo $t6
	#beq $t1, $t5, igual
	bgt $t6, $t1, volta
	
	addi $t4, $t4, 1
	li $t2, 0
volta:	jr $ra

sucesso:move $a0, $t1
	#li $v0, 1
	#syscall
	move $a1, $a0
	addi $t0, $t0, -1
	addi $t1, $t1, 1
	li $t4, 0
	j primo
	
	
end: 	
	move $a0, $a1
	li $v0, 1
	syscall


	li $v0, 10
	syscall

igual1:	li $t5, 0
	li $t2, 1
	j guarda2
igual2:	li $t5, 0
	li $t2, 1
	j guarda3
igual3:	li $t5, 0
	li $t2, 1
	j guarda4
igual4:	li $t5, 0
	li $t2, 1
	j guarda5
	
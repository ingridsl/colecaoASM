.data
size:  .word 0
message1: .asciiz "Informe numero de linhas e colunas"
message2: .asciiz "Informe os elementos da matriz"

.text
	li $v0, 4
	la $a0, message1
	syscall
	
	la $v0, 5 #espera valor
	syscall
	move $t0 $v0
	add $t7, $t7, $t0
	
	addi $t9, $t0, 0
	li $t8, 1
	#mul $t0, $t0, 2
	#li $t0, 9
	#la $t1, matriz
	la $t1, 0x2080
	la $t4, 0x2080
	
loop1:  beq $t0, $zero, loop2 #t0, t1, t2

	li $v0, 4
	la $a0, message2
	syscall

	la $v0, 5 #espera valor
	syscall
	move $t2, $v0
	sw $t2, 0($t1)
	#add $t1, $t1, $t2
	
	#li $v0, 1
	#lw $a0, 0($t1)
	#syscall
	
	  
	addi $t0, $t0, -1
	addi $t1, $t1, 4
	j loop1
	
loop2: 	beq $t9, $zero, exit #t8, t7, t4, t5, t6
	
	
	li $v0, 4
	la $a0, message2
	syscall

	la $v0, 5 #espera valor
	syscall
	move $t5, $v0
	lw $s0, 0($t4)
	add $s0, $s0, $t5
	sw $s0, 0($t4)
	#add $t6, $t6, $t5
	li $s0, 0
	
	#li $v0, 1
	#lw $a0, 0($t1)
	#syscall
	
	
	#add $t0, $t7, $t0
	addi $t9, $t9, -1
	addi $t4, $t4, 4
	
	j loop2
	
exit:  addi $2, $0, 10
	syscall

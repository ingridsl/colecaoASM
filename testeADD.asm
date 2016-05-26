.data
addia: .word 4
primos: .word 1, 3, 5, 7, 11, 13, 17, 19
size: .word 8
msg: .asciiz "Os oito primeiros numeros primos sao : "
space: .ascii " "

.text

	la $t0, primos		#carrega endereco inicial do array
	#la $t1, size		#carrega endereco de size
	addi $9, $0, 8228
	lw $t1, 0($t1)		#carrega size em t1
	#li $v0, 4		#imprime mensagem inicial
	addi $v0, $0, 8192
	#la $a0, msg
	#syscall
	addi $2, $0, 4
	addi $4, $0, 8232
	#li $v0, 4		#imprime mensagem inicial
	#la $a0, msg
	syscall
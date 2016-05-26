.data
get_n: .asciiz "Coloque valor de n: "

.text

li $v0, 4		#imprime mensagem inicial
la $a0, get_n		#load adress to be printed into a0
syscall

la $v0, 5 #espera valor
syscall
#sw $v0, 0x2040
move $t0, $v0

la $v0, 4
li $v0, 1		#imprime
syscall

exit: li $v0, 10 #terminate program
	syscall

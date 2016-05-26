.data
mensagem: .asciiz "\nDigite uma string\n"
mensagem_inicial: .asciiz "\nDigite o numero \n 1. Entrar string \n 2. Caixa alta \n 3. Caixa baixa \n 4. Tamanho\n 5. Conta caracteres\n 6. Conta dígitos\n 7. Concatena\n 8. Encerra\n"
buffer: .space 100

.text

menu: 	beq $t0, 8, end
	li $t3, 100
	li $t5, 0
	la $a1, buffer
	la $t0, mensagem_inicial
	li $v0, 4
	la $a0, mensagem_inicial		
	syscall #imprime menu na tela
	
	li $v0,5 #recebe valor da resposta
	syscall
	
	move $t0, $v0
	beq $t0, 1, entrar #opções de funções - inserir string
	beq $t0, 2, alta #opções de funções - caixa alta
	beq $t0, 3, baixa #opções de funções - caixa baixa
	beq $t0, 4, tam #opções de funções - tamanho string
	beq $t0, 5, carac #opções de funções - caracteres alfanumericos
	beq $t0, 6, digi #opções de funções - digitos
	beq $t0, 7, concat #opções de funções - concatenar
	j menu


entrar:	la $t1, mensagem #escrever string na memoria
	li $v0, 4
	la $a0, mensagem		
	syscall #imprime mensagem

	li $v0,8 #pega o input
	move $a0, $a1 #carrega endereço
	li $a1, 100 #aloca espaço para string
	move $t1,$a0 #salva string
	syscall

	la $a0, buffer
	move $a0,$t1
	li $v0,4
	syscall
	j menu
	
print: 	la $a0, buffer #imprimir texto
	move $a0,$t1
	li $v0,4
	syscall
	j menu
	
alta:	beq $t3, $zero, print #deixar texto em caixa alta
	lb $t4, 0($a1)
	beq $t4, 0x0a, print
	beq $t4, 0x00, print
	bgt $t4, 96, pulaA
	addi $t4, $t4, -32 #subtrai 32 do ascii
pulaA:
	sb $t4, 0($a1)
	addi $a1, $a1, 1

	addi $t3, $t3, -1
	j alta

baixa:	beq $t3, $zero, print #deixar texto em caixa baixa

	lb $t4, 0($a1)
	beq $t4, 0x0a, print
	beq $t4, 0x00, print
	blt $t4, 96, pulaB
	addi $t4, $t4, +32 #adiciona 32 do ascii
pulaB:
	sb $t4, 0($a1)
	addi $a1, $a1, 1

	addi $t3, $t3, -1
	j baixa
	
print_tam: 	li $v0, 1 #imprime tamanho contado na tela
		move $a0, $t5		
		syscall
		j menu
	
	
tam: 	beq $t3, $zero, menu #conta tamanho total da string
	lb $t4, 0($a1)
	beq $t4, 0x0a, print_tam
	beq $t4, 0x00, print_tam
	addi $t5, $t5, 1

	addi $a1, $a1, 1
	j tam

tiraEst: bgt $t4, 64, volta #retira caracteres estranhos que não devem ser contados
	j pulacarac
	
tiraEst2: bgt $t4, 96, volta2 #retira caracteres estranhos que não devem ser contados
	j pulacarac

carac: 	beq $t3, $zero, print_tam #conta caracteres alfanumericos
	lb $t4, 0($a1)
	beq $t4, 0x0a, print_tam
	beq $t4, 0x00, print_tam
	blt $t4, 48, pulacarac
	bgt $t4, 57, tiraEst
	volta: 
	bgt $t4, 90, tiraEst2
	volta2: bgt $t4, 122, print_tam

	addi $t5, $t5, 1
	pulacarac:
	addi $a1, $a1, 1
	j carac
	
digi:	beq $t3, $zero, print_tam #conta caracteres numericos
	lb $t4, 0($a1)
	beq $t4, 0x0a, print_tam
	beq $t4, 0x00, print_tam
	blt $t4, 48, puladigi
	bgt $t4, 57, puladigi
	addi $t5, $t5, 1

	puladigi:
	addi $a1, $a1, 1
	j digi

concat:	beq $t3, $zero, menu #concatena string
	lb $t4, 0($a1)
	beq $t4, 0x0a, entrar
	addi $a1, $a1, 1
	j concat

end:	li $v0, 10 #sai do programa
	syscall

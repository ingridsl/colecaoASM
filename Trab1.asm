.data
k: .word 7
i: .word -12345678
a: .word 123456
j: .word 772300077
end: .word 8256
.text
	
	
	lw $t0, k($zero)
	lh $t1, i
	lhu $t2, i
	lb $t3, i
	lbu $t4, i

	lw $s0, j
	sw $s0, j($zero)
	
	lh $s1, j
	sh $s1, 8232($zero)

	lb $s2, j
	sb $s2, 8212($zero)
	
	lw $t5, end
	sw $t2, 0($t5)
	
	addi $2, $0, 10
	#exit: li $v0, 10 #terminate program
	syscall

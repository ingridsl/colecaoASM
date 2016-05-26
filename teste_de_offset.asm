.data
k: .word 7
i: .word 12345678

.text

lw $t0, k($zero) 		#pega valor de k
la $t1, i 			#pega endereço de K
sw $t0, 12($t1)
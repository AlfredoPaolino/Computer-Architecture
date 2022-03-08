.data
parola:			.asciiz "converti"			#domanda. non posso dichiarare A-a
											#domanda: lunghezza del vettore cerco lo 0 ma se dopo c'e' qualcosa
.text
.globl main
.ent main

main:			move $t0, $0				#domanda: se volessi convertire una parola da tastiera con lo stack
				la $s0, parola
				lb $a0, ($s0)

loop:			beq $a0, 0, done
				jal toupper
				move $a0, $v0
				li $v0, 11
				syscall
				addi $s0, $s0, 1
				lb $a0, ($s0)
				j loop
				
done:


li $v0, 10
syscall

.end main

toupper:		li $t0, 'A'
				li $t1, 'a'
				sub $t0, $t0, $t1
				add $v0, $a0, $t0
				jr $ra
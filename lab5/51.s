.data
var:			.word 3141592653

.text
.globl main
.ent main

main:			lw $t0, var					#domanda: c'e modo di allocare dinamicamente
				li $s0, 10					#se no, allora il C come viene tradotto in asm
				sw $s0, ($sp)

loop:			beq $t0, $0, print			#domanda: posso dividere solo una volta e stampare il resto
				addi $t2, $0, 10
				divu $t0, $t2
				mfhi $t1
				subu $sp, $sp, 4			#domanda: quindi noi riempiamo lo stack a scendere
				sw $t1, ($sp)
				mflo $t0
				j loop
			
print:			lw $a0, ($sp)
				addu $sp, $sp, 4
				addi $a0, $a0, '0'
				li $v0, 11
				syscall
				lw $s1, ($sp)
				bne $s0, $s1, print

done:

li $v0, 10
syscall
				
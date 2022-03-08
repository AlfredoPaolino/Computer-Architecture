.data
DIM=4
vett:			.word 3 7 1 4
msgout:			.asciiz "il massimo del vettore e': "

.text
.ent main
.globl main

main:			la $a0, vett
				li $a1, DIM
				jal massimo
				move $t0, $v0
				la $a0, msgout
				li $v0, 4
				syscall
				move $a0, $t0
				li $v0, 1
				syscall
				
li $v0, 10
syscall

.end main
				
							
massimo:		addi $t0, 1
				move $t1, $a0
				lw $v0, ($t1)
				
loop:			beq $t0, $a1, donemassimo
				addi $t1, 4
				lw $t2, ($t1)
				blt $t2, $v0, label
				move $v0, $t2
label:			addi $t0, 1
				j loop

donemassimo:	jr $ra
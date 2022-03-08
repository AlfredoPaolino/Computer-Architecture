.data
NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 0
prezzi:				.word 39, 1880, 2394, 1000, 1590
scontati:			.space DIM

.text
.globl main

.ent main

main:				la $a0, prezzi
					la $a1, scontati
					li $a2, NUM
					li $a3, SCONTO
					li $t0, ARROTONDA
					subu $sp, 4
					sw $t0, ($sp)
					jal calcola_sconto
					move $s0, $v0
					
					li $v0, 10
					syscall
					
.end main
					
					
					
	
.ent calcola_sconto

calcola_sconto:		lw $t0, ($sp)
					move $t1, $0			#contatore
					move $v0, $0
					
loop:				beq $t1, $a2, done1
					sll $t2, $t1, 2
					move $t3, $0
					add $t3, $a0, $t2
					lw $t4, ($t3)
					mul $t5, $t4, $a3
					move $t3, $0
					add $t3, $a1, $t2				#indirizzo scontati

					li $t6, 100
					div $t5, $t6
					mflo $t5
					add $v0, $v0, $t5
					sub $t5, $t4, $t5
					mfhi $t4
					beq $t4, 0, done2
					
					beq $t0, 0, arrotonda
					bge $t4, 50, done2
					
arrotonda:			sub $t5, $t5, 1
					add $v0, $v0, 1
			
done2:				sw $t5, ($t3)
					addi $t1, 1
					j loop
 
done1:				jr $ra

.end calcola_sconto

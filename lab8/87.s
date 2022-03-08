.data
RIGHE = 4
COLONNE = 5
matrice: 			.byte 0, 1, 3, 6, 2
					.byte 7, 13, 20, 12, 21
					.byte 11, 22, 10, 23, 9
					.byte 24, 8, 25, 43, 62
					
.text
.globl main

.ent main

main:				la $a0, matrice
					li $a1, 0
					li $a2, RIGHE
					li $a3, COLONNE
					jal contaVicini
					move $s0, $v0
					
					li $v0, 10
					syscall
					
.end main


.ent contaVicini

contaVicini:		move $v0, $0
					add $t0, $a0, $a1		#indirizzo cella
					addi $t4, $a3, 1		#COLONNE+1
					addi $t5, $a3, -1		#COLONNE-1
					addi $t6, $a3, -1		#RIGHE-1
					
					div $t3, $a1, $a2			
					beq $t3, 0, primaRiga
					
					div $a1, $a3
					mfhi $t3
					
					beq $t3, 0, primaColonna1
					
					sub $t1, $t0, $t4
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
primaColonna1:		sub $t1, $t0, $a3
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
					beq $t3, $t5, ultimaColonna1

					sub $t1, $t0, $t5
					lb $t2, ($t1)				
					add $v0, $v0, $t2
					
ultimaColonna1:		
primaRiga:
					beq $t3, 0, primaColonna2
					
					sub $t1, $t0, 1
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
primaColonna2:		beq $t3, $t5, ultimaColonna2
					
					add $t1, $t0, 1
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
ultimaColonna2:		div $t3, $a1, $a2
					beq $t3, $t6, ultimaRiga
					
					div $a1, $a3
					mfhi $t3
					
					beq $t3, 0, primaColonna3

					add $t1, $t0, $t5
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
primaColonna3:		add $t1, $t0, $a3
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
					beq $t3, $t5, ultimaColonna3
					
					add $t1, $t0, $t4
					lb $t2, ($t1)
					add $v0, $v0, $t2
					
					
ultimaColonna3:				
ultimaRiga:			
					jr $ra					
			
.end contaVicini
					
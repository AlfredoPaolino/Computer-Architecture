.data
N=19

.text
.globl main

.ent main

main:				li $a0, N					#domanda: bisogna salvare e ripristinare anche i registri t usati solo nelle procedure
					jal sequenzaDiCollatz
					move $a0, $v0
					li $v0, 1
					syscall
				
					li $v0, 10
					syscall
				
.end main

.ent calcolaSuccessivo

calcolaSuccessivo:	andi $t0, $a0, 1
					
					beq $t0, 1, dispari

pari:				srl $v0, $a0, 1
					j done1

dispari:			mul $v0, $a0, 3
					addi $v0, 1
					
done1:				jr $ra
					
.end calcolaSuccessivo

.ent sequenzaDiCollatz

sequenzaDiCollatz:	andi $t1, 0
					addi $sp, -4
					sw $ra, ($sp)	
	
loop:				beq $a0, 1, done2
					jal calcolaSuccessivo
					move $a0, $v0
					addi $t1, 1
					j loop
					
done2:				move $v0, $t1
					
					lw $ra, ($sp)
					addi $sp, 4
					
					jr $ra
					
.end sequenzaDiCollatz
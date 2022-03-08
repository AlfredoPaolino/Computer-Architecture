.data
anni:					.word 1945, 2008, 1800, 2006, 1748, 1600
risultato:				.space 6
.align 2
lunghezza:				.byte 6

.text
.globl main

.ent main

main:					la $a0, anni
						la $a1, risultato
						lw $a2, lunghezza
						jal bisestile
						
						li $v0, 10
						syscall
						
.end main



.ent bisestile

bisestile:				move $t0, $0					#iteratore su anni
						move $t5, $0					#valore fisso a 0
						move $t6, $0		
						addi $t6, $t6, 1				#valore fisso a 1

loop:					beq $t0, $a2, done				#ciclo su anni
						sll $t1, $t0, 2					#calcolo offset
						add $t2, $a0, $t1				#cella corrente anni
						add $t4, $a1, $t0				#cella corrente risultato
						
						lw $t3, ($t2)					#carico anno
						div $t7, $t3, 100				#divisione con immediato
						mfhi $t7						#sposto il resto per valutarlo
						bne $t7, 0, not100				#valuto condizioni per i resti e salvo 0 o 1 in risultato
						div $t7, $t3, 400
						mfhi $t7
						bne $t7, 0, not400
						sb $t6, ($t4)
						j marked
not400:					sb $t5, ($t4)
						j marked
not100:					div $t7, $t3, 4
						mfhi $t7
						bne $t7, 0, not4
						sb $t6, ($t4)
						j marked
not4:					sb $t5, ($t4)

marked:					addi $t0, $t0, 1
						j loop
						
done:					jr $ra

.end bisestile
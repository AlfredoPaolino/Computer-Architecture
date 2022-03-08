.data
opa:			.word 2043
opb:			.word 5
tab:			.word somma, sottrazione, moltiplic, divisione
msgin:			.asciiz "Inserire cifa valida: (0 somma, 1 sottrazione, 2 moltiplicazione, 3 divisione) \n"
res:			.word 0

.text
.globl main
.ent main

main:			la $a0, msgin
				li, $v0, 4
				syscall
				
				li $v0, 5
				syscall
				
				blt $v0, 0, main			#domanda: controlli all'esame
				bgt $v0, 3, main
				
				sll $v0, $v0, 2
				la $t1, tab					#domanda: differenza con lw $t0, tab($t1)
				add $t1, $t1, $v0
				lw $t0, ($t1)
				
				lw $t2, opa
				lw $t3, opb
				
				jr $t0

somma:			add $t4, $t2, $t3			#domanda: capire meglio il funzionamento e come gestire default
				j done
				
sottrazione:	sub $t4, $t2, $t3
				j done

moltiplic:		mul $t4, $t2, $t3
				j done

divisione:		div $t4, $t2, $t3
				
done:			sw $t4, res

				li $v0, 10
				syscall
				
				.end main
				
				
				
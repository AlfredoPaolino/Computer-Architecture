.data
DIM=8

.text
.ent main
.globl main

main:			li $t0, 0

loop1:			beq $t0, DIM, done1				#domanda: all'esame va bene implementare qualcosa di diverso con la stessa funzione
				move $a1, $t0
				jal printshapes
				addi $t0, 1
				j loop1
		
done1:			li $t0, 0
				li $a1, DIM
	
loop2:			beq $t0, DIM, done2
				jal printshapes
				addi $t0, 1
				j loop2
			
done2:
				
li $v0, 10
syscall
.end main

printshapes:	li $t1 ,-1						#domanda: se voglio ritornare piu di un valore
				li $a0, '*'						#domanda: fare cosi al posto di caricare ogni volta i valori
				li $v0, 11
				
printloop:		beq $t1, $a1, doneprint
				syscall
				addi $t1, 1
				j printloop
		
doneprint:		li $a0, '\n'
				syscall
				jr $ra
				
				
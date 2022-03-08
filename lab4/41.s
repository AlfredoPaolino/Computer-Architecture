.data
DIM=20
vett:			.space DIM*4				#domanda: perche non va in segmentation fault con DIM=0

.text
.globl main
.ent main
				
main:			addi $t0, $0, 1 
				addi $t1, $0, 1 			#1 da inserire in v[0] e v[1]
				move $t2, $0				#iteratore
				sll $t3, $t2, 2				#calcolo offset da iteratore
				sw $t0, vett($t3)
				addi $t2, $t2, 1
				sll $t3, $t2, 2
				sw $t1, vett($t3)
				
loop:			addi $t2, $t2, 1
				sll $t3, $t2, 2
				
				add $t4, $t0, $t1
				sw $t4, vett($t3)
				move $t0, $t1
				move $t1, $t4				#domanda: salto incondizionato rende il programma non strutturato
				
				bltu $t2, DIM-1, loop
				
				li $v0, 10
				syscall
				
.end main
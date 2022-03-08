.data
DIM=3
WORD=4
DXW=DIM*WORD
matrix:			.word 1 4 7
				.word 4 4 0
				.word 0 0 0
	
.text
.globl main
.ent main

main: 			addi $s1, $0, 2					#risultato finale
				add $t0, $0, $0
				
loop1:			beq $t0, DIM, end				#iteratore righe
					
				add $t1, $t0, 1
				
loop2:			beq $t1, DIM, label1			#iteratore colonne
				
				mul $s2, $t0, DXW
				mul $t2, $t1, WORD
				add $s2, $s2, $t2
				mul $s3, $t1, DXW
				mul $t2, $t0, WORD
				add $s3, $s3, $t2
				
				lw $t2, matrix($s2)
				lw $t3, matrix($s3)
				
				addi $t1, $t1, 1
				
				bne $t2, $t3, err
				beq $t2, $0, label2
				addi $s1, $0, 1

label2:			j loop2

label1:			add $t0, $t0, 1
				j loop1
				
err:			addi $s1, $0, 0

end:			move $a0, $s1
				li $v0, 1
				syscall
				
li $v0, 10
syscall
				
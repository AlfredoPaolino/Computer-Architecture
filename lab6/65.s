.data
n=12
k=2

.text
.ent main
.globl main

main:			li $a0, n									#domanda: vantaggi in asm con la ricorsione
				li $t0, k
				sub $a1, $a0, $t0
				li $v0, 1		#risultato
				addi $sp, -4
				sw $ra, ($sp)
				jal combina
				
				addi $sp, 4
				move $t0, $v0
				
				li $a0, k
				li $a1, 1
				li $v0, 1		#risultato
				addi $sp, -4
				sw $ra, ($sp)
				jal combina
				
				addi $sp, 4
				move $t1, $v0
				
				div $a0, $t0, $t1
				li $v0, 1
				syscall
				
li $v0, 10
syscall

.end main

combina:		beq $a0, $a1, stop
				addi $sp, -4
				sw $a0, ($sp)
				addi $sp, -4
				sw $ra, ($sp)
				addi $a0, -1
				jal combina

		
stop:			lw $ra, ($sp)
				addi $sp, 4
				lw $a0, ($sp)
				addi $sp, 4
				mul $v0, $v0, $a0
				jr $ra		
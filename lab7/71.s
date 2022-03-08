.data
N=7

.text
.globl main
.ent main

main:			li $t0, 4						#domanda: davvero è necessario fare questo o esistono delle macro
				li $t1, 2						#domanda: cosa fanno le righe precedenti alla chiamata al main
				li $t2, -5
				li $t3, 3
				li $s0, 8
				li $s1, 4
				li $s2, 27
				li $s3, 9
				li $s4, 64
				li $s5, 16
				li $t6, N
				andi $a0, 0
				add $a0, $a0, $t0
				add $a0, $a0, $t1
				add $a0, $a0, $t2
				add $a0, $a0, $t3
				andi $a1, 0
				mul $t5, $t0, $s0
				add $a1, $a1, $t5
				mul $t5, $t1, $s1
				add $a1, $a1, $t5
				mul $t5, $t2, 2
				add $a1, $a1, $t5
				add $a1, $a1, $t3
				andi $a2, 0
				mul $t5, $t0, $s2
				add $a2, $a2, $t5
				mul $t5, $t1, $s3
				add $a2, $a2, $t5
				mul $t5, $t2, 3
				add $a2, $a2, $t5
				add $a2, $a2, $t3
				andi $a3, 0
				mul $t5, $t0, $s4
				add $a3, $a3, $t5
				mul $t5, $t1, $s5
				add $a3, $a3, $t5
				mul $t5, $t2, 4
				add $a3, $a3, $t5
				add $a3, $a3, $t3
				addi $sp, -4
				sw $t0, ($sp)
				addi $sp, -4
				sw $t1, ($sp)
				addi $sp, -4
				sw $t2, ($sp)
				addi $sp, -4
				sw $t3, ($sp)
				addi $sp, -4
				sw $s0, ($sp)
				addi $sp, -4
				sw $s1, ($sp)
				addi $sp, -4
				sw $s2, ($sp)
				addi $sp, -4
				sw $s3, ($sp)
				addi $sp, -4
				sw $s4, ($sp)
				addi $sp, -4
				sw $s5, ($sp)
				addi $sp, -4
				sw $t6, ($sp)

				jal polinomio
				
				move $t8, $v0
				
				lw $t3, ($sp)
				addi $sp, 4
				lw $t2, ($sp)
				addi $sp, 4
				lw $t1, ($sp)
				addi $sp, 4
				lw $t0, ($sp)
				addi $sp, 4
				
				li $v0, 10
				syscall
				
.end main
						
				
.ent polinomio

polinomio:		sub $t0, $a1, $a0
				sub $t1, $a2, $a1
				sub $t2, $a3, $a2
				sub $s0, $t1, $t0
				sub $s1, $t2, $t1
				sub $s2, $s1, $s0
				move $v0, $a3
				
				lw $t6, ($sp)
				addi $sp, 4
				
				addi $t6, -4
				
				andi $t7, 0
				
loop:			beq $t7, $t6, done
				add $s1, $s1, $s2
				add $t2, $t2, $s1
				add $v0, $v0, $t2
				addi $t7, 1
				j loop
				
done:			lw $s5, ($sp)
				addi $sp, 4
				lw $s4, ($sp)
				addi $sp, 4
				lw $s3, ($sp)
				addi $sp, 4
				lw $s2, ($sp)
				addi $sp, 4
				lw $s1, ($sp)
				addi $sp, 4
				lw $s0, ($sp)
				addi $sp, 4
				
				jr $ra
	
.end polinomio
				
				
.data
	matrix:			.word 1, 0, 0
					.word 0, 10, 4
					.word 0, 2, 3
					
.text
.globl main

.ent main

	main:			la $s0, matrix					#domanda: quali registri dovrei ripristinare
					lw $a0, ($s0)
					lw $a1, 4($s0)
					lw $a2, 8($s0)
					lw $a3, 12($s0)
					lw $t0, 16($s0)
					addi $sp, -4
					sw $t0, ($sp)
					lw $t0, 20($s0)
					addi $sp, -4
					sw $t0, ($sp)
					lw $t0, 24($s0)
					addi $sp, -4
					sw $t0, ($sp)
					lw $t0, 28($s0)
					addi $sp, -4
					sw $t0, ($sp)
					lw $t0, 32($s0)
					addi $sp, -4
					sw $t0, ($sp)
					
					jal determinante3x3
					move $s0, $v0
					
					li $v0, 10
					syscall
				
.end main

.ent determinante2x2

determinante2x2:	andi $v0, 0

					mul $s6, $a0, $a3
					mul $s7, $a1, $a2
					sub $v0, $s6, $s7
					
					jr $ra
					
.end determinante2x2

.ent determinante3x3

determinante3x3:	andi $v0, 0
					
					move $t0, $a0
					move $t1, $a1
					move $t2, $a2
					move $t3, $a3
					lw $t8, ($sp)
					addi $sp, 4
					lw $t7, ($sp)
					addi $sp, 4
					lw $t6, ($sp)
					addi $sp, 4
					lw $t5, ($sp)
					addi $sp, 4
					lw $t4, ($sp)
					addi $sp, 4
					
					addi $sp, -4
					sw $ra, ($sp)
					
					move $a0, $t4
					move $a1, $t5
					move $a2, $t7
					move $a3, $t8
					
					jal determinante2x2
					move $s0, $v0
					mul $s0, $s0, $t0

					move $a0, $t3
					move $a1, $t5
					move $a2, $t6
					move $a3, $t8
					
					jal determinante2x2
					move $s1, $v0
					mul $s1, $s1, $t1
					
					move $a0, $t3
					move $a1, $t4
					move $a2, $t6
					move $a3, $t7
					
					jal determinante2x2
					move $s2, $v0
					mul $s2, $s2, $t2
					
					andi $v0, 0
					add $v0, $v0, $s0
					sub $v0, $v0, $s1
					add $v0, $v0, $s2
					
					lw $ra, ($sp)
					addi $sp, 4
					
					jr $ra


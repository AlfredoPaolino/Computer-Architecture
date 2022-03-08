.data
	matrix:			.word 4, 2
					.word 1, 3
					
.text
.globl main

.ent main

	main:			la $s0, matrix
					lw $a0, ($s0)
					lw $a1, 4($s0)
					lw $a2, 8($s0)
					lw $a3, 12($s0)
					
					addi $sp, -4
					sw $ra, ($sp)
					
					jal determinante2x2
					move $s0, $v0
					
					lw $ra, ($sp)
					addi $sp, 4
					
					jr $ra
				
.end main

.ent determinante2x2

determinante2x2:	mul $t0, $a0, $a3
					mul $t1, $a1, $a2
					sub $v0, $t0, $t1
					
					jr $ra
					
.end determinante2x2
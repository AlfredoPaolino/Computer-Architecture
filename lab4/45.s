.data
X=6
Y=4
WORD=4
matrix:			.word 154, 123, 109, 86, 4, 0				#domanda: come indicare che sono vuoti
				.word 412, -23, -231, 9, 50, 0
				.word 123, -24, 12, 55, -45, 0
				.word 0, 0, 0, 0, 0, 0

.text
.globl main
.ent main

main:			move $t1, $0
				
loop1:			beq $t1, Y-1, done2
				mul $t0, $t1, X
				move $t2, $0
				move $t3, $0
				
loop2:			beq $t2, X-1, done1
				add $t4, $t0, $t2
				sll $t4, $t4, 2
				lw $s0, matrix($t4)
				add $t3, $t3, $s0
				addi $t2,  $t2, 1
				j loop2
				
done1:			add $t4, $t0, $t2
				sll $t4, $t4, 2
				sw $t3, matrix($t4)
				addi $t1, $t1, 1
				j loop1

done2:			move $t1, $0
				
loop3:			beq $t1, X, done4
				move $t2, $0
				move $t3, $0
				
loop4:			beq $t2, Y-1, done3
				mul $t0, $t2, X
				add $t4, $t1, $t0
				sll $t4, $t4, 2
				lw $s0, matrix($t4)
				add $t3, $t3, $s0
				addi $t2,  $t2, 1
				j loop4
				
done3:			mul $t0, $t2, X
				add $t4, $t1, $t0
				sll $t4, $t4, 2
				sw $t3, matrix($t4)
				addi $t1,  $t1, 1
				j loop3

done4:			li $v0, 10
				syscall
					
.end main
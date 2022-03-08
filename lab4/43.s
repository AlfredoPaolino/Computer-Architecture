.data
DIM1=4
DIM2=4
WORD=4
v1:				.word 1, 2, 3, 4
v2:				.word 5, 6, 7, 8
matrix:			.space DIM1*DIM2*WORD

.text
.globl main
.ent main

main:			move $t1, $0
				
loop1:			beq $t1, DIM1, done1
				sll $t4, $t1, 2
				lw $s0, v1($t4)
				mul $t0, $t1, DIM1
				move $t2, $0

loop2:			beq $t2, DIM2, done2
				sll $t5, $t2, 2
				lw $s1, v2($t5)
				mul $s2, $s1, $s0				
				add $t3, $t0, $t2
				sll $t3, $t3, 2
				sw $s2, matrix($t3)
				addi $t2, $t2, 1
				j loop2
				
done2:			addi $t1, $t1, 1
				j loop1
				
done1:			li $v0, 10
				syscall

.end main
				
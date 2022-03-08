.data
DIM=10
WORD=4
matrix:			.space DIM*DIM*WORD

.text
.globl main
.ent main

main:			move $t1, $0
				
loop1:			beq $t1, DIM, done1
				mul $t0, $t1, DIM
				move $t2, $0

loop2:			beq $t2, DIM, done2
				addi $s1, $t1, 1
				addi $s2, $t2, 1
				mul $s0, $s1, $s2
				add $t3, $t0, $t2
				sll $t3, $t3, 2
				sw $s0, matrix($t3)
				addi $t2, $t2, 1
				j loop2
				
done2:			addi $t1, $t1, 1
				j loop1
				
done1:			li $v0, 10
				syscall

.end main
				
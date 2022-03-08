				.data
DIM=3			.byte 3

				.text
				.globl main
				.ent main
				
main:			lb $t0, DIM
				move $t1, $0
				move $t2, $0
				
loop:			beq $t1, $t0, done
				
				addi $t1, $t1, 1
				
				li $v0, 5
				syscall
				
				add $t2, $t2, $v0
				
				j loop
				
done:			div $t2, $t2, $t0

				li $v0, 10
				syscall
				
				.end main
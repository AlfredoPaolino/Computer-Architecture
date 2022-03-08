				.data
var:			.word 0x3FFFFFF0

				.text
				.globl main
				.ent main
				
main:			lw $t1, var
				add $t1, $t1, $t1
				addi $t2, $t0, 40
				
				addu $t3, $t1, $t2 
				
				move $a0, $t3
				li $v0, 1
				syscall
				
				li $v0, 10
				syscall
				
				.end main
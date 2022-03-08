				.data
var:			.half 0XFFFF

				.text
				.globl main
				.ent main
				
main:			lh $t0, var
				move $t2, $0
				move $t3, $0

loop:				andi $t1, $t0, 1
				bne $t1, 1, label1
				addi $t2, $t2, 1
				
label1:			beq $t3, 15, done
				srl $t0, $t0, 1
				addi $t3, $t3, 1
				j loop
				
done:			li $v0, 10
				syscall
				
				.end main
				
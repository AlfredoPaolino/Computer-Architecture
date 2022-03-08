.data
msgin:			.asciiz "inserire a, b e c (coefficienti eq secondo grado)\n"
msgout1:		.asciiz "l'equazione ha soluzioni reali"
msgout2:		.asciiz "l'equazione non ha soluzioni reali"
msgerr:			.asciiz "l'equazione non ha soluzioni"

.text
.globl main
.ent main

main:			la $a0, msgin
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				move $t0, $v0
				li $v0, 5
				syscall
				move $t1, $v0
				li $v0, 5
				syscall
				move $t2, $v0
				
				bne $t0, $0, check
				bne $t1, $0, check
				beq $t2, $0, check
				j err
				
check:			mul $t4, $t1, $t1
				mul $t5, $t0, $t2
				mul $t5, $t5, 4
				sub $t4, $t4, $t5
				
				slti $t4, $t4, 0
				beq $t4, 1, done2
				
done1:			la $a0, msgout1
				li $v0, 4
				syscall
				j end
				
done2:			la $a0, msgout2
				li $v0, 4
				syscall
				j end
				
err:			la $a0, msgerr
				li $v0, 4
				syscall
				j end

end:

li $v0, 10
syscall
				
				.data
wVet:			.space 5
wRes:			.space 1
message_in:		.asciiz "Inserire carattere\n"
message_out:	.asciiz "\nValore minimo: "

				.text
				.globl main
				.ent main
				
main:			la $t0, wVet
				li $t1, 0
				
				la $a0, message_in
				li $v0, 4
				syscall
				
ciclo1:			li $v0, 12
				syscall
				sb $v0, ($t0)
				add $t1, $t1, 1
				add $t0, $t0, 1
				bne $t1, 5, ciclo1
				
				la $t0, wVet
				li $t1, 0
				lb $t2, ($t0)
				
ciclo2:			lb $t3, ($t0)
				bgt $t3, $t2, salta
				lb $t2, ($t0)				#perche' se metto $t3 non va?
salta:			add $t0, $t0, 1
				add $t1, $t1, 1
				bne $t1, 5, ciclo2
				
				la $a0, message_out
				li $v0, 4
				syscall
				li $v0, 11
				move $a0, $t2
				syscall
				
				li $v0, 10
				syscall
				
				.end main
				
				.data
msgin:			.asciiz "Inserire un numero\n"
msgpari:		.asciiz "Il numero inserito e' pari"
msgdis:			.asciiz "Il numero inserito e' dispari"
				
				.text
				.globl main
				.ent main
				
main:			la $a0, msgin
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				move $t0, $v0
				
				andi $t1, $t0, 1
				
				beq $t1, 0, pari
				la $a0, msgdis
				li $v0, 4
				syscall
				j done
				
pari:			la $a0, msgpari
				li $v0, 4
				syscall
				
done:			li $v0, 10
				syscall
				
				.end main
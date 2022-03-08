				.data
msgin:			.asciiz "\ninserire cifra\n"
msgerr:			.asciiz "\ninserito carattere non cifa\n"

				.text
				.globl main
				.ent main

main:			move $t3, $0
				addi $t4, $0, 10
			
loop:			la $a0, msgin
				li $v0, 4
				syscall

				li $v0, 12
				syscall
				
				beq $v0, '\n', done
				blt $v0, '0', err
				bgt $v0, '9', err
				
				sub $v0, $v0, '0'
				mul $t3, $t3, $t4
				add $t3, $t3, $v0
				
				j loop
				
err:			la $a0, msgerr
				li $v0, 4
				syscall
				j endl
				
					
done:			move $a0, $t3
				li $v0, 1
				syscall
				
endl:			li $v0, 10
				syscall
				
				.end main
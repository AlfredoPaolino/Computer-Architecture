.data
msgin:			.asciiz "inserire stringa (verifica palindromo)\n"
msgout1:		.asciiz "la stringa inserita e palindroma"
msgout2:		.asciiz "la stringa inserita non e palindroma"

.text
.globl main
.ent main

main:			la $a0, msgin
				li $v0, 4
				syscall
				la $s0, ($sp)
		
loop:			li $v0, 12
				syscall
				sw $v0, ($sp)
				subu $sp, $sp, 4
				bne $v0, '\n', loop
				
				addu $sp, $sp, 8				

check:			beq $s0, $sp, done1
				addi $s1, $s0, 4
				beq $s1, $sp, done1
				lw $t0, ($s0)
				lw $t1, ($sp)
				bne $t0, $t1, done2
				addu $sp, $sp, 4
				subu $s0, $s0, 4
				j check
				
done1:			la $a0, msgout1
				li $v0, 4
				syscall
				j end
				
done2:			la $a0, msgout2
				li $v0, 4
				syscall
				
end:

li $v0, 10
syscall
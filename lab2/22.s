				.data
msgin1:			.asciiz "Inserire primo numero\n"
msgin2:			.asciiz "Inserire secondo numero\n"
msgerr:			.asciiz "ERRORE: Numero non rappresentabile su 1 byte"
mask:			.word 0xFFFFFF00
res:			.space 4

				.text
				.globl main
				.ent main
				
main:			la $a0, msgin1
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				move $t0, $v0
				
				la $a0, msgin2
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				move $t1, $v0
				
				lw $t2, mask
				
				and $t3, $t0, $t2
				and $t4, $t1, $t2

				bne $t3, $0, errore
				bne $t4, $0, errore
				
				nor $t3, $t1, $0
				and $t3, $t0, $t3
				nor $t3, $t3, $0
				xor $t4, $t0, $t1
				or $t5, $t3, $t4
				
				nor $t2, $t2, $0
				and $t5, $t5, $t2
				sw $t5, res
				
				lw $a0, res
				li $v0, 1
				syscall
				
				j done
				
				
errore:			la $a0, msgerr
				li $v0, 4
				syscall
				
done:			li $v0, 10
				syscall
				
				.end main
				.data
msgin:			.asciiz "\ninserire cifra\n"
msgerr:			.asciiz "\ninserito carattere non cifa\n"
zero:			.byte '0'
nine:			.byte '9'
end:			.byte '\n'

				.text
				.globl main
				.ent main

main:			#li $v0, 5					#non e una soluzione ottima perche non distingue i non alfanum da 0, quindi soluzione e leggere car per car
				#syscall
				#move $t0, $v0
				
				lb $t0, zero
				lb $t1, nine
				lb $t2, end
			
loop:			la $a0, msgin
				li $v0, 4
				syscall

				li $v0, 12
				syscall
				
				beq $v0, $t2, done
				blt $v0, $t0, err
				bgt $v0, $t1, err
				
				j loop
				
err:			la $a0, msgerr
				li $v0, 4
				syscall
					
done:			li $v0, 10
				syscall
				
				.end main
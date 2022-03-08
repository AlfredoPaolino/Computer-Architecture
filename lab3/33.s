				.data
giorni:			.byte 2
gino:			.byte 24
ore:			.byte 14
oinm:			.byte 60
minuti:			.byte 51
				.align 3
risultato:		.space 4

				.text
				.globl main
				.ent main
				
main:			lb $t0, giorni
				lb $t1, gino
				mul $t0, $t0, $t1
				lb $t1, ore
				add $t0, $t0, $t1
				lb $t1, oinm
				mul $t0, $t0, $t1
				lb $t1, minuti
				add $t0, $t0, $t1
				
				sw $t0, risultato
				
				li $v0, 10
				syscall
				
				.end main
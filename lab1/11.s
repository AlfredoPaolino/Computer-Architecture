				.data
opd1:			.byte 10				#10
opd2:			.byte 0x10				#16
opd3:			.byte '1'				#49
res:			.space 1				#intero su 8 bit

				.text
				.globl main
				.ent main

main:			lb $t0, opd1
				lb $t1, opd2
				lb $t2, opd3
				sub $t4, $t0, $t1
				add $t4, $t4, $t2
				
				move $a0, $t4
				li $v0, 1
				syscall
				
				sb $t4, res
				
				li $v0, 10
				syscall
				
				.end main
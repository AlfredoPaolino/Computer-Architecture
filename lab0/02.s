				.data
msg1: 			.asciiz "introduci primo numero"
msg2:			.asciiz "introduci secondo numero"

				.text
				.globl main
				.ent main

main:			li, $v0, 4
				la, $a0, msg1
				syscall
				li, $v0, 5
				syscall
				move $t0, $v0
				
				li, $v0, 4
				la, $a0, msg2
				syscall
				li, $v0, 5
				syscall
				move $t1, $v0
				
				add $a0, $t0, $t1		#perche' funziona con a0 ma non con gli altri a?
				li, $v0, 1
				syscall
				
				li, $v0, 10
				syscall
				
				.end main
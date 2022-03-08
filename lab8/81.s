.data

ora_in: .byte 12, 47
ora_out: .byte 18, 14
X: .byte 1
Y: .byte 40

.text
.globl main

.ent main

	main:			la $a0, ora_in # indirizzo di ora_in
					la $a1, ora_out # indirizzo di ora_out
					lbu $a2, X
					lbu $a3, Y
					jal costoParcheggio
					move $s0, $v0
					li $v0, 10
					syscall
				
.end main

.ent costoParcheggio

costoParcheggio:	lb $t0, ($a0)
					lb $t1, 1($a0)
					lb $t2, ($a1)
					lb $t3, 1($a1)
					sub $t4, $t2, $t0
					sub $t5, $t3, $t1
					mul $t4, $t4, 60
					add $t4, $t4, $t5
					div $t4, $a3
					mflo $t4
					mfhi $t5
					mul $v0, $t4, $a2
					beq $t5, 0, noResto
					add $v0, $v0, $a2
noResto:			jr $ra

.end costoParcheggio
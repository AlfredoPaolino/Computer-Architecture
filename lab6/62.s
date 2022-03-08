.data
msgin:			.asciiz "inserire dimensione: "

.text
.ent main
.globl main

main:			li $t0, 1

				la $a0, msgin
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				move $t2, $v0
				addi $t2, 1

loop1:			beq $t0, $t2, done1
				move $a1, $t0
				jal printshapes
				addi $t0, 1
				j loop1
		
done1:			li $t0, 0
				addi $t2, -1
				move $a1, $t2
	
loop2:			beq $t0, $t2, done2
				jal printshapes
				addi $t0, 1
				j loop2
			
done2:
				
li $v0, 10
syscall

.end main

printshapes:	li $t1, 0
				li $a0, '*'						
				li $v0, 11
				
printloop:		beq $t1, $a1, doneprint
				syscall
				addi $t1, 1
				j printloop
		
doneprint:		li $a0, '\n'
				syscall
				jr $ra
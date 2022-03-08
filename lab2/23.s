				.data
var0:			.word 3
var1:			.word 1
var2:			.word 2

				.text
				.globl main
				.ent main
				
main:			lw $t0, var0
				lw $t1, var1
				lw $t2, var2
				
				blt $t0, $t1, label1
				move $t3, $t0
				move $t0, $t1
				move $t1, $t3
				
label1:			blt $t0, $t2, label2
				move $t3, $t0
				move $t0, $t2
				move $t2, $t3
				
label2:			blt $t1, $t2, done
				move $t3, $t1
				move $t1, $t2
				move $t2, $t3
			
done:			sw $t0, var0
				sw $t1, var1
				sw $t2, var2
				
				lw $a0, var0
				li $v0, 1
				syscall
				
				lw $a0, var1
				li $v0, 1
				syscall
				
				lw $a0, var2
				li $v0, 1
				syscall
				
				li $v0, 10
				syscall
				
				.end main
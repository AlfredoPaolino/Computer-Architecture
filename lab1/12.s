				.data
var1:			.byte 'm'
var2:			.byte 'i'
var3:			.byte 'p'
var4:			.byte 's'
var5:			.byte 0
help:			.byte 'a'-'A'

				.text
				.globl main
				.ent main
				
main:			lb $t1, var1
				lb $t2, var2
				lb $t3, var3
				lb $t4, var4
				lb $t5, var5
				lb $t0, help
				
				sub $t1, $t1, $t0
				sub $t2, $t2, $t0
				sub $t3, $t3, $t0
				sub $t4, $t4, $t0
				
				sb $t1, var1
				sb $t2, var2
				sb $t3, var3
				sb $t4, var4
				sb $t5, var5
				
				la $a0, var1
				li $v0, 4
				syscall
				
				li $v0, 10
				syscall
				
				.end main
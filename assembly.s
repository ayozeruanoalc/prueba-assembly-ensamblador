			.data
N: 			.word 10
X:			.byte -127, -81, -80, -27, 3, 27, 29, 30, 81, 84
Y: 			.space 64
			.align 2
M:			.space 4


			.text
			.globl main







main:

			sb $0, M         # memoria
			li $t0, 0		 # j 



			li $t1, 0     	# i
			lw $t2, N($0)	# N = 10

para:

			beq $t1, $t2, finpara      # el beq se debe a que si se hace de 0 a 10, estamos contando 11 elementos
										# cuando el vector tiene 10 elementos solo.            # bgt? para reparar

si:

			lb $t3, X($t1)     # X[i]
			li $t4, 3
			div $t3, $t4
			mfhi $t5			# resto
			bne $t5, $0, sino

			li $t5, 27
			ble $t3, $t5, sino


entonces:


si2:

			li $t5, 81
			blt $t3, $t5, finsi2



entonces2:

			
			addi $t6, $t3, -16
			sb $t6, Y($t0)
			addi $t0, $t0, 1



finsi2:








sino:

si3:

			li $t5, -81
			bgt $t3, $t5, finsi3


entonces3:

			addi $t6, $t3, 32
			sb $t6, Y($t0)
			addi $t0, $t0, 1




finsi3:





finsi:



			addi $t1, $t1, 1
			j para


finpara:




			sb $t0, M($0)





		#	jr $ra




			li $t5, 0 	# segunda i (bucle)
			lb $t6, M   # contenido de M


para2:

			beq $t5, $t6, finpara2       #bgt para corregir



			lb $a0, Y($t5)
			li $v0, 1
			syscall

			li $a0, ' '
			li $v0, 11
			syscall




			addi $t5, $t5, 1
			j para2


finpara2:



			jr $ra


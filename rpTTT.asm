# Written by:
# Steph Gagnon  - 100694227
# Jonah Griffin - 100702748
.data # put stuff we need in here
currentPlayer: .space 1
inputString: .space 1
inputInt: .word 0
slot1: .space 1
slot2: .space 1
slot3: .space 1
slot4: .space 1
slot5: .space 1
slot6: .space 1
slot7: .space 1
slot8: .space 1
slot9: .space 1

.text # main program
while:
	# print the board
	li $v0, 4				# tell system to print string
	la $a0, slot1			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot2			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot3			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, "\n"			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot4			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot5			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot6			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, "\n"			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot7			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot8			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, slot9			# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, "\n"			# set argument register to string
	syscall					# execute
	
	# print curent player's turn
	li $v0, 4				# tell system to print string
	la $a0, "It is "		# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, currentPlayer 	# set argument register to current player
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, "'s turn.\n"	# set argument register to string
	syscall					# execute
	
	# take current player's input
	li $v0, 8   		# tell sys to read a string
	la $a0, inputString # store string in inputString
	li $a1, 1			# tell system max string length is 1 char
	syscall 			# execute
	
	# convert input string to integer (this is the position on the board)
	andi inputString, inputInt, 0x0F # I don't know how this works
	
	# update the board
	beq inputInt, 1, up1
	beq inputInt, 2, up2
	beq inputInt, 3, up3
	beq inputInt, 4, up4
	beq inputInt, 5, up5
	beq inputInt, 6, up6
	beq inputInt, 7, up7
	beq inputInt, 8, up8
	beq inputInt, 9, up9
	
checkVictor:
	# check if either player has won or if it was a draw this turn
	
	# end the game based on victor
	beq $t1, 1, xwin # if $t1 = 1, x wins, branch to xwin
	beq $t1, 2, owin # if $t1 = 2, o wins, branch to owin
	beq $t1, 3, draw  # if $t1 = 3, draw, branch to draw
	# if no win condition, continue jump back to while
	j while

up1:
lb slot1, currentPlayer
j checkVictor
up2:
lb slot2, currentPlayer
j checkVictor
up3:
lb slot3, currentPlayer
j checkVictor
up4:
lb slot4, currentPlayer
j checkVictor
up5:
lb slot5, currentPlayer
j checkVictor
up6:
lb slot6, currentPlayer
j checkVictor
up7:
lb slot7, currentPlayer
j checkVictor
up8:
lb slot8, currentPlayer
j checkVictor
up9:
lb slot9, currentPlayer
j checkVictor

xwin:
li $v0, 4							# tell system to print string
la $a0, "X wins, congratulations!"	# set argument register to string
syscall								# execute

li $v0, 10 # the end of the program, AKA exit
syscall

owin:
li $v0, 4							# tell system to print string
la $a0, "O wins, congratulations!"	# set argument register to string
syscall								# execute

li $v0, 10 # the end of the program, AKA exit
syscall

draw:
li $v0, 4				# tell system to print string
la $a0, "It's a draw!"	# set argument register to string
syscall					# execute

li $v0, 10 # the end of the program, AKA exit
syscall
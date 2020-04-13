## TODO:
# make it so you can't place your symbol on top of another symbol
# fix weird duplication of symbol on placement issue
# implement vicotry checking

# Written by:
# Steph Gagnon  - 100694227
# Jonah Griffin - 100702748

.data # put stuff we need in here
currentPlayer: .asciiz "X" 	# start currentPlayer as X.
xStr: .asciiz "X"
oStr: .asciiz "O"
input: .word 1
slot1: .asciiz "."
slot2: .asciiz "."
slot3: .asciiz "."
slot4: .asciiz "."
slot5: .asciiz "."
slot6: .asciiz "."
slot7: .asciiz "."
slot8: .asciiz "."
slot9: .asciiz "."
newLine: .asciiz "\n"
turnMsg1: .asciiz "It is "
turnMsg2: .asciiz "'s turn.\n"
xwinMsg: .asciiz "X wins, congratulations!"
owinMsg: .asciiz "O wins, congratulations!"
drawMsg: .asciiz "It's a draw!"

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
	la $a0, newLine			# set argument register to string
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
	la $a0, newLine			# set argument register to string
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
	la $a0, newLine			# set argument register to string
	syscall					# execute
	
	# print curent player's turn
	li $v0, 4				# tell system to print string
	la $a0, turnMsg1		# set argument register to string
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, currentPlayer 	# set argument register to current player
	syscall					# execute
	li $v0, 4				# tell system to print string
	la $a0, turnMsg2		# set argument register to string
	syscall					# execute
	
	# take current player's input
	li $v0, 5   		# tell sys to read an integer
	syscall				# execute
	move $t0, $v0		# cope result input integer into $t0
	
	# update the board
	beq $t0, 1, up1
	beq $t0, 2, up2
	beq $t0, 3, up3
	beq $t0, 4, up4
	beq $t0, 5, up5
	beq $t0, 6, up6
	beq $t0, 7, up7
	beq $t0, 8, up8
	beq $t0, 9, up9
	
checkVictor:
	# check if either player has won or if it was a draw this turn
	
	# end the game based on victor
	beq $t1, 1, xwin	 # if $t1 = 1, x wins, branch to xwin
	beq $t1, 2, owin	 # if $t1 = 2, o wins, branch to owin
	beq $t1, 3, draw 	 # if $t1 = 3, draw, branch to draw
	
	# switch current player
	la $a0, currentPlayer 	# get address of currentPlayer and store it in $a0
	lb $t3, ($a0)			# get contents at address $a0 and store in $t3
	
	la $a1, oStr			# get address of oStr and store in $a1
	lb $t4, ($a1)			# get contents at address $a1 and store in $t4
	beq $t3, $t4, setX  	# if $t3 == $t4, branch to setX
	
	la $a1, xStr			# get address of xStr and store in $a1
	lb $t4, ($a1)			# get contents at address $a1 and store in $t4
	beq $t3, $t4, setO		# if $t3 == $t4, branch to setO

up1:
la $a0, slot1				# get address of slot1 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor
up2:
la $a0, slot2				# get address of slot2 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up3:
la $a0, slot3				# get address of slot3 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up4:
la $a0, slot4				# get address of slot4 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up5:
la $a0, slot5				# get address of slot5 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up6:
la $a0, slot6				# get address of slot6 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up7:
la $a0, slot7				# get address of slot7 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up8:
la $a0, slot8				# get address of slot8 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor
up9:
la $a0, slot9				# get address of slot9 and store it in $a0
lw $a1, currentPlayer 		# set $a1 to current player char
sw $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor

setO:
la $a0, currentPlayer
lw $a1, oStr
sw $a1, 0($a0)
j while

setX:
la $a0, currentPlayer
lw $a1, xStr
sw $a1, 0($a0)
j while

xwin:
li $v0, 4			# tell system to print string
la $a0, xwinMsg		# set argument register to string
syscall				# execute

li $v0, 10 			# the end of the program, AKA exit
syscall

owin:
li $v0, 4			# tell system to print string
la $a0, owinMsg		# set argument register to string
syscall				# execute

li $v0, 10 			# the end of the program, AKA exit
syscall

draw:
li $v0, 4			# tell system to print string
la $a0, drawMsg		# set argument register to string
syscall				# execute

li $v0, 10 			# the end of the program, AKA exit
syscall

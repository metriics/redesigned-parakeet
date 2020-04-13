# Written by:
# Steph Gagnon  - 100694227
# Jonah Griffin - 100702748

.data # put stuff we need in here
currentPlayer: .asciiz "X" 	# start currentPlayer as X.
turnCount: .word 1
maxTurns: .word 9
xStr: .asciiz "X"
oStr: .asciiz "O"
input: .word 1
emptySlot: .asciiz "."
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
NAmsg: .asciiz "That slot is not available, try again.\n"

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
	lb $t2, emptySlot
	addi $t0, $t0, 9
one:
	#loads three slots
	lb $t5, slot1
	lb $t6, slot2
	lb $t7, slot3
	#checks if any of the slots are empty spaces
	beq $t5, $t2, two
	subi $t0, $t0, 1
	beq $t6, $t2, two
	subi $t0, $t0, 1
	beq $t7, $t2, two
	subi $t0, $t0, 1
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, two
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
		
two:
	#loads three slots
	lb $t5, slot4
	lb $t6, slot5
	lb $t7, slot6
	#checks if any of the slots are empty spaces
	beq $t5, $t2, three
	subi $t0, $t0, 1
	beq $t6, $t2, three
	subi $t0, $t0, 1
	beq $t7, $t2, three
	subi $t0, $t0, 1
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, three
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
three:
	#loads three slots
	lb $t5, slot7
	lb $t6, slot8
	lb $t7, slot9
	#checks if any of the slots are empty spaces
	beq $t5, $t2, four
	subi $t0, $t0, 1
	beq $t6, $t2, four
	subi $t0, $t0, 1
	beq $t7, $t2, four
	subi $t0, $t0, 1
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, four
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
four:
	#loads three slots
	lb $t5, slot1
	lb $t6, slot4
	lb $t7, slot7
	#checks if any of the slots are empty spaces
	beq $t5, $t2, five
	beq $t6, $t2, five
	beq $t7, $t2, five
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, five
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
five:
	#loads three slots
	lb $t5, slot2
	lb $t6, slot5
	lb $t7, slot8
	#checks if any of the slots are empty spaces
	beq $t5, $t2, six
	beq $t6, $t2, six
	beq $t7, $t2, six
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, six
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
six:
	#loads three slots
	lb $t5, slot3
	lb $t6, slot6
	lb $t7, slot9
	#checks if any of the slots are empty spaces
	beq $t5, $t2, seven
	beq $t6, $t2, seven
	beq $t7, $t2, seven
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, seven
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
seven:
	#loads three slots
	lb $t5, slot1
	lb $t6, slot5
	lb $t7, slot9
	#checks if any of the slots are empty spaces
	beq $t5, $t2, eight
	beq $t6, $t2, eight
	beq $t7, $t2, eight
	#checks if first two slots are equal if not moves to next win condition
	bne $t5, $t6, eight
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
eight:
	#loads three slots
	lb $t5, slot3
	lb $t6, slot5
	lb $t7, slot7
	#checks if any of the slots are empty spaces
	beq $t5, $t2, switch
	beq $t6, $t2, switch
	beq $t7, $t2, switch
	#checks if first two slots are equal if not moves to switch player turn
	bne $t5, $t6, drawCheck
	#if first two are equal checks if other slot is equal
	beq $t5, $t7, win
	
drawCheck:
	
	lw $t0, turnCount
	lw $t9, maxTurns
	beq $t0, $t9, d
	
	#moves to switch player turn
	j switch

win:
	#checks if x won
	lb $t8, xStr
	beq $t5, $t8, x
	#goes to o won if x doesnt match
	j o
	
x:
	li $t1, 1
	j end
	
o:
	li $t1, 2
	j end

d:
	li $t1, 3
	j end
	
end:
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
	
	# end the game based on victor
	beq $t1, 1, xwin	 # if $t1 = 1, x wins, branch to xwin
	beq $t1, 2, owin	 # if $t1 = 2, o wins, branch to owin
	beq $t1, 3, draw 	 # if $t1 = 3, draw, branch to draw
	
switch:
	# switch current player
	
	#Adds 1 to turn count
	lw $t0, turnCount
	add $t0, $t0, 1
	sw $t0, turnCount
	
	la $a0, currentPlayer 	# get address of currentPlayer and store it in $a0
	lb $t3, ($a0)			# get contents at address $a0 and store in $t3
	
	la $a1, oStr			# get address of oStr and store in $a1
	lb $t4, ($a1)			# get contents at address $a1 and store in $t4
	beq $t3, $t4, setX  	# if $t3 == $t4, branch to setX
	
	la $a1, xStr			# get address of xStr and store in $a1
	lb $t4, ($a1)			# get contents at address $a1 and store in $t4
	beq $t3, $t4, setO		# if $t3 == $t4, branch to setO

up1:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot1				# get contents of slot
la $a0, slot1				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up2:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot2				# get contents of slot
la $a0, slot2				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up3:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot3				# get contents of slot
la $a0, slot3				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up4:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot4				# get contents of slot
la $a0, slot4				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up5:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot5				# get contents of slot
la $a0, slot5				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up6:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot6				# get contents of slot
la $a0, slot6				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up7:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot7				# get contents of slot
la $a0, slot7				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up8:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot8				# get contents of slot
la $a0, slot8				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

up9:
lb $t2, emptySlot			# get contents of emptySlot
lb $t1, slot9				# get contents of slot
la $a0, slot9				# get address of slot and store it in $a0
lb $a1, currentPlayer 			# set $a1 to current player char
bne $t1, $t2, slotNA			# branch to slotNA if slot is not available

sb $a1, 0($a0)				# set address stored in $a0 to contents of $a1
j checkVictor				# check new board state to see if there is a victor

setO:
la $a0, currentPlayer
lb $a1, oStr
sb $a1, 0($a0)
j while

setX:
la $a0, currentPlayer
lb $a1, xStr
sb $a1, 0($a0)
j while

slotNA:
li $v0, 4		# tell system to print string
la $a0, NAmsg		# set argument register to string
syscall	
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

# Written by:
# Steph Gagnon  - 100694227
# Jonah Griffin - 100702
.data # put stuff we need in here
intArray: .space 12 # in size in bytes * num of ints

.text # main program
while:
	beq $t1,15,exit # if $t1 = 15, branch to exit
	li $t1,1		# ?
	add $t1,$t1,1	# increment $t1 by 1
exit:
li $v0,10			# ?
syscall				# ?
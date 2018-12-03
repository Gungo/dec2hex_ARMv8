.data
infmt: 		.asciz "%d"
outfmt:		.asciz "%X"
flush:		.asciz "\n"

prompt: 	.asciz "Enter a number: \n"

input: 		.space 100


.text
.global main

main:
	# output first prompt
	ldr x0, =prompt
	bl printf

	# take in the number
	ldr x0, =infmt
	ldr x1, =input
	bl scanf

	# print the buffer
	ldr x0, =outfmt
	ldr x1, =input
	ldr x1, [x1, #0]
	bl printf

	#Flush the stdout buffer
        ldr x0, =flush
        bl printf

        #Exit the program
        b exit

exit:	mov x0, #0
        mov x8, #93
	svc #0

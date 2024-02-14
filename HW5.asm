.data
.word

options:    .asciiz "print all options\n"
string_input:   .space 100
word_input:      .space 4
first_customer: .word 0


.text


main:
la $s0, first_customer
program_loop:#this loop prints the main menu, waits for input and executes the option matching the input
		#print menu
		li $v0,4
		la $a0 , options
		syscall
		jal add_customer
       		
       		
       		
       		
       		
       		
       		
       		
       		
       		
       		
add_customer:
# Read the first integer input
    jal place_int_input

    # Read the string input
    jal place_string_input

    # Read the second integer input
    jal place_int_input
       		
# Procedure to read an integer input into word_input and store it at the address in $s0
place_int_input:
    li $v0, 5           # System call code for reading an integer
    syscall             # Invoke the system call
    move $t0, $s0      # Load the current address stored in $s0 into $t0
    sw $v0, 0($t0)      # Store the integer input at the address in $t0
    addiu $s0, $s0, 4   # Increment $s0 to point to the next word_input
    jr $ra              # Return to the calling routine

# Procedure to read a string input into string_input and store it at the address in $s0
# Procedure to read a string input into string_input and store it at the address in $s0
place_string_input:
    li $v0, 8           # System call code for reading a string
    la $a0, string_input  # Load address of string_input into $a0
    li $a1, 100         # Maximum number of characters to read
    syscall             # Invoke the system call
    move $t0, $s0      # move the current address in $s0 into $t0
    move $t1, $a0       # Move the address of the input string to $t1
    copy_loop:
        lb $t2, 0($t1)      # Load a byte from the input string
        sb $t2, 0($t0)      # Store the byte to the memory location pointed by $t0
        addiu $t0, $t0, 1   # Increment $t0 to point to the next memory location
        addiu $t1, $t1, 1   # Increment $t1 to point to the next byte in the input string
        bne $t2,10, copy_loop # Continue copying if the byte is not null
    addiu $s0, $s0, 100   # Increment $s0 to point to the next string_input
    jr $ra              # Return to the calling routine       # Return to the calling routine

       		
       		
       		
       		
       		
       		
       		
       		
       		

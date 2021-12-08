TITLE Exam 2 part 3

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter a value: ", 0
	result BYTE "The result of the function is: ", 0


	

.code

Equation PROC
	push ebx
	
	add eax, eax
	add eax, eax
	mov ebx, eax					;2^2


	add eax, eax
	add eax, eax					;2^4 = 16

	sub eax, ebx
	pop ebx

	ret
Equation ENDP


main PROC
	


	mov edx, OFFSET prompt
	call writeString
	call readInt
	
	call Equation			;call equation func



	mov edx, OFFSET result
	call writestring
	call writeInt			;call int
	
	call crlf
	call WaitMsg

	exit

main ENDP
END main
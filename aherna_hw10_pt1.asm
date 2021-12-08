TITLE Activity 10

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter a value: ",0
	result BYTE "The value is even!",0
	result1 BYTE "The value is odd!",0


.code

isEven PROC
	test eax, 1
	jnz setNotEven
	jz moveForward

setNotEven:
	mov eax, 0
moveForward:
	ret
isEven ENDP


main PROC
	mov edx, OFFSET prompt
	call WriteString

	call ReadInt							;input from user stored in EAX register
	
	mov edx, OFFSET result

	call isEven

	cmp eax,0
	je stateOdd
	jne stateEven

stateOdd:									;I dont know if this is okay 
	mov edx, OFFSET result1					;but I could not think of another way
	call WriteString
	call Crlf
	call WaitMsg
	exit

stateEven:
	mov edx, OFFSET result
	call WriteString
	call Crlf
	call WaitMsg
	exit

	
main ENDP
END main
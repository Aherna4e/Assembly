TITLE Activity 10

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter a value: ",0
	result BYTE "The absolute value is: ",0


.code

Absolute PROC
	cmp eax, 0
	jl doit
	jmp dontdoit
doit:
	neg eax
dontdoit:
	ret
Absolute ENDP


main PROC
	mov edx, OFFSET prompt
	call WriteString

	call ReadInt					;input from user stored in EAX register
	call Absolute

	mov edx, OFFSET result
	call WriteString
	call WriteInt
	call Crlf

	call WaitMsg
	exit
main ENDP
END main
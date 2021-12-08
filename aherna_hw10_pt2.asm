TITLE Activity 10

INCLUDE Irvine32.inc

.data
	X DWORD 0
	Y DWORD 0
	answer DWORD 0

	prompt BYTE "Enter a value for X: ",0
	prompt1 BYTE "Enter a value for Y: ",0

	result BYTE "X to the Y power is: ",0
	


.code

power PROC
	push ecx
	push esi
	push edi
	mov ecx, edi							;length of y

outer:
	
	push ecx
	mov ecx, esi							;length of x
inner:

	add esi, esi
		
	;calling print on eax register
	;mov eax, edi
	;call WriteInt

	loop inner

	;this is EQUAL outside of outer inner loop
	mov edi, esi
	
	pop ecx
	loop outer

	mov eax, esi
	
	pop edi
	pop esi
	pop ecx
	ret
power ENDP


main PROC
	mov edx, OFFSET prompt
	call WriteString
	call ReadInt							;input from user stored in EAX register(X)
	mov X, eax

	mov edx, OFFSET prompt1
	call WriteString
	call ReadInt							;input from user stored in EAX register(Y)
	mov Y, eax

	mov esi, X								;To pass into funct power
	mov edi, Y
	
	call DumpRegs
	call power

	mov edx, OFFSET result
	call WriteString
	call WriteInt


	call Crlf
	call WaitMsg
	exit

	
main ENDP
END main
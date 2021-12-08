TITLE hw 06 part 2

INCLUDE Irvine32.inc

.data
	array WORD 8,3,1,4,9,5,7,2,6,10
	value DWORD OFFSET array
	mySum DWORD 0

.code
main PROC
	mov ecx, 5
again:
	mov ebx, value
	movzx eax, WORD PTR [ebx]
	call WriteInt
	
	mov edx, mySum		;new reg for sum, prepare sum
	add edx, eax		;add ptr value to register
	mov mySum, edx		;add to my sum

	inc value			;increment two times to get to actual value
	inc value

	mov ebx, value		;same as first code block but negative
	movzx eax, WORD PTR [ebx]
	neg eax
	call WriteInt		

	mov edx, mySum		;new reg for sum, prepare sum
	add edx, eax		;add ptr value to register
	mov mySum, edx		;add to my sum

	inc value
	inc value

	loop again

	mov ax, 61
	call WriteChar

	mov eax, mySum
	call WriteInt
	Call Crlf
	call WaitMsg
	exit
main ENDP
END main
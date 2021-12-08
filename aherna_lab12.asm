TITLE lab 12

INCLUDE Irvine32.inc

.data
	x DWORD ?
	y DWORD ?
	r DWORD ?

	xprompt BYTE "Enter a value for x: ", 0
	yprompt BYTE "Enter a value for y: ", 0
	result BYTE "The result is: ", 0
	

.code

Multiply PROC
	push ebx
	push ecx
	mov eax, 0

again:
	cmp ecx,0
	je done
	test ecx, 1
	jz dontdoit
	add eax, ebx
dontdoit:
	shl ebx, 1
	shr ecx, 1
	jmp again
done:
	pop ecx
	pop ebx
	ret
Multiply ENDP


main PROC
	mov edx, OFFSET xPrompt
	call WriteString
	call readInt
	mov x, eax

	mov edx, OFFSET yPrompt
	call WriteString
	call readInt
	mov y, eax

	mov ebx, x
	mov ecx, y
	call Multiply
	mov r, eax


	mov edx, OFFSET result
	call WriteString
	mov eax, r
	call writeInt

	
	
	call crlf
	call WaitMsg

	exit

main ENDP
END main
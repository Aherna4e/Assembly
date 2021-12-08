TITLE Activity 06

INCLUDE Irvine32.inc

.data
	golf BYTE "Golf", 0
	character DWORD OFFSET golf

.code
main PROC
	mov ecx, 4
again:
	mov eax, character
	mov al, BYTE PTR [eax]
	call WriteChar
	inc character
	loop again

	Call Crlf
	call WaitMsg
	exit
main ENDP
END main
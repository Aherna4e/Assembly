TITLE hw 06 part 2

INCLUDE Irvine32.inc

.data
	A SWORD 1
	B SWORD 2
	CC SWORD 3
	D SWORD 4
	Space BYTE 32

.code
main PROC
	movsx eax, A			;printing out first line
	call WriteInt
	mov al, Space
	call WriteChar

	movsx eax, B
	call WriteInt
	mov al, Space
	call WriteChar

	movsx eax, CC
	call WriteInt
	mov al, Space
	call WriteChar

	movsx eax, D
	call WriteInt
	mov al, Space
	call WriteChar
	Call Crlf

	movsx eax, A			;second line using push
	push eax

	movsx eax, B	
	push eax
	pop eax
	call WriteInt
	mov al, Space
	call WriteChar

	movsx eax, CC
	push eax
	pop eax
	call WriteInt
	mov al, Space
	call WriteChar

	movsx eax, D
	push eax
	pop eax
	call WriteInt
	mov al, Space
	call WriteChar

	pop eax
	Call WriteInt			;back to A

	Call Crlf
	call WaitMsg
	exit
main ENDP
END main
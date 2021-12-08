TITLE Exam 2

INCLUDE Irvine32.inc

.data
	Space BYTE 32

	a DWORD 9
	b DWORD 14
	cc DWORD 11
	d DWORD 5
	

.code


main PROC
	mov eax, a	; Doing b = a + d - b - c
	add eax, d
	sub eax, b
	sub eax, cc
	mov b, eax   


	mov eax, b		;Doing a = b + d + d + a + -(-b) - b - d - d + c - a - c;
	add eax, d
	add eax, d
	add eax, a

	mov ebx, b		;onto -(-b)
	neg ebx
	sub eax, ebx 

	sub eax, b
	sub eax, d
	sub eax, d

	add eax, cc
	sub eax,  a
	sub eax, cc	
	mov a, eax		;End
	
	mov eax, a		;Doing c = a + d;
	add eax, d
	mov cc, eax

	mov eax, cc		;Doing d = c + a + 42;
	add eax, a
	add eax, 42
	mov d, eax
	
	
	mov eax, a		;Output
	call WriteInt
	mov al, Space
	call WriteChar

	mov eax, b
	call WriteInt
	mov al, Space
	call WriteChar
	
	mov eax, cc
	call WriteInt
	mov al, Space
	call WriteChar

	mov eax, d
	call WriteInt
	call crlf
	call WaitMsg
	exit

main ENDP
END main
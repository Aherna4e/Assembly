TITLE Hw 9 pt 2

INCLUDE Irvine32.inc

.data
	x DWORD 0
	cc DWORD 0
	result DWORD 0

	enterSigned1 BYTE "Enter a value for x: ", 0
	enterSigned2 BYTE "Enter a value for c: ", 0
	funct BYTE "f(x) = ", 0

.code

Equation PROC
	push ecx
	push esi
	push edi

	mov eax, 0							;setup for result
again:
	add eax, esi						;addd 8 times register esi(var x)
loop again

	add eax, edi						;final adding of register edi (var c)

	pop edi
	pop esi
	pop ecx
	ret
Equation ENDP



main PROC

	mov edx, OFFSET enterSigned1		;value for x
	call WriteString
	call ReadInt
	mov x, eax

	mov edx, OFFSET enterSigned2		;value for c
	call WriteString
	call ReadInt
	mov cc, eax

	mov ecx, 8							;count for loop

	mov esi, x
	mov edi, cc
	

	call Equation						;Go to Equation function

	mov result, eax
	mov edx, OFFSET funct
	call WriteString
	call writeInt
	call Crlf

	
	



	call WaitMsg
	exit
main ENDP
END main
TITLE hw 06 part 1

INCLUDE Irvine32.inc

.data
	value DWORD 3

	character DWORD OFFSET value

.code
main PROC
	mov ecx, 10
again:
	mov eax, value
	call WriteInt
	call Crlf
	
	add value, 3

	loop again


	Call Crlf
	call WaitMsg
	exit
main ENDP
END main
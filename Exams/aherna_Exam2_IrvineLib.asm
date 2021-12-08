TITLE Exam 2 part 2

INCLUDE Irvine32.inc

.data
	equal BYTE 61
	dash BYTE 45
	prompt BYTE "How many iterations? ", 0


	

.code


main PROC
	call randomize		;for random stuff

	mov eax,  (16 * white) + green
	call SetTextColor

	mov edx, OFFSET prompt
	call writeString
	call readInt
	mov ecx, eax

	call  Clrscr



again:
	mov dl, 1    ;moving
	mov dh, 9
	call GotoXy
	
	mov eax, 31
	call RandomRange
	add eax, 30
	call WriteInt

	mov ebx, eax	;store in here

	mov al, dash
	call writeChar


	mov eax, 11
	call RandomRange
	add eax, 10
	call WriteInt
	mov edx, eax

	mov al, equal
	call writeChar

	sub ebx, edx
	mov eax, ebx
	call writeInt

	

	mov eax, 2000  ;call delay
	call Delay

loop again

	
	call crlf
	call WaitMsg

	exit

main ENDP
END main
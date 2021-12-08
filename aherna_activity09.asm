TITLE Activity 9

INCLUDE Irvine32.inc

.data
	enterSigned1 BYTE "Enter a signed integer value: ", 0
	enterSigned2 BYTE "Enter a second signed integer value: ", 0
	sumIs BYTE "The sum is: ", 0
	differenceIs BYTE "The difference is: ", 0
	
.code
main PROC
	mov ecx, 3
again:


	call ClrScr
	mov dl,10
	mov dh, 10
	call GotoXY

	mov edx, OFFSET enterSigned1
	call WriteString
	call ReadInt							;input goes into eax
	mov edi, eax

	mov dl, 10
	mov dh, 11
	call GotoXY
	mov edx, OFFSET enterSigned2
	call WriteString
	call ReadInt
	mov esi, eax

	mov eax, esi							;add
	add eax, edi
	mov edx, OFFSET sumIs
	call WriteString
	call WriteInt
	call Crlf

	mov eax, edi							;sub
	sub eax, esi
	mov edx, OFFSET differenceIs
	call WriteString
	call WriteInt
	call Crlf

	mov eax, 2000
	call Delay

	loop again

	call WaitMsg
	exit
main ENDP
END main
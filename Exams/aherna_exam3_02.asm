TITLE exam3pt1

INCLUDE Irvine32.inc

.data
    inputA   BYTE  "Enter value: ", 0
    output0  BYTE  "Not a match...  Game is now over!", 0
    output1  BYTE  "Nice pick!  You hit the jackpot!  And you get to pick again!", 0
    output2  BYTE  "Second place winner!  You get to pick again!", 0
    output3  BYTE  "Third place winner!  You get to pick again!", 0
    AA       DWORD ?
    RESULT   DWORD ?
.code



Modulus PROC
	push edx
	cdq
	idiv ebx
	mov eax, edx
	pop edx
	ret
Modulus ENDP

main PROC 
    ; ----------------------------------------------------------------------------------
    ; YOU MAY ONLY ADD TO THIS FILE IN ORDER TO IMPLEMENT THE BELOW LOGIC
    ; YOU MUST IMPLEMENT THE LOGIC EXACTLY AS SHOWN
    ; YOU WILL RECEIVE ZERO POINTS IF YOU IMPLEMENT YOUR LOGIC DIFFERENTLY THAN SHOWN
    ; ----------------------------------------------------------------------------------
    ;
    ; do {
again:

         mov  edx, OFFSET inputA                 ; AA = Input("Enter value: ")
         call WriteString
         call ReadInt
         mov  AA, eax

    ; IF AA % 45 == 0 then RESULT = 1
    ; ELSE IF AA % 9 == 0 THEN RESULT = 2
    ; ELSE IF AA % 5 == 0 THEN RESULT = 3
    ; ELSE RESULT = 0
    
    ; IF RESULT == 0 THEN PRINT "Not a match...  Game is now over!"
    ; ELSE IF RESULT == 1 THEN PRINT "Nice pick!  You hit the jackpot!  And you get to pick again!"
    ; ELSE IF RESULT == 2 THEN PRINT "Second place winner!  You get to pick again!"
    ; ELSE PRINT "Third place winner!  You get to pick again!"
    
         call Crlf
    ; } while (RESULT != 0);
    ;
    ; ----------------------------------------------------------------------------------
    ; YOU MAY ONLY ADD TO THIS FILE IN ORDER TO IMPLEMENT THE ABOVE LOGIC
    ; ----------------------------------------------------------------------------------
    
    mov eax, aa
    mov ebx, 45
    call Modulus
    cmp eax,0
    jne elseIff

    mov result, 1
    jmp getmeout

elseIff:
    mov eax, aa
    mov ebx, 9
    call Modulus
    cmp eax,0
    jne elseiff1
    mov result, 2
    jmp getmeout


elseiff1:
    mov eax, aa
    mov ebx, 5
    call Modulus
    cmp eax,0
    jne else0
    mov result, 3
    jmp getmeout



else0:


    mov RESULT, 0
   ; cmp RESULT, 0
    ;je done 
    

getMeOut:
    cmp result, 0
    je done
    cmp result,1
    jne elseIfResult
    mov edx, offset output1
    call writestring
    jmp again
    ; ELSE IF RESULT == 1 THEN PRINT "Nice pick!  You hit the jackpot!  And you get to pick again!"




elseIfResult:
    cmp result,2
    jne elsePrint
    mov edx, offset output2
    call writestring
    jmp again
    ; ELSE IF RESULT == 2 THEN PRINT "Second place winner!  You get to pick again!"


elsePrint:
    mov edx, offset output3
    call writestring
    jmp again
    ; ELSE PRINT "Third place winner!  You get to pick again!"
    




done:
    mov edx, offset output0
    call writestring
    call Crlf
    exit                                            
main ENDP
END main
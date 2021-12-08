TITLE homework 14

INCLUDE Irvine32.inc

.data
    result BYTE "The square root of ",0
    result1 BYTE " is: ",0


.code

SquareRoot PROC
    push ebp
	mov ebp, esp
	sub esp, 8                          ; two local variable being SQRT = 0 and
                                        ;SUBTRACTANT = 1;
                                        ;and i have X being passed into the function
    
    mov DWORD PTR [ebp - 4], 0          ;SQRT RETURN VAL
    mov DWORD PTR [ebp - 8], 1          ;SUBTRACTANT

first:
    mov eax, [ebp - 8]   

    CMP DWORD PTR [ebp + 8], eax         ;while (x >= subtractant)
    jb done
     
    sub  DWORD PTR [ebp + 8], eax        ; x -= subtractant;
    add  DWORD PTR [ebp - 8], 2          ;subtractant += 2;
    inc DWORD PTR [ebp - 4]              ;++sqrt;
   
    jmp first

done:

    mov eax,  DWORD PTR [ebp - 4]
    add esp, 8
	pop ebp
	ret 4
SquareRoot ENDP

main PROC
    mov ecx, 0
again:
    ;call dumpregs
    cmp ecx, 100
    ja mainDone
    
    mov edx, OFFSET result
    call writeString
    mov eax, ecx
    call writeInt

    push ecx                
    call SquareRoot 

    mov edx, OFFSET result1
    call writeString                ;error here after 35th loop
                                    ;Unhandled exception at 0x0F1EB530 in Project.exe: 0xC00001A5: 
                                    ;An invalid exception handler routine has been detected 
    call writeInt

    inc ecx
    call crlf
    jmp again

mainDone:
    call waitmsg 
    exit

main ENDP
END main
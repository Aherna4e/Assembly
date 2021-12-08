TITLE lab 15

INCLUDE Irvine32.inc

.data


.code

RecursiveFunction PROC
    push ebp
    mov ebp, esp
    push eax
    
    cmp DWORD PTR [ebp + 8], 0
    jle endNow

    test DWORD PTR [ebp + 8], 1
    jnz isFalse
isTrue:
    dec DWORD PTR [ebp + 8]
    push DWORD PTR [ebp + 8]
    call RecursiveFunction
    mov eax, DWORD PTR [ebp + 8]
    call WriteDec
    mov al, ' '
    call writeChar
    jmp endNow


isFalse:
    mov eax, DWORD PTR [ebp + 8]
    call writeDec
    mov al, ' '
    call writeChar
    mov eax, DWORD PTR [ebp + 8]
    shr eax,1
    dec eax
    push eax
    call recursiveFunction

    


endNow:
    pop eax
    pop ebp
    ret 4

RecursiveFunction ENDP





main PROC
    push 1111
    call RecursiveFunction
   



    call crlf
    call waitmsg 
    exit

main ENDP
END main
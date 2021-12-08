TITLE exam3pt3

INCLUDE Irvine32.inc

.data
    win dword 0
    losses dword 0
    printWin  BYTE  "WINS: ", 0
    printlosses  BYTE  "LOSSES: ", 0

    output1  BYTE  "loop1", 0
    output2  BYTE  "loop2", 0
    output3  BYTE  "loop3", 0

.code


Roll PROC                                    ;side is passed in
    push ebp
    mov ebp, esp

    mov eax, DWORD PTR [ebp + 8]            ;how many sides are going in 
    call randomrange
    add eax, 1                              ;add the right amount of sides
   
    pop ebp
    ret 4
Roll ENDP



Play PROC
   push ebx
   push edx

   push 6                                   ;passing number of sides to roll func
   call Roll
  
   mov ebx, eax                             ;number of rolls
   mov eax, 0
   
   cmp ebx, 6                               ;immediate win
   jne next
   mov eax,1
   jmp done                                 ; no problems here and up


next:
    cmp ebx, 3
    jb nextnext

    push 6 
    call Roll
    mov ebx, eax                            ;two calls to roll add together

    push 6 
    call Roll
    add ebx, eax

    cmp ebx, 7                              ;check if win
    jb nextnext
    mov eax, 1
    jmp done

nextnext:                                   ;you lose
    mov eax, 0


done:
    pop edx
    pop ebx
    ret
Play ENDP




main PROC 
    call randomize
    mov ecx, 1000000
again:

    call Play
    cmp eax, 0
    jne ifwin
    inc losses
    jmp jmpout
ifwin:
    inc win
jmpout:

    loop again




    ;the end results
    
    mov edx, offset printwin
    call writeString

    mov eax,win
    call writeint
    call crlf

    mov edx, offset printLosses
    call writeString
    mov eax, losses
    call writeint
    call crlf

    call waitmsg
    exit
main ENDP
END main
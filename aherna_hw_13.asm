TITLE homework 13

INCLUDE Irvine32.inc

.data
    comma BYTE 44
    space BYTE 32


.code

Multiplication PROC
    push edx
    imul edi
    pop edx
   ; call writeInt
    ret
Multiplication ENDP

Division PROC
    push edx
    cdq
    idiv esi
    pop edx
   ; call writeInt
    ret
Division ENDP

Modulus PROC
    push edx
    cdq
    idiv edi
    mov eax, edx
    pop edx
   ; call writeInt
    ret
Modulus ENDP


main PROC

    mov ebx, 1

first:
    cmp ebx, 1400
    jg done                                ;bracket first

    mov eax, ebx                    ;cout<<ebx
    call writeInt
    mov al, comma                    ;cout<<','
    call writeChar
    mov al, space                    ;cout<<' '
    call writeChar

    mov ecx, 1                        ;ECX = 1;
    mov esi, ebx                    ;ESI = EBX;
    ;call dumpregs

second:
    cmp esi, 0                    ;while (esi > 0)
    jbe innerDone

                            ;edi = Modulus(esi, 10);
    mov eax,esi
    mov edi, 10
   ; call dumpregs
    call Modulus
    
    mov edi, eax
   ; call dumpregs
third:
    cmp edi, 0    ;if (edi != 0)
    je innerInnerDone
    mov eax, ecx
    call Multiplication             ;ecx = Multiplication(ecx, edi)
   ; call dumpregs
    mov ecx, eax
   ; call dumpregs

    ;call writeInt;;;;;;;;;;;;;;;alll zeros



innerinnerDone:
    mov eax, esi
    mov esi, 10
    call Division ;esi = Division(esi, 10);
    mov esi, eax
   ; call dumpregs
    jmp second

innerDone:
    add ebx, ecx
    jmp first

done:
                                        ;outer loop maybe idk
    call crlf
    call WaitMsg

    exit

main ENDP
END main
TITLE lab 15

INCLUDE Irvine32.inc

.data
    pROMPT1 byte "What's the lightest chemical element? (1) Helium (2) Hydrogen (3) Lithium (4) Tungsten ...? ",0
    WRONG1 byte "Your correct answer streak has ended before it ever beg",0
    PROMPT2 BYTE "Which atomic orbital is spherical in shape? (1) D  (2) F  (3) S  (4) P ...? ",0
    wrong2 byte "First one right, second one not so much!",0
    right byte "You know all the chemistry!",0


.code



main PROC
    mov edx, offset prompt1
    call writeString
    call readint
    cmp eax, 2
    je else0

    mov edx, offset wrong1
    call writeString 
    jmp done    ;end here finish code wrong answer


else0:
    mov edx, offset prompt2
    call writeString
    call readint

    cmp eax, 3
    je else1
    mov edx, offset wrong2
    call writeString
    jmp done


else1:
    mov edx, offset right
    call writeString
  


done:
    call crlf
    call waitmsg 
    exit

main ENDP
END main

SECTION     .data
msg     db      "Bravo e Ottimo, Adesso trovare mi", 0Ah

SECTION     .text
global  _start

_start:
    mov     ebx, msg    ; moves the address of the variable msg into EBX
    mov     eax, ebx    ; moves the address of EBX into EAX and now both registers points to the same address i,e msg

nextchar:                   ; this is like a while loop
    cmp     byte[eax], 0    ; compare the byte pointed to by EAX at this address against 0. 0 is end of the string delimitter.
    jz      finished        ; when the value at byte[eax] is equal to 0 then jump to the point in the code labeled 'finished'
    inc     eax             ; increment the EAX register.
    jmp    nextchar        ; do recursion until EAX is 0.

finished:
    sub     eax, ebx    ; subtracting the end marker and the initial pointer gives the number of segments/bytes between them
    mov     edx, eax    ; size_t count; number of bytes
    mov     ecx, msg    ; *buf ; the buffer address
    mov     ebx, 1      ;   fd; file descriptor
    mov     eax, 4      ; opcode for sys_write
    int     80h         

    mov     ebx, 0      ; exit without errors
    mov     eax, 1      ; opcode for sys_exit
    int     80h

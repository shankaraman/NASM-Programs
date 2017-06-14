; SYS_WRITE (POSIX) function prototype : ssize_t write(int fd, const void *buf, size_t bytes)
; SYS_EXIT function prototype : ssize_t exit(int error_code)
SECTION .data
msg     db      "Hello World!", 0Ah

SECTION .text
global _start

_start:
    
    mov     edx, 13     ; writes 13 bytes. size_t
    mov     ecx, msg    ; const void *buf. 
    mov     ebx, 1      ; file descriptor. int fd.
    mov     eax, 4      ; opcode for sys_write
    int     80h         ; interrupt signal. passes control to the IVT.

    mov     ebx, 0      ; int error_code : 0 -> termination without errors and 1 -> with errors
    mov     eax, 1      ; opcode for systemcall exit
    int     80h

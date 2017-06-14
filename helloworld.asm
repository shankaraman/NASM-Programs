SECTION .data
msg     db      'Hello World!',     0Ah ; equivalent to 0xA. h means hexadecimal

SECTION .text
global _start


_start:
    mov edx, 13 ; number of bytes to write | size_t count
    mov ecx, msg ; moves the memory address of the msg - 'Hello World' | const char *buf
    mov ebx, 1 ; write to STDOUT  | unsigned int fd
    mov eax, 4 ; kernel opcode for SYS_WRITE  | sys_write()
    int 80h

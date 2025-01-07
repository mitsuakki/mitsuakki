section .data
    msg: db "Hello World !", 10
    msgSize equ $ - msg

global start

section .text
    start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgSize
    int 0x80
    mov eax, 1
    mov ebx, 0
    int 0x80
    ret
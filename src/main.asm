section .data
    ip db 0             ; INADDR_ANY
    port dw 8080        ; port 8080 in network byte order
    backlog dw 10       ; max pending connections
    http_response db "HTTP1/1 200 OK", 13, 10
                  db "Content-Type : text/html", 13, 10
                  db "Content-Length: 13", 13, 10
                  db 13, 10
                  db "Hello, World !", 0
    http_len equ $ - http_response

section .bss
    sockfd resd 1       ; socket file desc
    clientfd resd 1     ; client file desc
    client_addr resb 16 ; client address storage
    addr_len resd 1     ; length of client addr


section .text
    global _start

_start:
    ; Create socket
    mov eax, 102        ; sys_socketcall
    mov ebx, 1          ; SYS_SOCKET
    lea ecx, [esp]      ; args
    push 6              ; IPPROTO_TCP
    push 1              ; SOCK_STREAM
    push 2              ; AF_INET
    int 0x80            ; call kernel
    mov [sockfd], eax   ; save socker file desc


_exit:
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel
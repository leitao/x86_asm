section .data
    msg db      "hello, world!\n"

section .text
    global _start

_start:
    mov     ecx, 10
  
Label:
    mov     r8d, ecx
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, 13
    syscall
    mov     ecx, r8d
    loop Label
    
    mov    rax, 60
    mov    rdi, 0
    syscall

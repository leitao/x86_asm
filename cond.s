section .data
    msg db      "  =    ", 0xa
    len equ $ - msg

section .text
    global _start

_start:
    mov     ecx, 10
  
Label:
# Save ecx into r8d. It will be overwritten by the syscall
    mov     r8d, ecx

# Starts with a = 0x61
    xor     r9, r9
    mov     r9, 0x61

    mov	    [msg], r9b
    mov     rdx, len

    call    func

# Syscall
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg

    syscall

# save ecx back
    mov     ecx, r8d
    loop Label
    
# exit
    mov    rax, 60
    mov    rdi, 0
    syscall

func:
    xor edx, edx
    mov ax, r9w
    mov dl, 10
    div dl

    add ah, '0'
    mov     [msg+4], ah
    
    add al, '0'
    mov     [msg+5], al

    ret

section .data
    msg: db "El valor mayor es: ", 0xA
    len: equ $-msg
    num1 dd 2
    num2 dd 6
    num3 dd 5

section .bss
    largest resb 2

section .text

global _start
_start:
    mov ecx, [num1]
    cmp ecx, [num2]
    jg check_third_num
    mov ecx, [num2]
    cmp ecx, [num3]
    jg _exit
    mov ecx, [num3]
    jmp _exit

check_third_num:
    cmp ecx, [num3]
    jg _exit
    mov ecx, [num3]

_exit:
    mov [largest], ecx
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80     ; call kernel

    mov ecx, largest
    mov edx, 2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

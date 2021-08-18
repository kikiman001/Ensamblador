section .bss
        buffer resb 1

section .text
global _start
_start:

        mov ax, 250
        mov dl, 100
        div dl       ; resultado - cociente en al, residuo en ah

        add al, '0'
        mov [buffer], al

        mov eax, 4      ;Output the result
        mov ebx, 1
        mov ecx, buffer
        mov edx, 1
        int 0x80


        mov eax, 1
        mov ebx, 0
        int 0x80
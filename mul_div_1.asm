section .text
global _start
_start:
    
    mov al, 10
    mov dl, 26
    mul dl

    mov dl, 0ffh
    mov al, 42h
    imul dl
    
    mov dl, 0ffh
    mov al, 0beh
    imul dl

    mov dl, 25
    mov al, 0f6h
    imul dl

    mov ax, 251
    mov cl, 12
    div cl

    xor dx, dx
    mov ax, 141bh
    mov cx, 012ch
    div cx
    

    mov eax, 1
    mov ebx, 0
    int 80H

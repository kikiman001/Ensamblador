section .text
global _start
_start:
	
	mov eax, 200
    push  eax
    call  sub
    mov   eax, 0F00Dh
    pop   eax
    mov eax, 1
    int 0x80

sub:    
    push ebp
    mov  ebp, esp
    mov  eax, 0BEEFh
    ;pop  ebp
    ret

section .datacd
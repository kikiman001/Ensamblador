section .data
		msg1: db "El resultado es: $",0Ah,0D,"$"
		len1:  equ-$msg1
section .bss
section .text

global _start

_start:
	mov eax, 12345;3039h
	mov ebx,9528;2528h
	add eax,ebx;555E
	
	mov ecx,-1275;FFFFFB05
	mov edx,-3001;FFFFF447
	sub dx,cx;FFFFF942
	
	add eax,edx;4EB3
	
	
	imul ecx;FE780a7F
	
	

;para finalizar el programa
        mov eax, 1;para finalizar el programa
        mov ebx, 0
        int 80H


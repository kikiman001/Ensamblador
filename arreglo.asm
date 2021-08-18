section .data
	array db 9,4,2,4,6,4,3,2,5,7;46
section .bss
section .text

global _start

_start:
	mov eax,0;almaceno los valores de mi suma
	mov ebx,0;indice i
	mov esi, array
loop_start:
		cmp ebx,9
		jg loop_end
		mov ecx,[esi]
		add al,cl
		inc esi
		inc ebx
		jmp loop_start	
loop_end:
;para finalizar el programa
	mov edx,eax
	mov eax, 4
	mov ebx, 1
	mov ecx, edx
	int 80h
	
        mov eax, 1;para finalizar el programa
        mov ebx, 0
        int 80H

section .data
section .bss
section .text

global _start

_start:
		mov ax, 9Ah; muevo el valor "X" a EAX
		jpe par ;si tiene paridad par saltar a la etiqueta par:
				;si no sigue el codigo
		or ax, 80H;activa el bit 8 a '1'
		par:;etiqueta del jump
			xor ax, 80h;invierte el bit 8 a '0'

;para finalizar el programa
        mov eax, 1;mueve 1 a eax
        mov ebx, 0;mueve 0 a eax "borra el contenido"
        int 80H


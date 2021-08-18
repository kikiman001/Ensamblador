section .data
section .bss
section .text

global _start

_start:
			  ;01000001
		mov ax,41h
		mov bx,ax; copia de ax
		mov cx,ax; copia de ax
		;       ah   al
		;shl   1000 0010
		;shl   0000 0101
		;shl   0000 1010
		;shl   0000 0100--resultado final--10h
		;shl es un movimiento a la izquierda
		shl al, 4;tenemos ax ==> 0x10
		mov bx,ax; guardamos el valor anterior en bx
		mov ax,cx;le pasamos el valor original a AX
		shr al,4;tenemos ax ==> 0x4
		xor ax,bx; ax==>0x10
		; ax==>0x4 "+" bx==>0x10 ==>0x14 
		;   0001 0100--resultado final--14h

;para finalizar el programa
        mov eax, 1;para finalizar el programa
        mov ebx, 0
        int 80H

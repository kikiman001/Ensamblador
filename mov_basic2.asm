section .data

	first db 00h, 04Fh, 012h, 0A4h
	second dw 165
	third db "adf"

Global _start
section .text
	_start:
		mov eax, first
		inc eax
		mov ebx, [eax]
		mov [second], ebx
		mov byte[third], 11o

		mov eax, 1
		mov ebx, 0
		int 0x80
section .data
	response DB 'Y'
	table1 DW 0  ; table1 DW 0 ,0 ,0 ,0
		   DW 0
		   DW 0
		   DW 0
	name1  DB 'Jim Ray'

section .text
global _start
	_start:
	mov al, [response]
	mov ebx, table1
	mov esi, name1
	mov word [ebx], 100
    mov byte [esi], 100
    mov [table1], byte 56
    mov [response], byte 'N'
	mov [name1], byte 'K'
	

    mov eax, 1
	mov ebx, 0
	int 0x80


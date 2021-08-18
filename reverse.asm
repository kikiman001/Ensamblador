;Script for reverse strings

section .data
	; texto to print and new line
	output1 db 'Reversed: ', 0
	len_output1 equ $-output1
	
	
section .bss
	;MAX LIMIT 50 bytes, 50 chars...
	msg resb 50
	lmsg resb 50
	
	;creating 2 counters
	counter resb 2
	counter2 resb 2
	
section .text
	
	global _start
	_start:
		mov eax, 3 					;sys_read
		mov ebx, 0
		
		mov ecx, msg 				;leyendo input
		mov byte [counter], 0x30	;counter as 0
		mov byte [counter2], 0x30	;counter as 0
		mov edx, 50				
		mov esi, lmsg
		int 0x80 					;call kernel
		
		
	_loop:
		cmp byte [ecx], 0x00		;comparing [ecx] 
		je _reverse					;jumping to reverse function
		inc ecx
		inc byte [counter]
		inc byte [counter2]
		jmp _loop					;repeating
		
		
	_reverse:
		cmp byte [counter2], 0x30	;comparing counter2
		je _output					;jumping to output function
		mov al, [ecx-1]				;last letter of msg
		mov [esi], al				;operation origin
		
		dec byte [counter2]			;counter2 - 1
		dec ecx						;ecx(msg) - 1
		inc esi						;esi + 1
		jmp _reverse				;repeating
		
		
	_output:
		int 0x80					;call kernel
		mov eax, 4					;sys_write
		mov ebx, 1					;stdin
		mov ecx, output1			;printing output
		mov edx, len_output1		;length of msg
		
		int 0x80
		mov eax, 4
		mov ebx, 1
		mov byte [esi+1], 0xA
		mov ecx, lmsg
		mov edx, 50d
		int 0x80
		
		mov eax, 1					;sys_exit
		int 0x80
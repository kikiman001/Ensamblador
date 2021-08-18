;Factorial de 1 a 8, versión recursiva
; Entrada : Número N entero por el usuario valor de 0 a 9
; Salida : Calculo de N!

section .data
    prom_msg: db "Introduce un numero entero" ,10
    lnprom : equ $-prom_msg
    out_msg: db "El factorial es :", 10
    lnout : equ $-out_msg
    error_msg: db "No es positivo... comenzar"
    lnerro : equ $-error_msg
	newln db 0xA, 0xD
	len_newl equ $-newln

section .bss
    num1 resb 2
    result resb 10

section .text
    global _start
    
    _start:
     	mov ecx, prom_msg
    	mov edx, lnprom
    	mov ebx, 1
    	mov eax, 4
			int 0x80     	
    
    try_again:
			mov ecx, num1
			mov edx, 2
			mov ebx, 0
    	mov eax, 3
			int 0x80
	
			mov bl, [num1]
			sub bl, '0'   
    	cmp bl, 0
    	jge num_ok
	
			mov ecx, error_msg
    	mov edx, lnerro
    	mov ebx, 1
    	mov eax, 4
			int 0x80     
	
			jmp try_again

    num_ok:
			call fact
			mov esi, result
			call int_to_string
			mov edi, eax

			mov ecx, out_msg
    	mov edx, lnout
    	mov ebx, 1
    	mov eax, 4
			int 0x80     
   	
			mov ecx, edi
    	mov edx, 6 ; todo
    	mov ebx, 1
    	mov eax, 4
			int 0x80     ; call kernel

			mov eax, 4
			mov ebx, 1
			mov ecx, newln
			mov edx, len_newl
			int 80h
	
   	done: 
			mov eax,1
			xor ebx, ebx
			int 0x80


  

 	int_to_string:
    add esi,9
    mov byte [esi],0
    mov ebx,10         

  next_digit:
    xor edx,edx         
    div ebx             
    add dl,'0'          
    dec esi             
    mov [esi],dl
    test eax,eax            
    jnz next_digit     
    mov eax,esi
    ret
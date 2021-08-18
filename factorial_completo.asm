;Factorial de 1 a 8, versión recursiva
; Entrada : Número N entero por el usuario valor de 0 a 9
; Salida : Calculo de N!

section .data
    prom_msg: db "Introduce un numero entero del 0 al 9" ,10
    lnprom : equ $-prom_msg
    out_msg: db "El factorial es :", 10
    lnout : equ $-out_msg
    error_msg: db "No es positivo... comenzar"
    lnerro : equ $-error_msg
	newln db 0xA, 0xD
	len_newl equ $-newln
	error_msg2: db "Numero mayor a 9"
    lnerro2 : equ $-error_msg2

section .bss
    num1 resb 2
    result resb 10;salida

section .text
    global _start
    
    _start:
    ;mensaje de bienvenida
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
			cmp bl, 0;si bl > 0 entonces es un numero positivo
			jge num_ok
			mov ecx, error_msg;si no imprime mensaje de error
			mov edx, lnerro
			mov ebx, 1
			mov eax, 4
			int 0x80
			  
	
			jmp try_again;ingresamos el numero otra vez

    num_ok:
			
			call fact;llamada a la funcion factorial
			mov esi, result
			call int_to_string;convertirsion
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
	
   	done: ;salida del programa
			mov eax,1
			xor ebx, ebx
			int 0x80
 	int_to_string:; funcion de conversion
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
             
fact:
   cmp   bl, 1; cuando n = 1 para para que no se multiplique por el 0
   jg    calculo
   mov   ax, 1
   ret
	
calculo:
   dec   bl;n-1
   call  fact;recursivo
   inc   bl;una vez checado de que bl no es 1
		   ;regresamos al n "inicial"
   mul   bl        ;ax = al * bl
   ret


mayor:
			mov ecx, error_msg2;si no imprime mensaje de error
			mov edx, lnerro2
			mov ebx, 1
			mov eax, 4
			int 0x80
			
			mov eax, 4
			mov ebx, 1
			mov ecx, newln
			mov edx, len_newl
			int 80h     
	
			jmp _start

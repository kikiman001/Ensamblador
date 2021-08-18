section .data ;line 1
    msg db  "Escribe una frase: "
    len equ $ - msg

section .bss
    cadn resb 50

section .text
  global _start

  _start:
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, cadn
    mov edx, 50  
    int 80h

    mov edi, ecx
    call print
    jmp end

print:
  push  ecx       ; Comenzamos a preservar los registros
  push  edx       ; que sabemos que necesitaremos utilizar
  push  eax       ; este proceso
  push  ebx

  mov   ecx, edi  ; ECX = localidad de memoria del enunciado
  call  strlen   ; calculamos la longitud del enunciado
  mov   edx, eax  ; EDX = Almacena la longitud string length
  mov   eax, 4    ; Escribimos el enunciado
  mov   ebx, 1    
  int   0x80     

  pop   ebx       ; Restauramos los registros
  pop   eax
  pop   edx
  pop   ecx

  ret             

  strlen:
    enter 0,0
    push  ecx           ; Salvamos el valor de registro
    xor   ecx, ecx      ; que se usa como contador

    strlen_next:
      cmp   [edi], byte 0  ; Comparación con el byte NULL
      jz    strlen_null   
      inc   ecx            ; caracter es diferente, seguir conteo
      inc   edi            ; pasar al siguiente caracter
      jmp   strlen_next   ; procesar de nuevo

    strlen_null:
      mov   eax, ecx       ; ECX = la longitud (se coloca en EAX)
      pop   ecx            ; restauramos ECX
    leave
    ret                  

end:
  mov eax, 1  
  xor ebx, ebx
  int 0x80    
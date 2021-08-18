;; tarea5_ejer1.asm
;; Programa que imprime textos

global _start

section .text

_start:
	;; Imprime facultad
	mov eax, 0x4 		; Escribe un 4 en eax
	mov ebx, 0x1		; Escribe un 1 en ebx
	mov ecx, facultad	; Escribe la posicion de la memoria de
	                        ; &facultad en ecx 
	mov edx, tamfac		; Escribe el tamaño de la cadena en edx
	int 0x80		/* Hace una llamada a sistema para imprimir en
	                           pantalla con el código 0x80 y usando los valores
				   de los registros eax, ebx, ecx y edx */

	;; Imprime nombre
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, nombre
	mov edx, tamnom
	int 0x80

	;; Imprime cuenta
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, cuenta
	mov edx, tamcuen
	int 0x80

	;; Sale del programa regresando 0
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data

facultad: 	db "Facultad de Ingenieria", 10
tamfac		equ	$ - facultad
	
nombre:		db "Octavio S. Cruz S.", 10
tamnom		equ	$ - nombre

cuenta:	 	db "314098547", 10
tamcuen		equ	$ - cuenta

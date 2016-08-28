
; test.asm
;
; Programa para prueba del compilador de jaguaOs
;



define primera "Hola "		; Define la variable "primera"

define segunda "UNI "





sub imprime
	mov RA, 1
	int
ret




; Code

org 020							; Define espacio de pila

mov RA, 2						; Clear Screen Function
int

mov DR, offset primera
call imprime

mov DR, offset segunda
call imprime

end


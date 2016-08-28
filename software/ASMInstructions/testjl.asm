
;- test.asm
;
;; Programa para prueba del compilador de jaguaOs
;


org 010							; Define espacio de pila

define primera "primera"		; Define la variable "primera"

define segunda "segunda"


mov RA, 2						; Clear Screen Function
int


: label_A

mov DR, offset segunda
mov RA, 1

int

cmp RA, RB

jl label_A


: label_B

mov DR, offset primera
mov RA, 1
int

end 							; End Program


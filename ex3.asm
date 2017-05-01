; Tópico 04 - Exercício 03

INCLUDE ..\Irvine32.inc			; biblioteca irvine

.data

.code
main PROC
	int 3

	; ADD
	mov eax, 91ab0748h
	mov ebx, 3f54f8f2h
	add eax, ebx
	
	; SUB
	mov eax, 91ab0748h
	sub eax, ebx
	
	; NEG
	mov eax, 91ab0748h
	neg eax

	; INC
	clc 					; demonstra que o carry clc não afeta a instrução mov limpando-a primeiro
	mov eax,7fffffffh
	inc eax
	
	; DEC
	mov eax,0
	dec eax		
	
	exit
main ENDP
END main

; Matriz Tópico 07

INCLUDE ..\Irvine32.inc

.data
	matA DWORD 3 DUP(?)
	RS = ($ - matA)
		DWORD 3 DUP(?)
		
	indice = 0 
	 
		
VAL BYTE ?
		
.code
main PROC
	int 3
	
	mov esi, indice
	mov ebx, OFFSET matA 
	mov ecx, 6
	
	l1: 
		mov  matA[esi], esi 
		add esi, 4  	;incrementa o indice 
		
		loop l1 
		
	
	exit
main ENDP
END main 

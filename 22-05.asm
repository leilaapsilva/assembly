; Matriz Tópico 07

INCLUDE ..\Irvine32.inc

.data
	matA BYTE 10H, 20H, 30H, 40H, 50H
	RS = ($ - matA)
		BYTE 60H, 70H, 80H, 90H, 0A0H
		BYTE 0B0H, 0C0H, 0D0H, 0E0H, 0F0H
	
VAL BYTE ?

rId = 2 
cId = 4 	
		
.code
main PROC
	int 3
	
	mov ebx, OFFSET matA 
	add ebx, RS * rId ; ponteiro aponte para o início da linha onde está o valor
	mov esi, cId 
	mov al, [ebx + esi]
	mov val, al 
	
	
	exit
main ENDP
END main 

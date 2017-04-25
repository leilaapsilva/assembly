Include ..\Irvine32.inc


.DATA

var1 WORD 1000h	; inicializando 'variaveis'
var2 WORD 2000h

.CODE

main PROC

	int 3
	
	; MOV and MOVZX
	mov ax, 0A69Bh
	movzx bx, al
	movzx ecx, ah
	movzx edx, ax 

	; MOVSX
	movsx bx, al
	movsx ecx,ah
	movsx edx, ax

	; XCHG
	xchg ax, var1
	xchg ax, var2
	xchg ax, var1 
	exit
main ENDP
END main 

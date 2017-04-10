; 16-bit program

.MODEL small
.STACK 100h

.code
main PROC
	mov ah, 4Ch
	mov al, 0
	int 21h
	
main ENDP
END main

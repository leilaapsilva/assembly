Include ..\Irvine32.inc


.DATA


	arrayW WORD 1000h,2000h,3000h
	rrayD DWORD 1,2,3,4

.CODE

main PROC

	int 3
	
	mov ax,[arrayW+2] 	; AX = 2000h
	mov ax,[arrayW+4] 	; AX = 3000h
	mov eax,[arrayD+4]	; EAX = 00000002h
	
	mov ax,[arrayW-2] ; ??
	mov eax,[arrayD+16] ; ??
	
	
	exit
main ENDP
END main 
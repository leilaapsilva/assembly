Include ..\Irvine32.inc


.DATA

	Xval DWORD 26
	Yval DWORD 30
	Zval DWORD 40
	Rval DWORD 0

.CODE

main PROC

	int 3 
	; Rval = Xval -(Yval + Zval)
	
	mov eax, Yval 
	neg eax 
	mov ebx, Zval 
	add eax, ebx
	mov ebx, Xval
	sub ebx, eax 
	mov Rval, eax 

	
	
	
	exit
main ENDP
END main
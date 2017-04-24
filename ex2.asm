Include ..\Irvine32.inc


.DATA

	arrayA BYTE 'y','l','b','m','e','s','s','a'			; "ylbmessa"
	arrayB BYTE 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h  ; 8 DUP(20h)

.CODE

main PROC

	int 3
	
	; Utilize o deslocamento direto para armazenar no segundo vetor definido
	; os caracteres do primeiro vetor em ordem inversa
	
	mov al, arrayA+7
	mov arrayB, al 
	mov al, arrayA+6
	mov arrayB+1, al 
	mov al, arrayA+5
	mov arrayB+2, al 
	mov al, arrayA+4
	mov arrayB+3, al 
	mov al, arrayA+3
	mov arrayB+4, al 
	mov al, arrayA+2
	mov arrayB+5, al 
	mov al, arrayA+1
	mov arrayB+6, al 
	mov al, arrayA
	mov arrayB+7, al 
	
	
	
	
	
	exit
main ENDP
END main 
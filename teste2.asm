
; Teste

Include ..\Irvine32.inc

 .data
 sum DWORD 0 ;quantos bytes o montador deve alocar(duas words) e o valor 0
 
 .code 
 
 main PROC
 
	mov eax, 5
	add eax, 6
	mov sum, eax ;guardando na posiçao de memoria o resultado da soma 
	
	
	call DumpRegs
	
	mov esi, OFFSET sum 
	mov ecx, LENGTHOF sum 
	mov ebx, TYPE sum 
	call DumpMem
 
	exit
main ENDP
 END main 
 
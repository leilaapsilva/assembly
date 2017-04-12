
; Teste

.386

.model flat, stdcall

; tamanho da pilha
 .stack 4096
 
 ExitProcess PROTO, dwExitCode:WORD
 
 .code 
 ; à partir daqui descrever o codigo em assembly
 
 main PROC
 
	mov eax, 5
	add eax, 6
 
	INVOKE ExitProcess, 0
 main ENDP
  END main 
 ; tudo que estiver depois do end main sera ignorado pelo montador
 

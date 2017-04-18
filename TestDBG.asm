; aula 17/04 - arq 2

; Adds two 32-bit integers. Used to Windbg test

Include ..\Irvine32.inc

.data 


val1 	DWORD  0	;ex 1 
val2	DWORD  0
val3	DWORD  0 
val4	DWORD  0

val5 	DWORD  0 	; ex 2 
			
val6 	DWORD  0 	; ex 3 
val7 	DWORD  0 

byte1 	BYTE	'A' ; ex 4
byte2	BYTE   	 0
byte3	BYTE   	 255
byte4	SBYTE  	-128
byte5	SBYTE   +127
byte6	BYTE   	 ?

word1 	WORD	65535
word2 	WORD	-32768
word3 	WORD	?

dword1	DWORD	0FFFFFFFFh
dword2	SDWORD	-2147483648

quad1	QWORD	0123456789ABCDEFh

count 	NAME  	500d ; ex 5 - a 

rows 	EQU	10 	; ex 5 - b 
cols	EQU 15 
msize 	EQU rows * cols 




.code
main PROC
  int 3 
  
	; ex 1 
	mov val1, 100
	mov val2, 100b
	mov val3, 64h
	mov val4, 01100100b
	
	; ex 2 
	mov val5, 100 + 100d + 64h + 01100100b
	
	; ex 3 
	mov val6, 'a'
	mov val7, "abcd"
	
	; ex 5 - a 
	mov eax, count 
	mov cout, 100d 
	add eax, count 
	
	;;;;; 
	
	mov eax,5 ; move 5 to the eax register
	add eax,6 ; add 6 to the eax register
	
	exit
main ENDP
END main


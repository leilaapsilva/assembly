; Adds two 32-bit integers. Used to Windbg test

Include ..\Irvine32.inc

.data 

val1 	DWORD  0
val2	DWORD  0
val3	DWORD  0 
val4	DWORD  0
val5 	DWORD  0 
val6 	DWORD  0 
val7 	DWORD  0 

byte1 	BYTE	'A'
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


.code
main PROC
  int 3 
  
	mov val1, 100
	mov val2, 100b
	mov val3, 64h
	mov val4, 01100100b
	
	mov val5, 100 + 100d + 64h + 01100100b
	
	mov val6, 'a'
	mov val7, "abcd"
	
	mov eax,5 ; move 5 to the eax register
	add eax,6 ; add 6 to the eax register
	
	exit
main ENDP
END main


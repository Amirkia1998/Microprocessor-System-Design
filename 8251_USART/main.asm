
CODE    SEGMENT PARA 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STK
STK    SEGMENT PARA STACK 'STACK'
        DW 20 DUP(?)
STK    ENDS

DATA    SEGMENT PARA 'DATA'
   DIGITS  DB 00H
   SIZE_NAME DW 5H
   MY_NAME	DB 'A',	'M', 'I', 'R','  '
DATA    ENDS


START:
        MOV AX, DATA
	MOV DS, AX

	MOV DX, 00302h	;configure mode register
	MOV AL, 01001101B
	OUT DX, AL

	MOV AL, 40H	;0100 0000
	OUT DX, AL	;that 1 activates the internal bit reset 
	
	MOV AL, 01001101B	;configure mode register
	OUT DX, AL
	
	MOV AL, 00010101B	;configure control register
	OUT DX, AL	;clear all error bits
	
	XOR CX,CX ;for safety
	
ENDLESS:
	MOV DX, 0302H
	
READ_DATA:
	IN AL, DX	;check Receive Ready
	AND AL, 02H	;masking
	JZ READ_DATA	;loop until RX Ready is 1
	
	MOV DX, 0300H	;8086 reads data from 8251
	IN AL, DX	
	SHR AL,1
	
	MOV CL,AL
	SUB CL,30H
	MOV AX, SIZE_NAME
	MUL CL
	MOV CL,AL
	XOR BX,BX

LOOP_STRING:
	MOV DX, 00302H	
	IN AL, DX	;check for transmit ready
	AND AL, 01H	;masking
	JZ LOOP_STRING	;loop until TX Ready is 1
	
	MOV DX, 0300H		
	MOV AL, MY_NAME[BX]	;keep current character in AL
	
	INC BX		
	CMP BX,SIZE_NAME	;if BX is not reached end of the String
	JNE WRITE_CHAR		;send charachter ch[bx] to 8251
	
	XOR BX,BX		;if BX is reached end of the String , reset BX
	
WRITE_CHAR:
	OUT DX, AL	;send character to 8251
	LOOP LOOP_STRING	
	
        JMP ENDLESS
CODE    ENDS
        END START
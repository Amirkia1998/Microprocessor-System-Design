;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Wed Nov 2 2023
; Processor: 8086
; Compiler:  MASM32
;
; Before INITIALing simulation set Internal Memory Size 
; in the 8086 model properties to 0x10000
;====================================================================

CODE    SEGMENT PARA 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STCK
	
STCK    SEGMENT PARA STACK 'STACK'
        DW 20 DUP(?)
STCK    ENDS


DATA    SEGMENT PARA 'DATA'
      PortA DW 300H		;0000 0000 0011 0000 0000
      PortB DW 302H		;0000 0000 0011 0000 0010 
      PortC DW 304H		;0000 0000 0011 0000 0100  
      PortM DW 306H		;0000 0000 0011 0000 0110  port mode
      ZeroDigit  DB	0C0H	;0 11000000
      DIGITS	DB	092H, 082H, 0F8H, 080H 	;5, 6, 7, 8 Digits for LED
DATA    ENDS


INITIAL:
	MOV AX, DATA
	MOV DS, AX
	
	MOV DX,PortM	;Select Mode
	MOV  AL,99H	;1001 1001 is Control Word
	OUT DX,AL
	
	MOV DX,PortB	;LED is deactivated at the begining
	MOV AL,0FFH	;1111 1111
	OUT DX, AL

	XOR BX,BX	;for safety
	XOR CX,CX	;for safety
	
INPUT:	
	MOV DX, PortA                        
	IN AL,DX	; get input 

	TEST AL,1H	;if input comes from Button1 (Counter Button)
	JNE BUTTON1
	
	TEST AL,10H	;if input comes from Button2 (Reset Button)
	JNE BUTTON2
	
	TEST AL,0H	;if no input (all pins zero)
	JNE INPUT
	
	XOR CX,CX	; CX is used as a flag
	JMP INPUT	; if button is pressed continuously , do nothing	
	
BUTTON1:
	 CMP CX, 1H	;if button is pressed for 1 time , get input again
	 JE INPUT

	 MOV AL, DIGITS[BX]	; BX == index for DIGITS[]
	 INC BX
	 MOV DX, PortB
	 OUT DX, AL		;send digits to LED
	 MOV CX,1H		;set flag

	 CMP BX,4H		;if BX is not 4 yet, get another input 
	 JNE INPUT
	 
	 MOV BX,0H		;if BX is 4 , assign 0 to it (as we have DIGITS[0]...DIGITS[3])
	 JMP INPUT		; and get another input
	 
BUTTON2:
	 MOV AL, ZeroDigit	
	 MOV DX, PortB
	 OUT DX, AL		;send 0 to LED
	
	 XOR BX,BX		; reset BX
	 JMP INPUT		; get input

CLEAR:	
	MOV AL,80H;
	OUT 0A9H,AL;
	JMP INPUT
	
	RETF
CODE    ENDS
        END INITIAL
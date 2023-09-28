
CODE    SEGMENT PARA 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STCK
	
STCK    SEGMENT PARA STACK 'STACK'
        DW 20D DUP(?)
STCK    ENDS


DATA    SEGMENT PARA 'DATA'

      MOD_CONTROL	EQU 0AFH
      MOD1		EQU 0A9H
      NOTES		DW 442H,442H,442H,55EH,395H,442H,55EH,395H,442H,2D8H,2D8H,2D8H,2AFH,395H,483H,55EH,395H,442H,221H,442H,442H,221H,241H,264H,289H,2D8H,2AFH,0H,405H,303H,331H,362H,395H,3CCH,395H,0,55EH,483H,55EH,442H
      DELAYS		DW 4H,4H,4H,3H,1H,4H,3H,1H,8H,4H,4H,4H,3H,1H,4H,3H,1H,8H,4H,3H,1H,4H,3H,1H,1H,1H,2H,2H,2H,4H,3H,1H,1H,1H,2H,2H,2H,4H,3H,1H
      N			EQU 80D

DATA    ENDS


INIT:
        MOV AX, DATA
	MOV DS, AX
	
	MOV AL, 00110110B 	;control word
	OUT MOD_CONTROL, AL
	
INFINITE:
	XOR CX,CX
	XOR BX,BX
	
LOOP1:
	MOV AX, NOTES[BX]	; assign AX the MSB and LSB	
	OUT MOD1, AL		;send current note (LSB)
	
	MOV AL,AH	
	OUT MOD1, AL		;send next note (MSB)
	
	MOV CX, DELAYS[BX]	;keep delay value for current note in CX
	
LOOP2:
	CALL DELAY
	LOOP LOOP2
	
	INC BX
	INC BX		; we used double increment because arrays are WORDS not BYTES
	
	CMP BX, N
	JNE LOOP1

	
;################################################################################
DELAY PROC NEAR
	PUSH CX		;maintain CX value for other loops in stack
	MOV CX, 2FFFH
LOOP3: 
	LOOP LOOP3
	POP CX
	
	RET
DELAY ENDP
;################################################################################	
	
CODE    ENDS
        END INIT
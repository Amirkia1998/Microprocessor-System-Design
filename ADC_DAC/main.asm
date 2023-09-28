STCK    SEGMENT PARA STACK 'STACK'
        DW 20 DUP(?)
STCK    ENDS

DATA    SEGMENT PARA 'DATA'
	    ;NULL
DATA    ENDS

;================================================================
CODE    SEGMENT PARA 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STCK
START PROC
   MOV AX, DATA
   MOV DS, AX
   
   JMP Q_C	;first turn ont the light
   
   XOR BX,BX	;for safety
   XOR CX, CX	;for safety
   
MAIN:  
    
   Q_A: 
      MOV DX, 62H ;01100010B Digital-to-Analog
      MOV AL, 00H
   
   INCREASE:	
      OUT DX, AL
      CALL DELAY
      INC AL
      CMP AL, 11111111B  ; check if 255D is received
      JE DECREASE
      JMP INCREASE

   DECREASE : 
      OUT DX, AL
      CALL DELAY
      DEC AL 
      CMP AL,00H ; check if 0 is received
      JE INCREASE
      JMP DECREASE
     
   JMP Q_A	;jump to question a answer (wave)

Q_C: 

   ;write null to ADC to start 
   MOV DX, 6AH    ;01101010B ADC
   MOV AL, 00H
   OUT DX, AL

   ;Read INTR, if 0, it is done
   MOV DX, 68H ;01101000B TRI-state buffer  
   
CONTROL_INTR:
   IN AL, DX
   TEST AL, 80H
   JNZ CONTROL_INTR

   ;ADC hardware is done
   ;Then the converted number is read
   MOV DX, 6AH   ;01101010B ADC  adress where environment light is read
   IN AL, DX 

   MOV BL, 255
   SUB BL, AL
   MOV AL, BL
   
   MOV DX, 62H	;01100010B adress of torch
   OUT DX, AL
   
   CALL DELAY	;delay for a couple of milliseconds
   JMP Q_C	;jump to questoin C answer (light)
   
   JMP MAIN
   RET
START ENDP
;===========================================================

;=============================================================
DELAY PROC NEAR
   PUSH CX
   MOV CX, 0002H
   
   L1:LOOP L1
      POP CX
      RET
DELAY ENDP
;===========================================================
	
CODE    ENDS
        END START
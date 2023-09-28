STKSG	segment para stack 'stack'
	DW 20 dup(?)
STKSG	ends

DTSG	segment para 'data'
DTSG	ends

CDSG	segment para 'code'
	assume CS:CDSG, DS:DTSG, ss:STKSG

INIT:
	MOV AX, DTSG  ;move data segment to ax
	MOV DS, AX    ;data segment now in DS
	
	;for code safety reset every register
	XOR AX, AX
	XOR BX, BX
	XOR CX, CX
	XOR DX, DX
	XOR SI, SI
	XOR DI, DI

MAIN:
	PUSH CS
	MOV AX, L1
	PUSH AX
	
	DB 0EAh, 00h, 00h, 00h, 20h
	
	
L1:	PUSH CS
	MOV AX, L2
	PUSH AX
	
	DB 0EAh, 02h, 00h, 00h, 28h
	
	
L2:	JMP MAIN


CDSG ends
end INIT

;PROBLEMA #6
;Escriba un programa que utilice la fórmula de Euler para cálculo de poliedro, 
;debe encontrar el valor de por lo menos 3 diferentes (1 de ellos no debe ser convexo)

;--> Poliedros Convexo: 
;Angulos convexos (<180)
;todas las caras se pueden apoyar sobre un plano relacion o formula de euler ---> 
;C + V = A +2
;caras + vertices = aristas +2

;--> POLIEDROS CONCAVOS
;Algun angulo concavo (>180)
;--------------------------------------------------------------------------------------------------------------------
	AREA 	codigo, CODE, READONLY,ALIGN=2
	THUMB
	EXPORT Start

Start 				;ACA SE ENCUENTRAN LAS SUBRUTINAS QUE SE VAN LLAMANDO PARA CALCULAR LOS DISTINTOS VALORES
	BL ID			;Subrutina que se utiliza para que el usuario ingrese los datos
	;BL PCONVEXO		;Subrutina que calcula SI EL POLIEDRO ES CONVEXO CON LA FORMULA DE EULER
	BL PCONVEXO2
	;BL PCONCAVO		;Subrutina que calcula SI EL POLIEDRO ES CONCAVO Y CUMPLE CON EULER 
	
ID					;ACA SE INGRESAN LOS VALORES PARA LOS CALCULOS:
	; valores encontrados; 6,8,12<CUBO> || 8,12,18<PRISMA EXAGONAL> || 7,10,15<NO CONVEXO> 
	LDR		R0, =6  ;C [CARAS] 		Cargar valor a registro
	LDR		R1, =8	;V [VERTICES]	Cargar valor a Registro
	LDR		R2, =12	;A [ARISTAS]	Cargar valor a Registro
	LDR		R3, =2	;2 				Cargar valor a Registro
	BX		LR

PCONVEXO 			; <180° 	C + V - A = 2 C[CARA], V[VERTICE], A[ARISTA]
	ADD R12, R0, R1	; C+V
	SUB R11, R12,R2	; (C+V)-A
	CMP R11, R3		; COMPARA SI EL RESULTADO ES IGUAL A '2'
	BEQ SIC
	B NOC
	
SIC
	;LDR R11,=1
	LDR R8,=1
	B STOP

NOC 
	;LDR R11,=0
	LDR R8,=0
	B STOP
;//-------------------------------------------------------------------------------------------------
PCONVEXO2 			; <180° 	C+V=A+2 C[CARA], V[VERTICE], A[ARISTA]
	ADD R6, R0, R1	; C+V
	ADD R7, R2, R3 ; A+2
	CMP R6, R7		; COMPARA SI EL RESULTADO ES IGUAL A '2'
	BEQ SIC
	B NOC
;---------------------------------------------------------------------------------------------------
PCONCAVO 			; >180°
;---------------------------------------------------------------------------------------------------
STOP B STOP

	ALIGN
	END  
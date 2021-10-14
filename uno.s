/*;PROBLEMA #1
;Determine el área de triángulo, rectángulo, círculo y rombo, según lo escoja el usuario. 
;Debe de preguntar el área de qué se desea, y luego ingresar los valores para calcular dicha área

	AREA 	codigo, CODE, READONLY,ALIGN=2
	THUMB
	EXPORT Start

Start 				;ACA SE ENCUENTRAN LAS SUBRUTINAS QUE SE VAN LLAMANDO PARA CALCULAR LOS DISTINTOS VALORES
	; VALORES INICIALES DE PI
	VMOV.F32 S1, #-1	; VALOR QUE MULTIPLICARA -1 LA CANTIDAD DE VECES NECESARIAS	
	VMOV.F32 S2, #-1	; VALOR DE -1 AFECTADO POR LA POTENCIA
	VMOV.F32 S3, #2		; EL 2 DEL DIVISOR
	VMOV.F32 S4, #1		; PARTE DE LA POTENCIA QUE SUMA 1
	VMOV.F32 S9, #4		; VALOR FINAL POR EL QUE SE MULTIPLICA LA SUMATORIA
	MOV R1,#0			; CONTADOR DEL NUMERO DE ITERACIONES
	B PI 
	
;--- PI -------------------------------------------------------------	
; PI = 4[S(-1)^(k+1)/(2k-1)] S:k=1->infinito
PI 
	VMUL.F32 S2,S1		; MULTIPLICA (-1)(-1) N CANTIDAD DE VECES
	B RESTA				
	
RESTA 
	VADD.F32 S5,S4		; REALIZA LA OPERACION S5=S5*S4
	VMUL.F32 S6,S3,S5	; MULTIPLICA S3*S5=S6
	VADD.F32 S6,S1		; SUMA EL VALOR S1+S6 ASIGNANDOLO NUEVAMENTE EN S6
	B DIVISION

DIVISION 
	VDIV.F32 S7, S2, S6
	VADD.F32 S8, S7
	B SERIEPI
	
SERIEPI
	ADD R1, #1
	CMP R1, #800 ;iteraciones 
	BEQ MULTIPLICACION
	B PI

MULTIPLICACION
	VMOV.F32 S9, #4
	VMUL.F32 S18, S8,S9		; PI=S18
	B AREAS 
;--------------------------------------------------------------------
AREAS
	BL ID			;Subrutina que se utiliza para que el usuario ingrese los datos
	CMP R0,#1
	BEQ TRIANGULO	;Subrutina que calcula el area del triangulo
	CMP R0,#2
	BEQ RECTANGULO	;Subrutina que calcula el area del rectangulo
	CMP R0,#3
	BEQ CIRCULO		;Subrutina que calcula el area del circulo
	CMP R0,#4
	BEQ ROMBO		;Subrutina que calcula el area del rombo
	;CMP R0,#5 	; si no.                 
    BNE NADA
	;B STOP 

ID						;SUBRUTINA DONDE SE INGRESAN LOS VALORES PARA LOS CALCULOS	
	VMOV.F32 S0, #0.5	;1/2	Cargar valor a Registro
	;--- MENU E INGRESO DE DATOS -------------------------------------------------
	LDR R0, = 2			; MENU: 1.TRIANGULO, 2.RECTANGULO, 3.CIRCULO, 4.ROMBO 
	VMOV.F32 S1, #12	;B  [BASE]		
	VMOV.F32 S2, #5		;H	[ALTURA]	
	VMOV.F32 S3, #1 	;R	[RADIO]	
	VMOV.F32 S4, #1		;DA	[DIAGONAL A]	
	VMOV.F32 S5, #1		;DB	[DIAGONAL B]	
	BX LR

TRIANGULO				; A= 1/2*B*H   B[BASE], H[ALTURA]
	VMUL.F32 S19,S0,S1	;1/2*B
	VMUL.F32 S19,S2		;(1/2*B)*(H) 	At= S19 
	B STOP

RECTANGULO				; A= B*H	   B[BASE], H[ALTURA]	
	VMUL.F32 S20,S1,S2	;				Ar=S20
	B STOP

CIRCULO					; A= PI*R^2    R[RADIO]
	VMUL.F32 S6,S3,S3	; r*r
	VMUL.F32 S21,S18,S6 ; PI*R^2	  	Ac=S21
	B STOP
	
ROMBO					; A= 1/2*DA*DB DA[DIAGONAL A], DB[DIAGONAL B]
	VMUL.F32 S6,S0,S4	; 1/2*DA 
	VMUL.F32 S22,S5,S6	; DB*(1/2*DA)	Aro=S22
	B STOP
	
NADA 
	VLDR.F32 S19,=0
	VLDR.F32 S20,=0
	VLDR.F32 S21,=0
	VLDR.F32 S22,=0
	B STOP
	
STOP B STOP

	ALIGN
	END */
		
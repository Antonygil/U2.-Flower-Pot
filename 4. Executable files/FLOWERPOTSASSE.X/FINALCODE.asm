;����������������������������������� SELFWATERING POT SYSTEM PROGRAM ������������������������������������
;�������������������������������	 GREE TECH & HOME    �������������������������������
;����������������������������	 UNIVERSIDAD POLITECNICA DE YUCATAN �������������������������������
;������������������������� EMBEDDED 3A ANGEL ESCALANTE,ANTONIO GIL,JULIO ALPUCHE, CARLOS RANGEL ��������������������������������

;������������������DEFINICI�N DEL PIC CON EL CUAL SE TRABAJAR� Y A�ADIR LA OPCION DE HEXADECIMAL������������������		
		LIST P=16F877A
		RADIX	HEX
;����������������������������� DEFINICION DE REGISTROS UTILIZADOS ��������������������������
PCL		    EQU	    02h		    ;PUERTO CONVERSOR ANALOGICO
STATUS		    EQU	    03h		    ;BIT DE ESTADO
PA		    EQU	    05h		    ;PUERTO A
PB		    EQU	    06h		    ;PUERTO B
PC		    EQU	    07h		    ;PUERTO C
PD		    EQU	    08h		    ;PUERTO D
PE		    EQU	    09h		    ;PUERTO E
PCLATH		    EQU	    0Ah		    ;CONTADOR DEL PROGRAMA 
INTCON		    EQU	    0Bh		    ;INTERRUPCION DEL PROGRAMA
PIR1		    EQU	    0Ch		    ;INTERRUPCION DEL PROGRAMA
RCSTA		    EQU	    18h		    ;SISTEMA DE CANCELACION DE BITS
TXREG		    EQU	    19h		    ;BITS DE COMUNICACION SERIAL
RCREG		    EQU	    1ah		    ;SALIDA DE PIN SCFR
ADRESH		    EQU	    1Eh		    ;BITS MAS SIGNIFICATIVOS CONVERSION ADC
ADCON0		    EQU	    1Fh		    ;CONTADORES ANALOGICOS.
TRISA		    EQU	    85h		    ;PA BANCO 1
TRISB		    EQU	    86h		    ;PB BANCO 1
TRISC		    EQU	    87h		    ;PC BANCO 1
TRISD		    EQU	    88h		    ;PD BANCO 1
TRISE		    EQU	    89h		    ;PE BANCO 1
TXSTA		    EQU	    98h		    ;BITS DE COMUNICACION SERIAL
SPBRG		    EQU	    99h		    ;BITS DE COMUNICACION SERIAL
ADRESL		    EQU	    9Eh		    ;CONTADOR ANALOGICO
ADCON1		    EQU	    9Fh		    ;BITS MENOS SIGNIFICATIVOS CONVERSION ADC
		    
;������������������������������� DEFINICION DE BITS UTILIZADOS�������������������������������
Z		    EQU	    2		    ;BIT 2
C		    EQU	    0		    ;BIT 0
		    
;�������������������������������� VARIABLES DE USUARIO ������������������������������������
LOOPS		    EQU	    30h
LOOPS2		    EQU	    31h
TEST		    EQU	    32h
		    
;�����������������������������  CONFIGURACION DEL SISTEMA ����������������������������������������������������
		    ORG     0x00	    ;DIRECCION DE INICIO 00                      
		    GOTO    INICIO	    ;INICIO DEL PROGRAMA                          
		    ORG	    0x05	    ;DIRECCION DEL RESET
		    
;����������������������������� FUNCION DE RETARDO (DELAY) ������������������������������������������������������
RETARDO		    MOVLW   0xFF	    ;RETARDO DE MILISEGUNDOS
		    MOVWF   LOOPS	    ;MOVER W A REGISTRO
		    MOVlW   0xFF	    ;CARGAR W CON UN NUMERO
		    MOVWF   LOOPS2
DEMORA		    DECFSZ  LOOPS,0	    ;DECREMENTA EN 1 SE SALTA INTRUCCION SI ES 0
		    GOTO    DEMORA	    ;IR A
		    DECFSZ  LOOPS2,0
		    GOTO    DEMORA
		    RETURN
;���������������������������� convertir A/D ��������������������������������������������������
CONVER		    NOP                     ;NADA SOLO RETARDA 20 MICROSEGUNDOS
		    NOP				
		    CLRF    36h             ;LIMPIAR POSICION 36 
		    CALL    RETARDO         ;LLAMAR A FUNCION
		    BSF	    ADCON0,2 	    ;EMPEZAR A CONVERTIR AD       
		    NOP                                                   
		    NOP                                                  
CHECK		    BTFSC   ADCON0,2	    ;TESTEAR SI UA CONVIRTI�
		    GOTO    CHECK           ;IR A CHECK
		    MOVF    ADRESH,w        ;PASA ADRESH A W	
		    MOVWF   36h             ;PASAR W A 36
		    BCF	    ADCON0,0	    ;BIT 0, CLEAR, REGISTRO ADCON
		    CALL    BOMBA           ;LLAMAR RUTINA DE MOTOR 
		    RETURN	            ;RETORNA A DONDE LLAMARON
		    
;������������������������������������� encender motor ��������������������������������������������
BOMBA		    NOP                     
		    NOP
		    NOP
		    NOP
		    MOVLW   d'37'           ;CARGA W CON 37 (GRADOS)
		    SUBWF   36h,w        ;COMPARA CON LO CONVERTIDO GUARDA EN W
		    MOVWF   TEST	    ;MUEVE W A REGISTRO PARA TESTEO
		    BTFSS   TEST,C          ;PREGUNTA SI ESTA EN 0
		    BSF     PD,0            ;ENCIENDE SALIDA RD0
		    BCF     PC,0	    ;APAGA SALIDA RC0
		    NOP
		    NOP
		    RETURN                  ;RETURNA
                                                

;����������������������������������� CONFIGURACION DE PUERTOS PARA ENTRADAS Y/O SALIDAS DEL PIC �����������������������������������������
				;1 = INPUT    0 = OUTPUT CADA UNO REPRESENTA UNA PATITA DE CADA PUERTO
INICIO		    NOP                    
		    CLRF    STATUS          
		    BCF	    STATUS,6                               
		    BSF	    STATUS,5		               
		    MOVLW   b'11111111'                            
		    MOVWF   TRISA                                  
		    MOVLW   b'00000000'                            
		    MOVWF   TRISB                                 
		    MOVLW   b'11111111'                            
		    MOVWF   TRISC                                 
		    MOVLW   b'11111111'                            
		    MOVWF   TRISD                                  
		    MOVLW   b'11101111'                                                 
		    MOVWF   TRISE                                  
		    MOVLW   b'11000111'	                       
		    MOVWF   ADCON1	                               
		    BCF	    STATUS,5                               		
;������������������������������������� inicio del programa ���������������������������������������������       
		    CLRF    PB               ;LIMPIAR PUERTO B
		    MOVLW   d'0'             ;CARGAR W CON 0
		    MOVWF   PB               ;PASAR W A PUERTO B                       
CICLO		    CLRF    PC               ;LIMPIAR PUERTO 0
		    MOVLW   b'10000001'      ;CARGAR W CON CONFIGURACION DE ACTIVAR CONVERSION 
		    MOVWF   ADCON0	     ;CARGAR CONFIGURACION EN ADCON 
		    CALL    CONVER	     ;LLAMAR RUTINA DE CONVERSION
		    GOTO    CICLO            ;IR A CICLO (BUCLE)         
	       END                           ;FIN DEL PROGRAMA



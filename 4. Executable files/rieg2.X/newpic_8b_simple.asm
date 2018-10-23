;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ SENSOR DE temperatura ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ MASISOS TEAM ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬  embedded ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ Universidad politecnica de yucatana ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ DEFINICION DE REGISTROS UTILIZADOS ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
pcl	equ	02h
status	equ	03
ptoa	equ	05
ptob	equ	06
ptoc	equ	07
ptod	equ	08
ptoe	equ	09
pclath	equ	0ah
intcon	equ	0bh
pir1	equ	0ch
rcsta	equ	18h
txreg	equ	19h
rcreg	equ	1ah
adresh	equ	1eh
adcon0	equ	1fh
trisa	equ	85h
trisb	equ	86h
trisc	equ	87h
trisd	equ	88h
trise	equ	89h
txsta	equ	98h
spbrg	equ	99h
adresl	equ	9eh
adcon1	equ	9fh
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ Definicion de bits utilizados ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
rp0	equ	5
rp1	equ	6
irp	equ	7
z	equ	2
c	equ	0
txif	equ	4
go	equ	2
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ Variables del usuario  ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
loops	equ	30h
loops2	equ	31h
loops3	equ	36h
dig0	equ	32h
dig1	equ	33h
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ Configuracion para el simulador Proteus ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
list p=16f877
_CP_ALL                      	EQU     H'0FCF'
_CP_HALF                     	EQU     H'1FDF'
_CP_UPPER_256                	EQU     H'2FEF'
_CP_OFF                      	EQU     H'3FFF'
_DEBUG_ON                	EQU     H'37FF'
_DEBUG_OFF                   	EQU     H'3FFF'
_WRT_ENABLE_ON               	EQU     H'3FFF'
_WRT_ENABLE_OFF              	EQU     H'3DFF'
_CPD_ON                      	EQU     H'3EFF'
_CPD_OFF                     	EQU     H'3FFF'
_LVP_ON                      	EQU     H'3FFF' 
_LVP_OFF                     	EQU     H'3F7F'	
_BODEN_ON                    	EQU     H'3FFF'
_BODEN_OFF                   	EQU     H'3FBF'
_PWRTE_OFF                   	EQU     H'3FFF'
_PWRTE_ON                    	EQU     H'3FF7'
_WDT_ON                      	EQU     H'3FFF'
_WDT_OFF                     	EQU     H'3FFB'
_LP_OSC                      	EQU     H'3FFC'
_XT_OSC                      	EQU     H'3FFD'
_HS_OSC                      	EQU     H'3FFE'
_RC_OSC                      	EQU     H'3FFF'

__CONFIG _CP_OFF & _WDT_OFF & _XT_OSC & _PWRTE_ON 
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬  posicion ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
          org           00                                     ;inicia desde la posicion 00
          goto          inicio                                 ;ir a inicio
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ retardo ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
retarms   nop                                                  ;nada
          movwf		loops		                       ;retardo de milisegundos cargado desde afuera
otro2     movlw		d'110'                                 ;carga a w con 110
	  movwf		loops2                                 ;mueva w a posicion loops2
otro	  nop                                                  ;nada
	  nop                                                  ;nada
	  nop                                                  ;nada
	  nop                                                  ;nada
	  nop                                                  ;nada
	  nop                                                  ;nada
	  decfsz	loops2,1                               ;decrementa  loops2 y guarda en f
	  goto		otro                                   ;ir a otro
	  decfsz	loops,1                                ;decrementa  loops y guarda en f
	  goto		otro2	                               ;ir a otro2
return                                                         ;retorna
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ convertir A/D ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
conver	  nop                                                  ;nada
          clrf          36h                                    ;limpiar posicion 36  
          movlw         d'5'                                   ;carge a w 5
	  call	        retarms                                ;llamar retardo
          bsf	        adcon0,2 	                       ;empezar a convertir A/D        
	  nop                                                  ;nada 
	  nop                                                  ;nada
pereira   nop                                                  ;nada
          btfsc	        adcon0,go	                       ;pregunta si ya convirtio
          goto	        pereira                                ;ir a pereira
	  movf	        adresh,0                 	       ;pasa adresh a w		
          movwf         36h                                    ;pasar w a 36h
          call          motor                                  ;llamar a rurina motor 
return	                                                       ;retorna
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ encender motor ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
motor     nop                                                  ;nada
          movlw         d'30'                                  ;carga w con 31
          subwf          36h,w                                 ;compara 31 con lo convertido
          btfss         status,c                               ;pregunta si esta en 0
          bsf           ptod,0                                 ;encienda el motor
          movlw         d'31'                                  ;carga w con 31
          subwf          36h,w 
          btfsc         status,c  
          bcf           ptod,0
return                                                         ;retorna
                                                  ;retorna
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ configuracion de puertos ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
inicio   nop                                                   ;nada
         clrf	        status                                 ;limpia status
         bcf		status,6                               ;pone en 0  status,6
         bsf		status,5		               ;pone en 1  status,5  banco1
	 movlw		b'11111111'                            ;carga a w con configuracion puerto a
	 movwf		trisa                                  ;mueva w a trisa
	 movlw		b'00000000'                            ;carga a w con configuracion puerto b
	 movwf		trisb                                  ;mueva w a trisb
	 movlw		b'11111100'                            ;carga a w con configuracion puerto c
	 movwf		trisc                                  ;mueva w a trisc
	 movlw		b'11111000'                            ;carga a w con configuracion puerto d
	 movwf		trisd                                  ;mueva w a trisd
	 movlw		b'11101111'                            ;carga a w con configuracion puerto e                       
	 movwf		trise                                  ;mueva w a trise
	 movlw		b'00001101'	                       ;escoger tension externa  
         movwf		adcon1	                               ;mueva w a adcon1
	 bcf		status,5                               ;pone en 0 status,5  banko0			
;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ inicio del programa ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬       
         clrf           ptob                                   ;limpiar puerto B
         movlw          d'0'                                   ;cargar w con 0
         movwf          ptob                                   ;pasar w a puerto B                           
ciclo2   clrf           ptoc                                   ;limpiar puerto C
         movlw	        b'10000001'                            ;carga w con configuracion activar convercion 
         movwf	        adcon0		                       ;escoger reloj  Fosc / 32
	 call 	        conver	                               ;llamar a conver
         goto           ciclo2                                 ;ir a ciclo2          
end                                                            ;fin

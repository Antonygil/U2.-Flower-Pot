#include <16F887.h>
#device ADC=10       //Resoluci�n de 10 bits para ADC
#fuses INTRC_IO,NOCPD,NOWDT,NOPUT,NOLVP,NOBROWNOUT,MCLR
#use delay(clock=2M)
#define use_portd_lcd TRUE
#use rs232(baud=9600,xmit=PIN_C6,rcv=PIN_C7) // Pines para establecer comunicaci�n RS232
#include <lcd.c>

#use fast_IO(A)   // Configuraci�n r�pida del puerto A
#use fast_IO(B)   // Configuraci�n r�pida del puerto B
#use fast_IO(C) // Configuraci�n r�pida del puerto C

long temp;     //Variable de tipo long temp
long conversion; //Variable de tipo long conversi�n
long conversion1;  //Variable de tipo long conversi�n1
float temo; // //Variable de tipo flotante temo

unsigned int16 resultado; //Variable de 16 bits sin signo resultado

float sensor(int8 primero , int8 segundo) //funci�n que controla al sensor de temperatura parametros primero y segunto tipo entero de 8 bits
{
while(true) //Cliclo siempre activo
{
set_adc_channel(primero);            //Seleccionando canal a primero
delay_us(10);                    // tiempo de espera de 10 us segundos
conversion=read_adc();           //conversi�n lee el canal anal�gico
set_adc_channel(segundo);     // definiendo el canal que se va a leer
delay_us(10); // tiempo de espera de 10 us segundos

#include <16F887.h>
#device ADC=10       //Resolución de 10 bits para ADC
#fuses INTRC_IO,NOCPD,NOWDT,NOPUT,NOLVP,NOBROWNOUT,MCLR
#use delay(clock=2M)
#define use_portd_lcd TRUE
#use rs232(baud=9600,xmit=PIN_C6,rcv=PIN_C7) // Pines para establecer comunicación RS232
#include <lcd.c>

#use fast_IO(A)   // Configuración rápida del puerto A
#use fast_IO(B)   // Configuración rápida del puerto B
#use fast_IO(C) // Configuración rápida del puerto C

long temp;     //Variable de tipo long temp
long conversion; //Variable de tipo long conversión
long conversion1;  //Variable de tipo long conversión1
float temo; // //Variable de tipo flotante temo

unsigned int16 resultado; //Variable de 16 bits sin signo resultado

float sensor(int8 primero , int8 segundo) //función que controla al sensor de temperatura parametros primero y segunto tipo entero de 8 bits
{
while(true) //Cliclo siempre activo
{
set_adc_channel(primero);            //Seleccionando canal a primero
delay_us(10);                    // tiempo de espera de 10 us segundos
conversion=read_adc();           //conversión lee el canal analógico
set_adc_channel(segundo);     // definiendo el canal que se va a leer
delay_us(10); // tiempo de espera de 10 us segundos

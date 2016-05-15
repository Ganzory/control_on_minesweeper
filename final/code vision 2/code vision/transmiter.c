#include <io.h>
#include <mega32.h>
#include <delay.h>
#include <stdio.h>
unsigned char ch;
unsigned int ch_3;
//flash unsigned char segment[]={0b0111111,0b0000110,0b1011011,0b1001111,0b1110110,0b1101101,0b1111101,0b0000111,0b1111111,0b1101111};
unsigned int speed(void){
switch(ch)
{
case 'j':
  {
  if((OCR0<=238)){
  OCR0=OCR0+17;
  return OCR0; 
  }
  else return OCR0;
  }
 case 'i': 
 {
 if(OCR0>=17)
 {
    OCR0=OCR0-17;
  return OCR0; 
  }
  else return OCR0;
 }
 } } 

/*----------------------------*/ 
void recive_data(void)

{
while(!(UCSRA&(1<<RXC)));
ch=UDR;
ch_3=0;
switch(ch)
{
case 'z':OCR0=0;OCR2=0;break; //no_action
case 'j':OCR0=OCR2=speed();break;  //increase_speed_1
case 'i':OCR0=OCR2=speed();break;  //decrase_speed_1

//motors_direction:
//hint pin 0.1 for w motors pin 2.3 for l motors
case 'e': {PORTA.0=PORTA.1=1;PORTA.2=PORTA.3=0;OCR0=OCR2=170;break;}   //moving anti clockwise
case 'f': {PORTA.0=PORTA.1=0;PORTA.2=PORTA.3=1;OCR0=OCR2=170;break; }  //moving clockwise
case 'g': {PORTA.0=PORTA.1=PORTA.2=PORTA.3=1;break;}   //moving forward
case 'h': {PORTA.0=PORTA.1=PORTA.2=PORTA.3=0;break;}   //moving reverse

}
}
/*----------------------------*/
void metal_detector(void)
{
  if(PINA.4==1) PORTC.7=1; 
  else PORTC.7=0;
}
/*------------------------------------*/

void transmit_data(unsigned char ch_2)
{
 while(!(UCSRA&(1<<UDRE)));
 UDR=ch_2;
 
}
/*--------------------------------------*/

interrupt[EXT_INT0] void encoder_pulses(void)
{
if(ch_3==1);
else{
 switch(ch)
{
case 'g':{transmit_data('A');ch_3=1;break;}
case 'h':{transmit_data('B');ch_3=1;break;}
}
}
}
/*------------------------------*/



 void main (void)
{
UCSRB=(1<<RXEN)|(1<<TXEN);   //enable reciver and transmitter
UCSRC=(1<<URSEL)|(1<<UCSZ0)|(1<<UCSZ1);   //8bit data
UBRRL=0X47;   //initialize bauderate=9600 
DDRB=0XFF;   //initialize ports
DDRD=0X82;
DDRA=0X0F;
DDRC=0XFF;
PORTC=0X00;
TCCR0=0x6D;   //initialize pulse width nrmal mode counter0
TCCR2=0X6F;    //initialize pulse width nrmal mode counter1
GICR=(1<<INT0); //enable int0 
MCUCR=(1<<ISC00)|(1<<ISC01); //initialize mode of operation for int 0
GIFR=(1<<INTF0);       //clear the interrupt flag

#asm("sei");          //set global intterupt
while (1)
    { 
      //transmit_data('Z');
       recive_data();
       metal_detector();
    }
    }

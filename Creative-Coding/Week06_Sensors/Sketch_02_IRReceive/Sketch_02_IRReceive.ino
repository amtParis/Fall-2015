/*
 * IRremote: IRrecvDemo - demonstrates receiving IR codes with IRrecv
 * An IR detector/demodulator must be connected to the input RECV_PIN.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#define RC_CHMINUS 16753245
#define RC_CH 16736925
#define RC_CHPLUS 16769565
#define RC_AGAIN -1
#define RC_PREV 16720605
#define RC_NEXT 16712445
#define RC_PLAYPAUSE 16761405
#define RC_VOLMINUS 16769055
#define RC_VOLPLUS 16754775
#define RC_EQ 16748655
#define RC_0 16738455
#define RC_100 16750695
#define RC_200 16756815
#define RC_1 16724175
#define RC_2 16718055
#define RC_3 16743045
#define RC_4 16716015
#define RC_5 16726215
#define RC_6 16734885
#define RC_7 16728765
#define RC_8 16730805
#define RC_9 16732845


#include <IRremote.h>

int RECV_PIN = 11;

IRrecv irrecv(RECV_PIN);

decode_results results;

void setup()
{
  Serial.begin(57600);
  irrecv.enableIRIn(); // Start the receiver
}

void loop() {
  if (irrecv.decode(&results)) {
    doSomething(results.value);
    irrecv.resume(); // Receive the next value
  }
}

void doSomething(long v) {
    //Serial.println(v);  
    
    switch(v) {
     case RC_CHMINUS :
       Serial.println("CH -");
       break;
     case RC_CH :
       Serial.println("CH");
       break;
     case RC_CHPLUS :
       Serial.println("CH +");
       break;


     case RC_PREV :
       Serial.println("PREV");
       break;
     case RC_NEXT :
       Serial.println("NEXT");
       break;
     case RC_PLAYPAUSE :
       Serial.println("PLAY PAUSE");
       break;


     case RC_VOLMINUS :
       Serial.println("VOL -");
       break;

     case RC_VOLPLUS :
       Serial.println("VOL +");
       break;

     case RC_EQ :
       Serial.println("EQ");
       break;


     case RC_0 :
       Serial.println("0");
       break;

     case RC_100 :
       Serial.println("100+");
       break;

     case RC_200 :
       Serial.println("200+");
       break;


     case RC_1 :
       Serial.println("1");
       break;

     case RC_2 :
       Serial.println("2");
       break;

     case RC_3 :
       Serial.println("3");
       break;
       
       
     case RC_4 :
       Serial.println("4");
       break;

     case RC_5 :
       Serial.println("5");
       break;

     case RC_6 :
       Serial.println("6");
       break;
       

     case RC_7 :
       Serial.println("7");
       break;

     case RC_8 :
       Serial.println("8");
       break;

     case RC_9 :
       Serial.println("9");
       break;
     
     //default : // RC_AGAIN -1
       //Serial.println("RC AGAIN");
    }
    
}

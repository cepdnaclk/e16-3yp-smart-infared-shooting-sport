/*
 * SimpleReceiver.cpp
 *
 * Demonstrates receiving NEC IR codes with IRrecv
 *
 *  Copyright (C) 2020-2021  Armin Joachimsmeyer
 *  armin.joachimsmeyer@gmail.com
 *
 *  This file is part of Arduino-IRremote https://github.com/Arduino-IRremote/Arduino-IRremote.
 *
 *  MIT License
 */

/*
 * Specify which protocol(s) should be used for decoding.
 * If no protocol is defined, all protocols are active.
 */
//#define DECODE_DENON        // Includes Sharp
//#define DECODE_JVC
//#define DECODE_KASEIKYO
//#define DECODE_PANASONIC    // the same as DECODE_KASEIKYO
//#define DECODE_LG
#define DECODE_NEC          // Includes Apple and Onkyo
//#define DECODE_SAMSUNG
//#define DECODE_SONY
//#define DECODE_RC5
//#define DECODE_RC6

//#define DECODE_BOSEWAVE
//#define DECODE_LEGO_PF
//#define DECODE_MAGIQUEST
//#define DECODE_WHYNTER

//#define DECODE_DISTANCE     // universal decoder for pulse width or pulse distance protocols
//#define DECODE_HASH         // special decoder for all protocols
#define LED_shot 5
#define BUTTON_shot 34

#define BUTTON_relo 21
#define LED_team1 13
#define LED_team0 12
#define LED_team2 14
#define buzzer_port 19
#define LED_active 25
//#define LED_team0 12
//#define LED_team2 14
#include <Arduino.h>

#define BUZZER_CHANNEL 0

/*
 * Define macros for input and output pin etc.
 */
#include <string>
#include <iostream>
#include "PinDefinitionsAndMore.h"
#include "BluetoothSerial.h"
#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run `make menuconfig` to and enable it
#endif
#include <IRremote.h>
BluetoothSerial SerialBT;

uint8_t sCommand = 213;  
uint8_t sMagsize = 10;
int sAmmo = 500;
bool cActive = false;
uint8_t cAmmo = 10;
uint8_t cTeam = 0;
uint8_t cDamage = 1;
uint8_t cTempid = 0;
int cHealth = 5;
int receivedMsg;
int shot_code;

void spaceGun(int maximum){
  for(int i = 0; i <maximum; i++){
  digitalWrite(buzzer_port,HIGH);
  delayMicroseconds(i);
  digitalWrite(buzzer_port,LOW);
  delayMicroseconds(i);
  } 
}


void reloGun(){
        tone(buzzer_port,100,100);
 
}

bool shotfire = false;


void IRAM_ATTR shot();
void IRAM_ATTR relo();


void setup() {
    SerialBT.begin("Xtaggun__5"); //Bluetooth device name
    Serial.println("The device started, now you can pair it with bluetooth!");
    //reload button
    pinMode(BUTTON_shot, INPUT_PULLDOWN);
    attachInterrupt(BUTTON_shot, shot, RISING);

    pinMode(BUTTON_relo, INPUT_PULLDOWN);
    attachInterrupt(BUTTON_relo, relo, RISING);

     pinMode(LED_BUILTIN, OUTPUT);
     pinMode(LED_team0, OUTPUT);
     pinMode(LED_team1, OUTPUT);
     pinMode(LED_team2, OUTPUT);
     pinMode(LED_active, OUTPUT);
     pinMode(buzzer_port, OUTPUT);
    Serial.begin(9600);
    
     //Start the receiver, enable feedback LED and take LED feedback pin from the internal boards definition
    IrSender.begin(IR_SEND_PIN, ENABLE_LED_FEEDBACK); // Specify send pin and enable feedback LED
    IrReceiver.begin(IR_RECEIVE_PIN, ENABLE_LED_FEEDBACK, USE_DEFAULT_FEEDBACK_LED_PIN);

    Serial.print(F("Ready to receive IR signals at pin "));
    Serial.println(IR_RECEIVE_PIN);
    Serial.println(IR_SEND_PIN);
    
        //assign cores
        esp_err_tesp_intr_mark_shared(34, 1, 1);
        esp_err_tesp_intr_mark_shared(21, 1, 1);
    //others
    //when shotted
     pinMode(LED_shot, OUTPUT);
      //esp_err_t esp_intr_reserve(10,0);
  
}


void shot_ir(){
 if(cAmmo > 0 && cActive == true) {

  spaceGun(400);
  IrSender.sendNEC(0, sCommand, 0);
  cAmmo = cAmmo - 1;
   
  //detachInterrupt(BUTTON_shot);
  //delay(100);
  //attachInterrupt(BUTTON_shot, shot, RISING);

}
else {
    spaceGun(100);
    spaceGun(100);
    spaceGun(100);
   spaceGun(200);
   spaceGun(200);
   spaceGun(200);
   spaceGun(200);
        spaceGun(200);
   spaceGun(200);
}
}

void IRAM_ATTR shot() {
        shot_ir();
  
}



void IRAM_ATTR relo() {
if(cTeam == 0 ){ //when want to active
        digitalWrite(LED_team0, HIGH);
        digitalWrite(LED_team1, LOW);
        digitalWrite(LED_team2, LOW); 
        
}
if(cTeam == 1 ){ //when want to active
        digitalWrite(LED_team0, LOW);
        digitalWrite(LED_team1, HIGH);
        digitalWrite(LED_team2, LOW); 
        
}
if(cTeam == 2 ){ //when want to active
        digitalWrite(LED_team0, LOW);
        digitalWrite(LED_team1, LOW);
        digitalWrite(LED_team2, HIGH); 
        
}
if(cTeam == 3 ){ //when want to active
        digitalWrite(LED_team0, HIGH);
        digitalWrite(LED_team1, LOW);
        digitalWrite(LED_team2, LOW); 
        
}
if(cActive == false ){ //when want to active
        cActive = true;
        digitalWrite(LED_active, HIGH);
        digitalWrite(LED_shot, LOW);
                
        
}
else if(cActive == true ){ //when want to active
        cActive = false;
        digitalWrite(LED_active, LOW);
}


       // cActive = !cActive;
       
    if(sAmmo > sMagsize){
        cAmmo = sMagsize;
        sAmmo = sAmmo - sMagsize;
    }
    spaceGun(100);
    spaceGun(100);
    spaceGun(100);
        
     spaceGun(200);
   
     spaceGun(200);
        
}


void loop() {
    

  // IrSender.sendNEC(0, sCommand, 0);
   //delay(1000);
    Serial.flush();
    delay(30);  

//if(sActive == false) {
 if(SerialBT.available()){
    Serial.println("blutooth active");
        receivedMsg =  SerialBT.read();
        Serial.println(receivedMsg);
        
        if(receivedMsg == 97 ){ //when want to active
                cActive = true;
                cHealth = 5;
                Serial.printf("blutooth active status of the gun %d  \n" , cActive);
                sCommand =  cTempid + (cDamage%2)*16+ (cDamage/2)*32 + (cTeam%2)*64 + (cTeam/2)*128 ;
                Serial.printf("bluetooth set gun parameters %d  %d %d  %d \n", cTeam,cDamage,cTempid ,sCommand);
                digitalWrite(LED_active, HIGH);    // turn on the led 
                digitalWrite(LED_shot, LOW);
                
        }

         else if(receivedMsg == 100 ){ //when want to dactive
                cActive = false;
                Serial.printf("blutooth active status of the gun %d  \n" , cActive);
                 digitalWrite(LED_active, LOW);    // turn off the led 
                 //digitalWrite(LED_shot, HIGH);
                

        }
        //team *******************************************
       else if(receivedMsg == 65 ){ //when want to active
                cTeam = 0;
                Serial.printf("blutooth set team %d  \n" , cTeam);
                  digitalWrite(LED_team0, HIGH);
                  digitalWrite(LED_team1, LOW);
                  digitalWrite(LED_team2, LOW); 
                

        }
        else if(receivedMsg == 66 ){ //when want to active
                cTeam = 1;
                Serial.printf("blutooth set team %d  \n" , cTeam);
                  digitalWrite(LED_team0, LOW);
                  digitalWrite(LED_team1, HIGH);
                  digitalWrite(LED_team2, LOW); 
                
        }
        else if(receivedMsg == 67 ){ //when want to active
                cTeam = 2;
                Serial.printf("blutooth set team %d  \n" , cTeam);
                  digitalWrite(LED_team0, LOW);
                  digitalWrite(LED_team1, LOW);
                  digitalWrite(LED_team2, HIGH); 
                
        }
        else if(receivedMsg == 68 ){ //when want to active
                cTeam = 3;
                Serial.printf("blutooth set team %d  \n" , cTeam);
                digitalWrite(LED_team0, HIGH);
                  digitalWrite(LED_team1, LOW);
                  digitalWrite(LED_team2, LOW); 
                
        }
         
          //damage *******************************************
       else if(receivedMsg == 69 ){ //when want to active
                cDamage = 0;
                Serial.printf("blutooth set Damage %d  \n" , cDamage);
        }
        else if(receivedMsg == 70 ){ //when want to active
                cDamage = 1;
                Serial.printf("blutooth set Damage %d  \n" , cDamage);
        }
        else if(receivedMsg == 71 ){ //when want to active
                cDamage = 2;
                Serial.printf("blutooth set Damage %d  \n" , cDamage);
        }
         else if(receivedMsg == 72 ){ //when want to active
                cDamage = 3;
                Serial.printf("blutooth set Damage %d  \n" , cDamage);
        }
       
        //set temp ID***************************************
        else if(receivedMsg == 73 ){ //when want to active
                cTempid = 0;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 74 ){ //when want to active
                cTempid = 1;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 75 ){ //when want to active
                cTempid = 2;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 76 ){ //when want to active
                cTempid = 3;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
        else if(receivedMsg == 77 ){ //when want to active
                cTempid = 4;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 78 ){ //when want to active
                cTempid = 6;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 79 ){ //when want to active
                cTempid = 7;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 80 ){ //when want to active
                cTempid = 8;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 81 ){ //when want to active
                cTempid = 9;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 82 ){ //when want to active
                cTempid = 10;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 83 ){ //when want to active
                cTempid = 11;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 84 ){ //when want to active
                cTempid = 12;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
        else if(receivedMsg == 85 ){ //when want to active
                cTempid = 14;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }
         else if(receivedMsg == 86 ){ //when want to active
                cTempid = 15;
                Serial.printf("blutooth set Teampid %d  \n" , cTempid);
        }

      
        }
        
    
    
 //Serial.println("bluetooth " + cTeam + " " +cDamage + " " +cTempid  );

 // }


    if (IrReceiver.decode()) {

        shot_code = IrReceiver.decodedIRData.command;
        Serial.println("shotted");
        Serial.println(shot_code);

                
        /* digitalWrite(buzzer_port, HIGH);   // buzzer
                digitalWrite(LED_shot, HIGH);   // turn the LED on 
                delay(50);                       // wait for a second
                digitalWrite(LED_shot, LOW);    // turn the LED off   
                digitalWrite(buzzer_port, LOW);   // buzzer
                */
        int tempid_bit1 = shot_code%2;
           shot_code = shot_code/2;
        int tempid_bit2 = shot_code%2;
           shot_code = shot_code/2;
         int tempid_bit3 = shot_code%2;
           shot_code = shot_code/2;
         int tempid_bit4 = shot_code%2;
           shot_code = shot_code/2;


          int damage_bit1 = shot_code%2;
           shot_code = shot_code/2;
          int damage_bit2 = shot_code%2;
           shot_code = shot_code/2;
          int team_bit1 = shot_code%2;
          shot_code = shot_code/2;
          int team_bit2 = shot_code%2;
          int damage = damage_bit2*2 + damage_bit1;
          int team = team_bit2*2 + team_bit1;
         int tempid = tempid_bit4*2*2*2 + tempid_bit3*2*2 +tempid_bit2*2 + tempid_bit1;

            Serial.println(team);
            Serial.println(damage);
            Serial.println(tempid);

        IrReceiver.resume(); // Enable receiving of the next value

        /*
         * Finally, check the received data and perform actions according to the received command
         */
        if (team != cTeam && team != 0) {
          cHealth = cHealth - damage;
          Serial.println(cHealth);
          
  
            //tin tin methana thai shot unama ewaaa danne ********************************************
                 digitalWrite(buzzer_port, HIGH); 
                digitalWrite(LED_shot, HIGH);   // turn the LED on 
                delay(50);                       // wait for a second
                digitalWrite(LED_shot, LOW);    // turn the LED off   
                digitalWrite(buzzer_port, LOW);   // buzzer

                //check the health
                if(cHealth < 0){
                cActive = false;
                digitalWrite(LED_active, LOW); 
                digitalWrite(LED_shot, HIGH); 
                  }
                 //sending data to 4n


                SerialBT.write(90);
                SerialBT.write(team + 48);
                SerialBT.write(damage + 48);
                SerialBT.write(tempid + 48);
                SerialBT.write(33);
                Serial.println("code sent");
        } else if (IrReceiver.decodedIRData.command == 17) {
                //test shot
                digitalWrite(buzzer_port, HIGH);   // buzzer
                digitalWrite(LED_shot, HIGH);   // turn the LED on 
                delay(50);                       // wait for a second
                digitalWrite(LED_shot, LOW);    // turn the LED off   
                digitalWrite(buzzer_port, LOW);   // buzzer
                delay(50);    
                digitalWrite(buzzer_port, HIGH);   // buzzer
                digitalWrite(LED_shot, HIGH);   // turn the LED on 
                delay(50);                       // wait for a second
                digitalWrite(LED_shot, LOW);    // turn the LED off   
                digitalWrite(buzzer_port, LOW);   
                //sending data to 4n
                SerialBT.write(90);
                SerialBT.write(team + 48);
                SerialBT.write(damage + 48);
                SerialBT.write(tempid + 48);
                SerialBT.write(33);
                Serial.println("code sent");
        }
    }
}


             
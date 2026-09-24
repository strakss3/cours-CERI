/*
    Hello World.ino
    2013 Copyright (c) Seeed Technology Inc.  All right reserved.

    Author:Loovee
    2013-9-18

    Grove - Serial LCD RGB Backlight demo.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#include <Wire.h>
#include "rgb_lcd.h"

rgb_lcd lcd;

const int colorR = 0;
const int colorG = 0;
const int colorB = 255;

const int encoderA = 3;
const int encoderB = 4;
volatile long position = 0;
static long oldPosition = position;


void encoderISR() {
  /*
  * On lit l'état de la voie B.
  *
  * La combinaison des voies A et B permet de déterminer
  * le sens de rotation.
  *
  * Si B est à l'état HAUT :
  * ______________________________
  * | À COMPLÉTER |
  *
  * Sinon :
  * ______________________________
  */
    if (digitalRead(encoderB) == HIGH) {
      
      position++; // À COMPLÉTER : que doit-on faire ?
    }
    else {

      position--; // À COMPLÉTER : que doit-on faire ?
    }
}


void setup() {
    // Configure la voie A comme entrée avec résistance
    // de rappel interne.
    pinMode(encoderA, INPUT);
    // Configure la voie B comme entrée avec résistance
    // de rappel interne.
    pinMode(encoderB, INPUT);
    /*
    * Mise en place de l'interruption.
    *
    * L'interruption doit être déclenchée :
    * 1. sur la broche correspondant à encoderA
    * 2. lorsque l'état de cette broche change (front montant en 2)
    * 3. en appelant la fonction encoderISR()
    */
    attachInterrupt(
      digitalPinToInterrupt(encoderA),
      encoderISR,
      RISING
    );
    // Initialisation de la communication série
    // à 115200 bauds.

    // set up the LCD's number of columns and rows:
    lcd.begin(16, 2);

    lcd.setRGB(colorR, colorG, colorB);

    // Print a message to the LCD.
    lcd.print("BOUBOUBABABOU");

    delay(1000);
}

void loop() {
    // set the cursor to column 0, line 1
    // (note: line 1 is the second row, since counting begins with 0):
    if (position != oldPosition) {
        // On mémorise la nouvelle position.
        oldPosition = position;
        lcd.setCursor(0, 1);
        lcd.print(position);
    }
    // print the number of seconds since reset:

    delay(100);
}

/*********************************************************************************************************
    END FILE
*********************************************************************************************************/
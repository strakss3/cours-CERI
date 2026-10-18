#include <avr/interrupt.h>
// Variable partagée entre le programme principal et l'ISR.
// volatile indique au compilateur qu'elle peut être modifiée
// à tout moment par une interruption.
volatile unsigned long compteur = 0;

// ROUTINE D'INTERRUPTION DU TIMER2
// Exécutée automatiquement à chaque comparaison TCNT2 == OCR2A.
// Avec la configuration ci-dessus : 1 interruption = 1 ms.
ISR(TIMER2_COMPA_vect) {
  compteur++;
}

void setup() {
  pinMode(4, OUTPUT);
  setupTimer2();
  Serial.begin(9600);
}

void loop() {
  // Le programme principal continue de fonctionner
  // pendant que le Timer2 génère ses interruptions.
  Serial.println(compteur);
  // 1000 interruptions de 1 ms = 1000 ms = 1 seconde.
  if (compteur >= 1000) {
    compteur = 0;
    digitalWrite(4, !digitalRead(4));
  }
}

void setupTimer2() {
  cli();                    // désactivation temporaire des interruptions
  TCCR2A = 0;
  TCCR2B = 0;
  TCNT2 = 0;                // remise à zéro du compteur
  OCR2A = 249;              // valeur de comparaison (voir 3.4)
  TCCR2A |= (1 << WGM21);   // mode CTC
  TCCR2B |= (1 << CS22);    // prédiviseur 64
  TCCR2B |= (1 << CS21);
  TIMSK2 |= (1 << OCIE2A);  // autorise l'interruption de comparaison A
  sei();                    // réactivation des interruptions
}
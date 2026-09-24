/*
 * PPE - Codeur incrémental
 * -------------------------
 * Objectif :
 * - Détecter les changements d'état du signal A
 * - Lire le signal B pour déterminer le sens de rotation
 * - Compter les impulsions dans la variable position
 * - Afficher la position sur le moniteur série
 *
 * Le codeur possède deux sorties :
 * - voie A : signal utilisé pour déclencher l'interruption
 * - voie B : signal utilisé pour déterminer le sens de rotation
 */
// Broche connectée à la voie A du codeur
const int encoderA = 3;
// Broche connectée à la voie B du codeur
const int encoderB = 4;
// Variable contenant la position du codeur
// Elle est modifiée dans la routine d'interruption
volatile long position = 0;
/*
 * oldPosition mémorise la dernière position
 * qui a été affichée.
 *
 * static permet de conserver sa valeur entre
 * deux exécutions de loop().
 */
static long oldPosition = position;
/*
 * Routine d'interruption appelée lors d'un changement
 * d'état de la voie A.
 */
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
/*
 * Initialisation du programme
 */
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
  Serial.begin(115200);
}
/*
 * Boucle principale
 */
void loop() {
/*
 * On vérifie si la position du codeur a changé
 * depuis la dernière mesure.
 */
  if (position != oldPosition) {
  // On mémorise la nouvelle position.
  oldPosition = position;
  // Affichage d'un texte sur le moniteur série.
  Serial.print("Position = ");
  // Affichage de la position du codeur.
  Serial.println(position);
  }
}
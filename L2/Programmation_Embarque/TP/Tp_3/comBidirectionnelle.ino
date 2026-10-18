
#include <DHT.h>

// --------------------------------------------------
// Configuration des broches
// --------------------------------------------------

#define DHTPIN 4
#define DHTTYPE DHT11

const int potPin = A0;
const int boutonPin = 2;
const int led7Pin = 7;
const int led6Pin = 6;

// --------------------------------------------------
// Objet DHT
// --------------------------------------------------

DHT dht(DHTPIN, DHTTYPE);

// --------------------------------------------------
// Temporisation
// --------------------------------------------------

unsigned long previousMillis = 0;
const unsigned long interval = 2000;

// --------------------------------------------------
// Réception série
// --------------------------------------------------

String trame = "";

// --------------------------------------------------
// SETUP
// --------------------------------------------------

void setup()
{
  pinMode(boutonPin, INPUT_PULLUP);

  pinMode(led7Pin, OUTPUT);
  pinMode(led6Pin, OUTPUT);

  digitalWrite(led7Pin, LOW);
  analogWrite(led6Pin, 0);

  Serial.begin(9600);

  dht.begin();
}

// --------------------------------------------------
// LOOP
// --------------------------------------------------

void loop()
{
  // -----------------------------------------------
  // 1. Réception des commandes venant de Node-RED
  // -----------------------------------------------

  while (Serial.available() > 0)
  {
    char c = Serial.read();

    if (c == '\n')
    {
      traiterCommande(trame);
      trame = "";
    }
    else if (c != '\r')
    {
      trame += c;
    }
  }

  // -----------------------------------------------
  // 2. Envoi des mesures vers Node-RED
  // -----------------------------------------------

  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= interval)
  {
    previousMillis = currentMillis;

    envoyerMesures();
  }
}

// --------------------------------------------------
// Envoi des mesures vers Node-RED
// --------------------------------------------------

void envoyerMesures()
{
  float temperature = dht.readTemperature();
  float humidite = dht.readHumidity();

  int potentiometre = analogRead(potPin);

  // Avec INPUT_PULLUP :
  // LOW  = bouton appuyé
  // HIGH = bouton relâché
  bool bouton = (digitalRead(boutonPin) == LOW);

  // Vérification de lecture DHT11
  if (isnan(temperature) || isnan(humidite))
  {
    return;
  }

  // -----------------------------------------------
  // Construction du JSON
  // -----------------------------------------------

  Serial.print("{");

  Serial.print("\"temperature\":");
  Serial.print(temperature, 1);

  Serial.print(",\"humidite\":");
  Serial.print(humidite, 1);

  Serial.print(",\"potentiometre\":");
  Serial.print(potentiometre);

  Serial.print(",\"bouton\":");
  Serial.print(bouton ? "true" : "false");

  Serial.println("}");
}

// --------------------------------------------------
// Traitement des commandes reçues
// --------------------------------------------------

void traiterCommande(String json)
{
  // -----------------------------------------------
  // LED 7 : true / false
  // -----------------------------------------------

  if (json.indexOf("\"led7\":true") >= 0)
  {
    digitalWrite(led7Pin, HIGH);
  }

  if (json.indexOf("\"led7\":false") >= 0)
  {
    digitalWrite(led7Pin, LOW);
  }

  // -----------------------------------------------
  // LED 6 : 0 à 255
  // -----------------------------------------------

  int position = json.indexOf("\"led6\":");

  if (position >= 0)
  {
    position += 7;

    int fin = json.indexOf(",", position);

    if (fin < 0)
    {
      fin = json.indexOf("}", position);
    }

    String valeurString = json.substring(position, fin);

    analogWrite(led6Pin, valeurString.toInt());
  }
}

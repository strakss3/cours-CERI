#include <OneWire.h>
#include <DallasTemperature.h>
#include "DHT.h"
#include <ArduinoJson.h>
#include <Wire.h>
#include "rgb_lcd.h"


#define ONE_WIRE_BUS 5
#define DHTPIN 6

#define DHTTYPE DHT11   // DHT 22  (AM2302), AM2321


OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
DHT dht(DHTPIN, DHTTYPE);

rgb_lcd lcd;


int encoderAPin = 2;
int encoderBPin = 3;
int buttonPin   = 4;
int led1Pin     = 7;
int led2Pin     = 8;

volatile long position = 0;
static long oldPosition = 0;
bool buttonState = false;

void encoderISR() {

  if (digitalRead(encoderBPin) == HIGH) {
    
    position++; // À COMPLÉTER : que doit-on faire ?
  }
  else {

    position--; // À COMPLÉTER : que doit-on faire ?
  }
}

void setup() {
  
  pinMode(encoderAPin, INPUT);
  pinMode(encoderBPin, INPUT);
  pinMode(buttonPin, INPUT);
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);

  Serial.begin(9600);

  sensors.begin();
  dht.begin();

  attachInterrupt(
    digitalPinToInterrupt(encoderAPin),
    encoderISR,
    RISING
  );

  lcd.begin(16, 2);
  lcd.print("Votre appareil");
  lcd.setCursor(0,1);
  lcd.print("est en marche!");
  
}

void loop() {

  delay(2000);
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  float f = dht.readTemperature(true);

  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println(F("Failed to read from DHT sensor!"));
    return;
  }
  // Compute heat index in Fahrenheit (the default)
  float hif = dht.computeHeatIndex(f, h);
  // Compute heat index in Celsius (isFahreheit = false)
  float hic = dht.computeHeatIndex(t, h, false);
  
  
  sensors.requestTemperatures(); // Send the command to get temperatures
  float tempC = sensors.getTempCByIndex(0);

  JsonDocument michael;
  michael["temperature"] = t;
  michael["humidite"] = h;
  michael["ds18b20"] = tempC;

  serializeJson(michael, Serial);
  Serial.println();

  if (position != oldPosition) {
  // On mémorise la nouvelle position.
    oldPosition = position;
  }

  //Menu 0 : accueil
  lcd.setCursor(0, 0);
  lcd.print("                     ");
  lcd.setCursor(0, 1);
  lcd.print("                     ");

  if (position % 2 == 0) {

    lcd.setRGB(157, 12, 201);

    lcd.setCursor(0, 0);
    lcd.print("Temp: ");
    lcd.setCursor(6, 0);
    lcd.print(t);
    lcd.setCursor(6, 1);
    lcd.print(tempC);
  }
  else if (position % 2 == 1) {
    
    lcd.setRGB(187, 102, 20);

    lcd.setCursor(0, 0);
    lcd.print("Humidite:");
    lcd.setCursor(6, 1);
    lcd.print(h);
  }
  Serial.println(position);
}


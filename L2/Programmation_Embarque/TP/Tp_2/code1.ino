const int buttonPin = 2;
const int ledPin    = 8;
volatile bool eventButton = false;
volatile int counter = 0;


void buttonISR() {

  eventButton = true;
}


void setup() {

  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
  
  attachInterrupt(
    digitalPinToInterrupt(buttonPin),
    buttonISR,
    FALLING
  );
}


void loop() {

  if (eventButton) {
    
    eventButton = false;
    digitalWrite(ledPin, !digitalRead(ledPin));
    counter++;
    Serial.println(counter);
  }
}
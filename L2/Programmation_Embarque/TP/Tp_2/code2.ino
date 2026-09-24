const int sensor1Pin = 2;
const int sensor2Pin = 3;
const int led1Pin    = 7;
const int led2Pin    = 8;
volatile bool eventButton1 = false;
volatile bool eventButton2 = false;
volatile int counter = 0;


void button1ISR() {

  eventButton1 = true;
  if (eventButton2) {
    eventButton1 = false;
    eventButton2 = false;
    counter--;
  }
}

void button2ISR() {

  eventButton2 = true;
  if (eventButton1) {
    eventButton1 = false;
    eventButton2 = false;
    counter++;
  }
}


void setup() {

  pinMode(sensor1Pin, INPUT);
  pinMode(sensor2Pin, INPUT);
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  Serial.begin(9600);
  
  attachInterrupt(
    digitalPinToInterrupt(sensor1Pin),
    button1ISR,
    FALLING
  );

  attachInterrupt(
    digitalPinToInterrupt(sensor2Pin),
    button2ISR,
    FALLING
  );
}


void loop() {

  Serial.println(counter);
}
























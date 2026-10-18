void setup() {
  Serial.begin(9600);  // adapte le baudrate à ta config (9600, 115200, etc.)
}

void loop() {
  if (Serial.available() > 0) {
    char c = Serial.read();
    Serial.write(c);  // renvoie le caractère tel quel
  }
}
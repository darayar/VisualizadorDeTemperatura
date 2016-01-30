void setup() {
  Serial.begin(9600);

}

void loop() {
  int val = analogRead(A0);
  val = int(map(val, 0,1024,0,255));
  Serial.print(val);
  delay(1000);
}

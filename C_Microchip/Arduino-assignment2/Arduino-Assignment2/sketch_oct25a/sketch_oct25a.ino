void setup()
{
  Serial.begin(9600);
  Serial.println("Start");
  if(ReadEmoroHardware()&&GYR_AVAILABLE)
  {
    Serial.print("Gyr Available.");
  }
  if(ReadEmoroHardware()&&LCD_AVAILABLE)
  {
    Gyr.init();
    Serial.print("Lcd Available.");
  }
}
void loop()
{
   EmoroServo.attach(SERVO_0);
   EmoroServo.attach(SERVO_1);
   EmoroServo.write(SERVO_0,1900);
}

void setup(void) {
  Serial.begin(9600);
  Serial.println("Lab7.SW");
  //EmoroServo.attach(SERVO_0);
  //EmoroServo.write(SERVO_0,1000);
  if(ReadEmoroHardware()&SW_AVAILABLE)
  {
    Serial.println("SW Available");
  }
  else
  {
    Serial.println("SW not Available.");
  }
  //if(ReadEmoroHardware()&LCD_AVAILABLE)
  //{
  //  Lcd.print("ReadSwitch();");
  //}
  // put your setup code here, to run once:
}

void loop(void) {
  // put your main code here, to run repeatedly:
  if(ReadSwitch(SW_1)==1)
  {
    Serial.println("Switch SW_1 is activated");
    if(ReadEmoroHardware()&LCD_AVAILABLE)
    {
      Lcd.print("SW_1 activated");
      Lcd.locate(1,0);
      //Lcd.print("Servo.attach()");
      EmoroServo.attach(SERVO_0);
      EmoroServo.attach(SERVO_1);
      EmoroServo.write(SERVO_0,1000);
      EmoroServo.write(SERVO_1,2000);
      //delay(2000);
    }
  }
  else if(ReadSwitch(SW_4)==1)
  {
    if(ReadEmoroHardware()&LCD_AVAILABLE)
    {
      Lcd.print("SW_4 activated");
      Lcd.locate(1,0);
      //Lcd.print("Servo.detach()");
      EmoroServo.detach(SERVO_0);
      EmoroServo.detach(SERVO_1);
      //delay(2000);
    }
  }
}

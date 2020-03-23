void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Lab8");
  Ultrasonic.attach(GPP_0);
  Ultrasonic.attach(GPP_1);
  Ultrasonic.detach(GPP_1);
  if(ReadEmoroHardware()&LCD_AVAILABLE)
  {
    Serial.println("Lcd available.");
  }
  else
  {
    Serial.println("Lcd Not available.");
  }
}
void loop() {
  // put your main code here, to run repeatedly:
  //int ultrasonic;
  //ultrasonic=Ultrasonic.read(GPP_0);
  while(ReadSwitch(SW_1))
  {
    Serial.println("SW_1 acivated");
    if(ReadEmoroHardware()&LCD_AVAILABLE)
    {
      Lcd.locate(0,0);
      Lcd.print("moving forward");
      //Lcd.locate(1,0);
    }
    delay(100);
  }
  while(ReadSwitch(SW_2))
  {
    Serial.println("SW_2 activated");
    if(ReadEmoroHardware()&LCD_AVAILABLE)
    {
      //Lcd.locate(1,0);
      //Lcd.print(ultrasonic);
      //ultrasonic=Ultrasonic.read(GPP_0);
      //delay(2000);
      
      if(Ultrasonic.read(GPP_0)<400)
      {
         Lcd.clear();
         Lcd.locate(0,0);
         Lcd.print("line following");
         Lcd.locate(1,0);
         //Lcd.print(ultrasonic);
         Lcd.print("obstacle detected");
         delay(2000);
         //break;
      }
      else
      {
         Lcd.clear();
         Lcd.locate(0,0);
         Lcd.print("line following");
         Lcd.locate(1,0);
         Lcd.print("out of range");
         delay(2000);
         //break;
      }
      //Lcd.print(ultrasonic);
    }
    delay(100);
  }
}

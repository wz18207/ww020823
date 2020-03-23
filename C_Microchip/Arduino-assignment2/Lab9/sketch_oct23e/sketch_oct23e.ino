void setup() {
  Serial.begin(9600);
  Serial.println("Lab9");
  if(ReadEmoroHardware()&GYR_AVAILABLE)
  {
    Serial.print("Gyr available");
  }
  else
  {
    Serial.print("Gyr not available");
  }
  if(ReadEmoroHardware()&LCD_AVAILABLE)
  {
    Gyr.init();
    if(ReadEmoroHardware()&GYR_AVAILABLE)
    {
      Lcd.locate(1,0);
      Lcd.print("Available");
    }
    else
    {
      Lcd.locate(1,0);
      Lcd.print("Not Available");
    }
  }
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
  int res;
  double x_deg,y_deg,z_deg;
  char buf[64];
  res=Gyr.readDegrees(&x_deg,&y_deg,&z_deg);
  if(res==0)
  {
    sprintf(buf,"X=%3d,Y=%3d,Z=%3d",(int)x_deg,(int)y_deg,(int)z_deg);
    Serial.print(buf);
  }
  else
  {
    Serial.println("Can't read angular position.");
  }
  Lcd.locate(0,0);
  Lcd.print("X Y Z");
  Lcd.locate(1,0);
  sprintf(buf,"%3d %3d %3d",(int)x_deg,(int)y_deg,(int)z_deg);
  Lcd.print(buf);
  if(ReadSwitch(SW_1))
  {
    Serial.println("Set current position.X=0,Y=180,Z=90.");
    Gyr.setDegrees(0,180,90);
  }
  else if(ReadSwitch(SW_2))
  {
    Gyr.stop();
    Serial.println("Terminate Gyro Advanced mode.");
  }
  delay(300);
}

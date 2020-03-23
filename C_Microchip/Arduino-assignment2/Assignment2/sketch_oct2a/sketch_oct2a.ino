int t,y,u,i;
int follow=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Assignment2");
  if(ReadEmoroHardware()&SW_AVAILABLE)
  {
    Serial.println("SW available");
  }
  if(ReadEmoroHardware()&GYR_AVAILABLE)
  {
    Serial.println("Gyr available");
  }
  if(ReadEmoroHardware()&LCD_AVAILABLE)
  {
    Serial.println("Lcd.available");
    if(Mag.testConnection()==0)
    {
      Serial.println("Mag not available.");
    }
  }
  if(Mag.testConnection()==0)
  {
    Serial.println("Mag not available.");
  }
  else
  {
    Serial.print("Sensor not available");
  }
  Lcd.clear();
  Lcd.locate(0,0);
  Lcd.print("1.Obstacle2.Circle");
  Lcd.locate(1,0);
  Lcd.print("3.Square4.Reset");
  //InitEmoro();
  Gyr.init();
}
void loop() {
  //int Mod=0;
  // put your main code here, to run repeatedly:
  if(ReadSwitch(SW_1)==1)
  {
    t=1;
  }
  if(ReadSwitch(SW_2)==1)
  {
    y=1;
  }
  if(ReadSwitch(SW_3)==1)
  {
    u=1;
  }
  while(t)//SW_1
  {
    Lcd.clear();
    Lcd.locate(0,0);
    Lcd.print("1.Obstacle");
    Serial.println("SW_1 is activated");
    EmoroServo.attach(SERVO_0);
    EmoroServo.attach(SERVO_1);
    EmoroServo.write(SERVO_1,1000);
    EmoroServo.write(SERVO_0,2000);
    //delay(5);
    Ultrasonic.attach(GPP_0);
    if(Ultrasonic.read(GPP_0)<30)
    {
      Lcd.locate(1,0);
      Lcd.print("obstacle detected");
      Serial.print("obstacle detected");
      EmoroServo.write(SERVO_1,1500);
      EmoroServo.write(SERVO_0,1500);
      //delay(325);//rotate pi/2.
      //delay(2000);
    }
    else
    {
      Lcd.locate(1,0);
      Lcd.print("moving forward");
      Serial.print("moving forward");
      EmoroServo.write(SERVO_1,1000);
      EmoroServo.write(SERVO_0,2000);
      //delay(5);
    }
    if(ReadSwitch(SW_4)==1)
    {
      Serial.println("SW_4 is activated");
      EmoroServo.detach(SERVO_0);
      EmoroServo.detach(SERVO_1);
      //InitEmoro();
      Ultrasonic.detach(0);
      Lcd.clear();
      Lcd.locate(0,0);
      Lcd.print("1.Obstacle2.Circle");
      Lcd.locate(1,0);
      Lcd.print("3.Square4.Reset");
      t=0;
    }
    delay(10);
  }
  while(y)//SW_2
  {
    pinMode(IO_0,INPUT_PULLUP);
    pinMode(IO_1,INPUT_PULLUP);
    EmoroServo.attach(SERVO_0);
    EmoroServo.attach(SERVO_1);
    //EmoroServo.write(SERVO_1,1000);
    //EmoroServo.write(SERVO_0,2000);
    //Mod=2;
    Lcd.clear();
    Lcd.print("Circle track following");
    Serial.println("SW_2 is activated");
    //int t1=digitalRead(IO_0);
    //int t2=digitalRead(IO_1);
    //Serial.print(t1);
    //Serial.print("    ");
    //Serial.print(t2);
    if(digitalRead(IO_0)==0&&digitalRead(IO_1)==0)
    {
      EmoroServo.write(SERVO_1,1500);
      EmoroServo.write(SERVO_0,1500);
      //y=0;
    }
    else if(digitalRead(IO_0)==1&&digitalRead(IO_1)==1)
    {
      EmoroServo.write(SERVO_1,1000);
      EmoroServo.write(SERVO_0,2000);
    }
    else if(digitalRead(IO_0)==0)
    {
//      EmoroServo.write(SERVO_0,1500);
//      EmoroServo.write(SERVO_1,1000);
      EmoroServo.write(SERVO_0,2000);
      EmoroServo.write(SERVO_1,1500);
      //delay(20);
    }
    else if(digitalRead(IO_1)==0)
    {
//      EmoroServo.write(SERVO_0,2000);
//      EmoroServo.write(SERVO_1,1500);
      EmoroServo.write(SERVO_0,1500);
      EmoroServo.write(SERVO_1,1000);
      //delay(20);
    }
    //delay(10);
    if(ReadSwitch(SW_4)==1)
    {
      Serial.println("SW_4 is activated");
      EmoroServo.detach(SERVO_0);
      EmoroServo.detach(SERVO_1);
      Lcd.clear();
      Lcd.locate(0,0);
      Lcd.print("1.Obstacle2.Circle");
      Lcd.locate(1,0);
      Lcd.print("3.Square4.Reset");
      y=0;
    }
    //delay(10);
  }
  while(u)//SW_3
  {
    char buf[32];
    pinMode(IO_0,INPUT_PULLUP);
    pinMode(IO_1,INPUT_PULLUP);
    double res=Gyr.readDegreesZ();
    EmoroServo.attach(SERVO_0);
    EmoroServo.attach(SERVO_1);
    //EmoroServo.write(SERVO_1,1000);
    //EmoroServo.write(SERVO_0,2000);
    //Mod=2;
    Lcd.clear();
    Lcd.locate(0,0);
    Lcd.print("Square track following");
    Serial.println("SW_3 is activated");
    //int t1=digitalRead(IO_0);
    //int t2=digitalRead(IO_1);
    //Serial.print(t1);
    //Serial.print("    ");
    //Serial.print(t2);
  if(digitalRead(IO_0)==0&&digitalRead(IO_1)==0)
    {
      EmoroServo.write(SERVO_1,1750);
      EmoroServo.write(SERVO_0,1750);
      //y=0;
    }
    else if(digitalRead(IO_0)==1&&digitalRead(IO_1)==1)
    {
      EmoroServo.write(SERVO_1,1250);
      EmoroServo.write(SERVO_0,1750);
    }
    else if(digitalRead(IO_0)==0)
    {
      EmoroServo.write(SERVO_0,1750);
      EmoroServo.write(SERVO_1,1750);
      double z_deg_read=Gyr.readDegreesZ();
      double z_deg=abs(z_deg_read-res);
//      if(z_deg_read-z_deg==90)
//      {
        sprintf(buf,"Sharp turning %3d degrees",double(z_deg));
        Serial.print(buf);
        Lcd.locate(1,0);
        Lcd.print(buf);
//        EmoroServo.write(SERVO_1,1250);
//        EmoroServo.write(SERVO_0,1750);
//      }
//      EmoroServo.write(SERVO_0,1500);
//      EmoroServo.write(SERVO_1,1000);
//      delay(20);
      //delay(20);
    }
    else if(digitalRead(IO_1)==0)
    {
        EmoroServo.write(SERVO_0,1250);
        EmoroServo.write(SERVO_1,1250);
      double z_deg_read=Gyr.readDegreesZ();
      double z_deg=z_deg_read-res;
//      if(z_deg_read-z_deg==90)
//      {
        sprintf(buf,"Sharp turning %3d degrees",double(z_deg));
        Serial.print(buf);
        Lcd.locate(1,0);
        Lcd.print(buf);
//        EmoroServo.write(SERVO_1,1250);
//        EmoroServo.write(SERVO_0,1750);
//      }
//      EmoroServo.write(SERVO_0,2000);
//      EmoroServo.write(SERVO_1,1500);
      //delay(20);
    }
    //delay(10);
    //delay(325);
//    double x_deg;//Turning into different degree.
//    //char buf[64];
//    if(x_deg>=0)
//    {
//      //sprintf(buf,"Sharp turning 90 degrees");
//      sprintf(buf,"Sharp turning %3d degrees",(int)x_deg);
//      Lcd.locate(1,0);
//      Lcd.print(buf);
//      //EmoroServo.write(SERVO_1,1500);
//      //delay(10);
//    }
    if(ReadSwitch(SW_4)==1)
    {
      Serial.println("SW_4 is activated");
      EmoroServo.detach(SERVO_0);
      EmoroServo.detach(SERVO_1);
      Lcd.clear();
      Lcd.locate(0,0);
      Lcd.print("1.Obstacle2.Circle");
      Lcd.locate(1,0);
      Lcd.print("3.Square4.Reset");
      u=0;
    }
  }
}

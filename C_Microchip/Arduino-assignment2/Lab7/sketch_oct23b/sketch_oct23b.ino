char name_1[36]="1.obstacle2.circle";
char name_2[36]="3.square4.reset";
void setup() 
{
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Example:Lab7");
  if(ReadEmoroHardware()&LCD_AVAILABLE)
  {
    Serial.println("Lcd Available");
    Lcd.print(name_1);
    Lcd.locate(1,0);
    Lcd.print(name_2);
  }
  else
  {
    Serial.println("Not Available");
  }
}

void loop() {
  // put your main code here, to run repeatedly:

}

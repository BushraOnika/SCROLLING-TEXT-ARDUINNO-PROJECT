#include <LiquidCrystal.h>

const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

char msg[16] = { 'L','I','F','E',' ','i','s',' ','J','o','u','r','n','e','y'};

int i = 0;
void setup() {
  lcd.begin(16,2);
  lcd.setCursor(0, 0);
  lcd.print("MY Message is: ");
}

void loop() {
  lcd.setCursor(0, 1);
  for(i = 0; i < 16; i++)
  {
    lcd.print(msg[i]);
  }
  delay(2000);

  char swap = msg[0];
  for (i = 0; i <16; i++)
  {
    msg[i] = msg[i+1];
  }
  msg[15] = swap;
}

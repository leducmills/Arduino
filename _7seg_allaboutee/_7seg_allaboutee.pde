int d1=9,d2=10,d3=11,d4=12;

void setup()
{
 DDRD=0xff; // all pins 0-7 OUTPUTs
 DDRB=0xff; // all pins 8-13 OUTPUTs even though we only use pins 8-12
 PORTD=0x00; // make pins 0-7 LOWs
 PORTB=0x00; // make pins 8-13 LOWs
}

void loop()
{
  // light up first digit only
  digitalWrite(d2,LOW);
  digitalWrite(d3,LOW);
  digitalWrite(d4,LOW);
  digitalWrite(d1,HIGH);
    // light up segments of first digit, display number #1, segments bc
    PORTD=B11100111; //B00011000; // only pins 2 and 3 are on
    digitalWrite(8,HIGH); // turn off pin 8
delay(2);
  // light up second digit only
  digitalWrite(d1,LOW);
  digitalWrite(d3,LOW);
  digitalWrite(d4,LOW);
  digitalWrite(d2,HIGH);
    // light up segments of second digit, display #2, segments abdeg
    PORTD=B10010011; //B01101100; // only pins 2,3,5 and 6 on
    digitalWrite(8,LOW); // segment g on
delay(2);
  // light up third digit only
  digitalWrite(d1,LOW);
  digitalWrite(d2,LOW);
  digitalWrite(d4,LOW);
  digitalWrite(d3,HIGH);
    // light up segments of third digit, display #3
    PORTD=B11000011; //B00111100; // only pins 2,3 and 5 on
    digitalWrite(8,LOW); // segment g on
delay(2);
  // light up fourth digit only
  digitalWrite(d1,LOW);
  digitalWrite(d2,LOW);
  digitalWrite(d3,LOW);
  digitalWrite(d4,HIGH);
    // light up segments of fourth digit only, display #4
    PORTD=B01100111; //B10011000; // only pins 3,4 and 7 on
    digitalWrite(8,LOW); // segment g on
delay(2);
}

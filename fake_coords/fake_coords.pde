String c000 = "0,0,0;";
String c001 = "0,0,1;";
String c002 = "0,0,2;";
String c003 = "0,0,3;";
String c010 = "0,1,0;";
String c011 = "0,1,1;";
String c012 = "0,1,2;";
String c013 = "0,1,3;";
String c020 = "0,2,0;";
String c021 = "0,2,1;";
String c022 = "0,2,2;";
String c023 = "0,2,3;";
String c030 = "0,3,0;";
String c031 = "0,3,1;";
String c032 = "0,3,2;";
String c033 = "0,3,3;";

String c100 = "1,0,0;";
String c101 = "1,0,1;";
String c102 = "1,0,2;";
String c103 = "1,0,3;";
String c110 = "1,1,0;";
String c111 = "1,1,1;";
String c112 = "1,1,2;";
String c113 = "1,1,3;";
String c120 = "1,2,0;";
String c121 = "1,2,1;";
String c122 = "1,2,2;";
String c123 = "1,2,3;";
String c130 = "1,3,0;";
String c131 = "1,3,1;";
String c132 = "1,3,2;";
String c133 = "1,3,3;";

String c200 = "2,0,0;";
String c201 = "2,0,1;";
String c202 = "2,0,2;";
String c203 = "2,0,3;";
String c210 = "2,1,0;";
String c211 = "2,1,1;";
String c212 = "2,1,2;";
String c213 = "2,1,3;";
String c220 = "2,2,0;";
String c221 = "2,2,1;";
String c222 = "2,2,2;";
String c223 = "2,2,3;";
String c230 = "2,3,0;";
String c231 = "2,3,1;";
String c232 = "2,3,2;";
String c233 = "2,3,3;";

String c300 = "3,0,0;";
String c301 = "3,0,1;";
String c302 = "3,0,2;";
String c303 = "3,0,3;";
String c310 = "3,1,0;";
String c311 = "3,1,1;";
String c312 = "3,1,2;";
String c313 = "3,1,3;";
String c320 = "3,2,0;";
String c321 = "3,2,1;";
String c322 = "3,2,2;";
String c323 = "3,2,3;";
String c330 = "3,3,0;";
String c331 = "3,3,1;";
String c332 = "3,3,2;";
String c333 = "3,3,3;";

String coord[] = {
c000, c001, c002, c003,
c010, c011, c012, c013,
c020, c021, c022, c023,
c030, c031, c032, c033,

c100, c101, c102, c103,
c110, c111, c112, c113,
c120, c121, c122, c123,
c130,c131, c132, c133,

c200, c201, c202, c203,
c210, c211, c212, c213,
c220, c221, c222, c223,
c230, c231, c232, c233,

c300, c301, c302, c303,
c310, c311, c312, c313,
c320, c321, c322, c323,
c330, c331, c332, c333
};

void setup() {
  
  
  
  Serial.begin(9600);
}


void loop() {
  
 
 Serial.print(coord[0]);
 Serial.print(coord[10]);
 Serial.print(coord[random(64)]);
 Serial.print(coord[random(64)]);
// Serial.print(coord[random(64)]);
// Serial.print(coord[random(64)]);
 Serial.print('\n');
 delay(50);
 
  
}

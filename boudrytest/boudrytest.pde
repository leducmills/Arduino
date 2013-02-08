int currentx = 0;
int currenty = 0;

int max_x = 100;
int max_y = 100;

void setup() {
  
  Serial.begin(9600);
  randomSeed(analogRead(4));

}

void loop() {
  
  Serial.print("current x:");
  Serial.println(currentx);
  Serial.print("current y:");
  Serial.println(currenty);
  delay(1000);
  
  int movex = random(1, 50);
  int movey = random(1, 50);
  
  Serial.print("move x:");
  Serial.println(movex);
  Serial.print("move y:");
  Serial.println(movey);
  delay(1000);
  
  if(currentx + movex < max_x){
    currentx += movex;
     
  }
  
  if(currenty + movey < max_y){
    currenty += movey; 
  }
  
}

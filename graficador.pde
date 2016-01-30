import processing.serial.*;
Serial myPort;  

int val[] = new int[40];
int counter = 0;
void setup() 
{
  size(600, 620);
  background(0); 
  for(int count = 0; count<40; count++) {
    val[count]=0;
  }
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
}

void draw()
{
  if(myPort.available() > 0) {
      int temp = myPort.read();    
      val[counter]= 1.5*((temp*5000/255)-500)/20+25;    
      
      if(counter==39){
        counter=0;
        for(int count = 0; count<40; count++) {
          val[count]=0;
        }
      }
      else{
        counter+=1;
      }
  }
  fill(0);
  rect(0,0,600,600);
  fill(255,255,255);
  stroke(255,255,255);
  rect(0,0,100,620);
  rect(500,0,100,620);
  for(int count = 0; count < 40; count++) {
    int x = 10*count;
    int y = val[count];
    fill(255,255,255);
    stroke(255,255,255);
    rect(100+x, 0, 5, 600-y-30); 
    rect(x+105, 0, 5, 600);
  }
  rect(100,570,400,60);
  textSize(50);
  fill(255,0,255);
  text("Q-TECH's", 300,80);
  textSize(28);
  fill(20,150,200);
  text("Temperature viewer", 270,120);
  stroke(198,20,138);
  
  line(90,570,500,570);
  line(495,573,500,570);
  line(495,567,500,570);
  
  line(90,570,90,150);
  line(87,155,90,150);
  line(93,155,90,150);
  
  textSize(20);
  fill(20,198,138);
  text("Time", 480,600);
  
  textSize(20);
  fill(20,198,138);
  text("Temperature", 15,130);
  
  delay(10);
}

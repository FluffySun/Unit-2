//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int y1,y2;

void setup(){
  size(600, 600);
  y1=-100;//set the starting value
  y2=700;
  strokeWeight(5);
} //---end of setup ---

void draw() {
  background(255);
  ellipse(150, y1, 200, 200);
  ellipse(450, y2, 200, 200);
  y1=y1+5;
  y2=y2-5;
  if (y1>700){ //> < >= <= ==
  y1=-100;
  y2=700;
  }
  strokeWeight(5);
} //---end of draw---

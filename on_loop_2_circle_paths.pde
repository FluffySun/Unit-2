//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int x,y;

void setup(){
  size(600, 600);
  x=0;//set the starting value
  y=0;
  strokeWeight(5);
} //---end of setup ---

void draw() {
  background(255);
  ellipse(x, y, 200, 200);
  x= x-3;
  y= y+3;
  if (x<-100){ //> < >= <= ==
  x=600;
  }
  if (y>600){ //> < >= <= ==
    y=-100;
  }
} //---end of draw---

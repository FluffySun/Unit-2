//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int x,r;

void setup(){
  size(600, 600);
  x=0;//set the starting value
  r=0;
  strokeWeight(5);
} //---end of setup ---

void draw() {
  background(255);
  ellipse(x, 300, r, r);
  x= x+5;
  r= r+1;
  if (x>700){ //> < >= <= ==
  x=0;
  r=0;
  }
  strokeWeight(5);
} //---end of draw---

//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int x;
int y;

void setup(){
  size(600, 600);
  x=300; //set the starting value
  y=200;
} //---end of setup ---

void draw() {
  background(0);
  ellipse(x,300, 300, 300);
  x=x+5; //not an equation-replace x by x+1
  rect (300,y,200,200);
  y=y+1;
} //---end of draw---

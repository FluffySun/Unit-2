//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int x,y;

void setup(){
  size(600, 600);
  x=0;
  y=0;; //set the starting value
  strokeWeight(5);
} //---end of setup ---

void draw() {
  background(255);
  ellipse(x,y, 300, 300);
  y=y+1; //not an equation-replace x by x+1
  x=x+1;
  if (y>700){ //> < >= <= ==
    y=-100;
  }
  ellipse(x,y, 200,200);
  x=x+1;
  if (x>700){
    x=-100;
  }
} //---end of draw---

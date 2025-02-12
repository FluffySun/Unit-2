//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

void setup(){
  size(600, 600);
} //---end of setup ---

void draw() {
  //background (255);
  strokeWeight(1);
  //fill(mouseX);
  ellipse(300,300, 200, 200);
  line(300,300,mouseX,mouseY);
} //---end of draw---

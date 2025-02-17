//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int bg1,bg2,bg3;
int bunny;

void setup(){
  size(800, 600);
  
  //initialize background mountains
  bg1=0;
  bg2=400;
  bg3=800;
  
  //initialize bunny
  bunny=100;
  
} //---end of setup ---

void draw() {
  //sky
  background(3,173,255);
  
  //background hills
  fill(2,255,93);
  ellipse(bg1,400,400,400);
  ellipse(bg2,400,400,400);
  ellipse(bg3,400,400,400);
  //move hills
  bg1=bg1+2;
  bg2=bg2+2;
  bg3=bg3+2;
  //loop the hills
  if(bg1>1000){
    bg1=-200;
  }
  if(bg2>1000){
    bg2=-200;
  }
  if(bg3>1000){
    bg3=-200;
  }
  
  //ground
  fill(255,249,72);
  rect(0,400,800,200);
  
  //blob
  fill(255);
  ellipse(bunny,400,200,200);//head
  ellipse(bunny-50,300,50,100);//left ear
  ellipse(bunny+50,300,50,100);//right ear
  //move bunny
  bunny=bunny+10;
  //loop the bunny
  if(bunny>1000){
    bunny=-100;
  }
  
} //---end of draw---

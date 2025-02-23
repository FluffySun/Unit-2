//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
// - mouseX, mouseY: coordinates for mouse pointer

//define your own variable here
int bg1, bg2, bg3;
int bunny;
float angle = 0;
int sunX, sunY;
float sunAngle = 0;

void setup(){
  size(800, 600);
  
  //initialize background mountains
  bg1=0;
  bg2=400;
  bg3=800;
  
  //initialize bunny
  bunny=100;
  
  //initialize sun
  sunX=width/2;
  sunY=height/4;
  
} //---end of setup ---

void draw() {
  //sky
  background(3,173,255);
  
  //sun
  fill(255,223,0);
  sunX=int(400+cos(sunAngle)*200);
  sunY=int(200+sin(sunAngle)*200);
  ellipse(sunX,sunY,100,100);
  sunAngle+=0.02;
  
  //background hills
  fill(2,255,93);
  ellipse(bg1,400,400,400);
  ellipse(bg2,400,400,400);
  ellipse(bg3,400,400,400);
  
  //second row of bushes
  fill(34,139,34);//different colors
  ellipse(bg1-100,450,300,200);
  ellipse(bg2-100,450,300,200);
  ellipse(bg3-100,450,300,200);
  
  //move hills
  bg1=bg1+2;
  bg2=bg2+2;
  bg3=bg3+2;
  
  //move second row bushes
   if (frameCount % 2 == 0) { // Slower movement
    bg1 = bg1 + 1;
    bg2 = bg2 + 1;
    bg3 = bg3 + 1;
  }
  
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
  
  //bunny
  fill(255);
  ellipse(bunny,400,200,200);//head
  ellipse(bunny-50,300,50,100);//left ear
  ellipse(bunny+50,300,50,100);//right ear
  fill(#ef233c,50);
  ellipse(bunny-50, 400,40,50);//left eye
  ellipse(bunny+50, 400,40,50);//right eye
  fill(#ff4d6d,250);
  ellipse(bunny-50, 400, 20,20);//left middle eye
  ellipse(bunny+50, 400, 20,20);//right middle eye

  //nose
  fill(255);
  triangle(-20,20,20,20,0,40);
  
  //mouth
  stroke(0);
  line(-20,50,20,50);

  //move bunny
  bunny=bunny+10;
  angle+=0.1;
  
  //loop the bunny
  if(bunny>1000){
    bunny=-100;
  }
  
  //text
  textSize(32);
  textFont(createFont("Georgia", 32));
  fill(0);
  text("BUNNY", width / 2 - 50, height / 5);
  
} //---end of draw---

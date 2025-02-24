//Anyue/Ema Sun
//Unit 2 Animation
//Feb 10th 2025

//Built in variables:
//define your own variable here
int bg1, bg2, bg3;
int bunny;
float angle = 0;
int sun;
float sunAngle = 0;

void setup() {
  size(800, 600);

  //initialize bushes/background
  bg1 = 0;
  bg2 = 400;
  bg3 = 800;

  //initialize bunny
  bunny = 100;

  //initialize sun
  angle=0;
} //---end of setup ---

void draw() {
  //sky
  background(#a2d2ff);
  int sun;
  sun (400, 200);
  
  //background hills
  fill(#93e1d8);
  ellipse(bg1, 400, 400, 400);
  ellipse(bg2, 400, 400, 400);
  ellipse(bg3, 400, 400, 400);

  //second row of bushes
  fill(#cdb4db); //different colors
  ellipse(bg1 - 100, 450, 300, 200);
  ellipse(bg2 - 100, 450, 300, 200);
  ellipse(bg3 - 100, 450, 300, 200);

  //move hills
  bg1 = bg1 + 2;
  bg2 = bg2 + 2;
  bg3 = bg3 + 2;

  //move second row bushes
  if (frameCount % 2 == 0) { // Slower movement
    bg1 = bg1 + 1;
    bg2 = bg2 + 1;
    bg3 = bg3 + 1;
  }

  //loop the hills
  if (bg1 > 1000) {
    bg1 = -200;
  }
  if (bg2 > 1000) {
    bg2 = -200;
  }
  if (bg3 > 1000) {
    bg3 = -200;
  }

  //ground
  fill(#ffc8dd);
  rect(0, 400, 800, 200);

  //bunny
  pushMatrix();
  translate(bunny, 400);
  rotate(radians(angle));
  fill(255);
  ellipse(0, 0, 200, 200); //head
  ellipse(-50, -100, 50, 100); //left ear
  ellipse(50, -100, 50, 100); //right ear
  fill(#ef233c, 50);
  ellipse(-50, 0, 40, 50); //left eye
  ellipse(50, 0, 40, 50); //right eye
  fill(#ff4d6d, 250);
  ellipse(-50, 0, 20, 20); //left middle eye
  ellipse(50, 0, 20, 20); //right middle eye

  //nose
  fill(255, 0, 0); // Red nose
  triangle(-20, 20, 20, 20, 0, 40); // Nose

  //mouth
  stroke(0);
  line(-20, 50, 20, 50); // Mouth
  popMatrix(); //

  //move bunny
  bunny = bunny + 5;
  angle = angle+ 1;

  //loop the bunny
  if (bunny > 1000) {
    bunny = -100;
  }

  //text
  textSize(32);
  textFont(createFont("Georgia", 32));
  fill(#072ac8);
  text("BUNNY", width / 2 - 50, height / 5);
} //---end of draw---

void sun(int x, int y) {
  pushMatrix();
  noStroke();
  fill(#ffee32);
  translate(x, y);
  rotate(radians(angle));
  ellipse(200, 0, 100, 100);
  popMatrix();
}

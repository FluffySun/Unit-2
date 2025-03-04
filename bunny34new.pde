// Anyue/Ema Sun
// Unit 2 Animation
// Feb 10th 2025

// Built-in variables:
int bg1, bg2, bg3;
int bunny;
float angle = 0;
int sun;
float sunAngle = 0; // Sun move
int flowerX = -50; // Flower move
int treeX= -450; // Tree move
float sunX, sunY;
int sunRadius = 80;
int sunSpeed = 2;
int sunCenterX = 450, sunCenterY = 100;

void setup() {
  size(800, 600);

  // Initialize bushes/background
  bg1 = 0;
  bg2 = 400;
  bg3 = 800;

  // Initialize bunny
  bunny = 100;

  // Initialize sun position
  sunX = sunCenterX + sunRadius;
  sunY = sunCenterY;
} 

void draw() {
  // Sky
  background(#a2d2ff);
  sun(); 

  // Clouds (stay still)
  fill(255, 255, 255, 125);
  ellipse(50, 100, 80, 50);
  ellipse(250, 50, 80, 50);
  ellipse(450, 150, 60, 40);
  ellipse(750, 200, 60, 40);

  // Background hills moving
  fill(#93e1d8);
  ellipse(bg1, 400, 400, 400);
  ellipse(bg2, 400, 400, 400);
  ellipse(bg3, 400, 400, 400);

  // Second row of bushes
  fill(#cdb4db); 
  ellipse(bg1 - 100, 450, 300, 200);
  ellipse(bg2 - 100, 450, 300, 200);
  ellipse(bg3 - 100, 450, 300, 200);

  // Move background smoothly
  bg1 -= 1;
  bg2 -= 1;
  bg3 -= 1;

  // Loop background seamlessly
  if (bg1 <= -400) bg1 = bg3 + 400;
  if (bg2 <= -400) bg2 = bg1 + 400;
  if (bg3 <= -400) bg3 = bg2 + 400;

  // Ground
  fill(#ffc8dd);
  rect(0, 400, 800, 200);

  // Move flower across the screen
  flowerX += 2; 
  if (flowerX > 900) {
    flowerX = -50;
  }
  
  // Move tree across the screen
  treeX +=3;
  if(treeX>800){
    treeX= -100;
  }

  // Draw flower at updated position
  drawFlower(flowerX, 450);

  // Tree
  drawTree(treeX, 350);

  // Bunny
  pushMatrix();
  translate(bunny, 400);
  rotate(radians(angle));
  fill(255);
  ellipse(0, 0, 200, 200);
  ellipse(-50, -100, 50, 100);
  ellipse(50, -100, 50, 100);
  fill(#ef233c, 50);
  ellipse(-50, 0, 40, 50);
  ellipse(50, 0, 40, 50);
  fill(#ff4d6d, 250);
  ellipse(-50, 0, 20, 20);
  ellipse(50, 0, 20, 20);

  // Nose & Mouth
  fill(255, 0, 0);
  triangle(-20, 20, 20, 20, 0, 40);
  stroke(0);
  line(-20, 50, 20, 50);
  popMatrix();

  // Move bunny
  bunny += 5;
  angle += 1;

  // Loop bunny
  if (bunny > 1000) {
    bunny = -100;
  }

  // Text
  textSize(32);
  textFont(createFont("Georgia", 32));
  fill(#072ac8);
  text("BUNNY", width / 2 - 50, height / 5);
}

// Function for sun movement
void sun() {
  pushMatrix();
  noStroke();
  fill(#ffee32);

  translate(sunX, sunY);
  ellipse(0, 0, 100, 100);

  popMatrix();

  sunX = sunCenterX + sunRadius * ((sunAngle % 360) / 180.0);
  sunY = sunCenterY + sunRadius * ((sunAngle % 360) / 90.0);

  sunAngle += sunSpeed;
}

// Function to draw a moving flower
void drawFlower(int x, int y) {
  fill(#ff0000);
  ellipse(x - 10, y - 10, 20, 20);
  ellipse(x + 10, y - 10, 20, 20);
  ellipse(x - 10, y + 10, 20, 20);
  ellipse(x + 10, y + 10, 20, 20);

  fill(#ffff00);
  ellipse(x, y, 15, 15);

  fill(#008000);
  rect(x - 2, y+7, 4, 28);
}

// Function to draw a tree
void drawTree(int x, int y) {
  fill(#8B4513);
  rect(x - 10, y-10, 20, 60);
  
  fill(#228B22);
  ellipse(x, y - 20, 60, 60);
}

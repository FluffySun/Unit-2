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

void setup() {
  size(800, 600);

  // Initialize bushes/background
  bg1 = 0;
  bg2 = 400;
  bg3 = 800;

  // Initialize bunny
  bunny = 100;

  // Initialize sun
  angle = 0;
} //---end of setup ---

void draw() {
  // Sky
  background(#a2d2ff);
  sun(400, 100); // Fixed function call

  // Clouds (stay still)
  fill(255, 255, 255, 125);
  ellipse(50, 100, 80, 50);
  ellipse(250, 50, 80, 50);
  ellipse(450, 150, 60, 40);
  ellipse(750, 200, 60, 40);

  // Background hills moving at different speeds
  fill(#93e1d8);
  ellipse(bg1, 400, 400, 400);
  ellipse(bg2, 400, 400, 400);
  ellipse(bg3, 400, 400, 400);

  // Second row of bushes
  fill(#cdb4db); // Different color
  ellipse(bg1 - 100, 450, 300, 200);
  ellipse(bg2 - 100, 450, 300, 200);
  ellipse(bg3 - 100, 450, 300, 200);

  // Move background smoothly
  bg1 += 1;
  bg2 += 2;
  bg3 += 3;

  // Loop background
  if (bg1 > 1000) bg1 = -400;
  if (bg2 > 1000) bg2 = -400;
  if (bg3 > 1000) bg3 = -400;

  // Ground
  fill(#ffc8dd);
  rect(0, 400, 800, 200);

  // Move flower across the screen
  flowerX += 2; 
  if (flowerX > 900) {
    flowerX = -50;
  }

  // Draw flower at updated position
  drawFlower(flowerX, 450);

  // Tree (stationary in the middle)
  drawTree(400, 350);

  // Bunny
  pushMatrix();
  translate(bunny, 400);
  rotate(radians(angle));
  fill(255);
  ellipse(0, 0, 200, 200); // Head
  ellipse(-50, -100, 50, 100); // Left ear
  ellipse(50, -100, 50, 100); // Right ear
  fill(#ef233c, 50);
  ellipse(-50, 0, 40, 50); // Left eye
  ellipse(50, 0, 40, 50); // Right eye
  fill(#ff4d6d, 250);
  ellipse(-50, 0, 20, 20); // Left middle eye
  ellipse(50, 0, 20, 20); // Right middle eye

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
void sun(int x, int y) {
  pushMatrix();
  noStroke();
  fill(#ffee32);
  translate(x, y);
  rotate(radians(angle));
  ellipse(0, 0, 100, 100); // Fixed sun positioning
  popMatrix();

  angle = angle + 0.5;
}

// Function to draw a moving flower
void drawFlower(int x, int y) {
  fill(#ff0000); // Red petals
  ellipse(x - 10, y - 10, 20, 20);
  ellipse(x + 10, y - 10, 20, 20);
  ellipse(x - 10, y + 10, 20, 20);
  ellipse(x + 10, y + 10, 20, 20);

  fill(#ffff00); // Yellow center
  ellipse(x, y, 15, 15);

  fill(#008000); // Green stem
  rect(x - 2, y, 4, 28);
}

// Function to draw a tree
void drawTree(int x, int y) {
  fill(#8B4513); // Brown trunk
  rect(x - 10, y, 20, 60); // Tree trunk
  
  fill(#228B22); // Green leaves
  ellipse(x, y - 20, 60, 60); // Leaves
}

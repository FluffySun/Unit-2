// Anyue/Ema Sun
// Unit 2 Animation
// Mar 4th, 2025

// Built-in variables:
int bg = 0; // Background 
int bunny;
int angle = 0;
int sunY = -100; // Sun starts off screen
int flowerX = -50; // Flower move
int treeX = -150; // Tree move

void setup() {
  size(800, 600);
  bunny = 100; // initialize bunny 
}

void draw() {
  // Sky
  background(#a2d2ff);
  noStroke();
  
  sun();//call the function
  
  // Clouds stay
  fill(255, 255, 255, 125);
  ellipse(50, 100, 80, 50);
  ellipse(250, 50, 80, 50);
  ellipse(450, 150, 60, 40);
  ellipse(750, 200, 60, 40);

  //Bushes
  fill(#93e1d8);
  ellipse(bg, 400, 400, 400);     
  ellipse(bg + 400, 400, 400, 400); 
  ellipse(bg + 800, 400, 400, 400); 
  ellipse(bg + 1200,400,400,400);

  // Second row of bushes
  fill(#cdb4db);
  ellipse(bg - 100, 450, 300, 200);
  ellipse(bg + 300, 450, 300, 200);
  ellipse(bg + 700, 450, 300, 200);
  ellipse(bg+1100,450,300,200);

  //Move background
  bg -=1;
  
  if(bg<=-400){
    bg+=400;
  }
  
//Sun move
sunY +=1;

if (sunY > 450) { 
    sunY = -100;  // Restart from the top
  }

  // Move background 
  bg -= 1;

  // Background
  if (bg <= -400) {
    bg += 1200;  // Moves back to the right
  }

  // Ground
  fill(#ffc8dd);
  rect(0, 400, 800, 200);

  // Move flower across the screen
  flowerX =flowerX+ 2;
  if (flowerX > 900) {
    flowerX = -50;
  }

  // Move tree across screen
  treeX += 2;
  if (treeX > 800) {
    treeX = -150;
  }

  // Draw flower
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
  rect(x - 2, y + 7, 4, 28);
}

// Function draw tree
void drawTree(int x, int y) {
  fill(#8B4513);
  rect(x - 10, y - 10, 20, 60);

  fill(#228B22);
  ellipse(x, y - 20, 60, 60);
}

// Sun
void sun() {
  pushMatrix();
  noStroke();
  fill(#ffee32);

  translate(405, sunY);  // Sun moves up and down
  ellipse(0, 0, 100, 100);
  popMatrix();
}

// Anyue/Ema Sun
// Unit 2 Animation - Interactive Rainy Day Scene
// Feb 10th 2025

int numDrops = 80;  // Number of raindrops
Raindrop[] drops = new Raindrop[numDrops];

float umbrellaX, umbrellaY;
boolean blinking = false;
int blinkTimer = 0;

void setup() {
  size(800, 600);
  
  // Initialize raindrops
  for (int i = 0; i < numDrops; i++) {
    drops[i] = new Raindrop();
  }
  
  // Initialize umbrella position
  umbrellaX = width / 2;
  umbrellaY = height - 200;
} // <--- FIXED missing closing bracket!

void draw() {
  // Gradient Background for stormy effect
  drawGradientBackground(color(50, 50, 80), color(10, 10, 30));

  // Draw rain
  for (int i = 0; i < numDrops; i++) {
    drops[i].fall();
  }

  // Draw character
  drawCharacter(width / 2, height - 120);

  // Draw umbrella following the mouse
  drawUmbrella(mouseX, umbrellaY);
}

// Function to draw a gradient background (stormy sky effect)
void drawGradientBackground(color c1, color c2) { // <--- FIXED function name!
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(0, i, width, i);
  }
}

// Function to draw the character with blinking eyes
void drawCharacter(float x, float y) {
  fill(180, 150, 100);
  ellipse(x, y, 50, 60);  // Head
  fill(50, 50, 50);
  rect(x - 15, y + 30, 30, 50, 10);  // Body

  // Eyes
  fill(255);
  ellipse(x - 10, y - 5, 10, 10);
  ellipse(x + 10, y - 5, 10, 10);

  // Blink logic (blinks every ~2-4 seconds)
  if (frameCount % 180 == 0) {
    blinking = !blinking;
    blinkTimer = frameCount + 10;
  }
  if (blinking && frameCount < blinkTimer) {
    fill(0);
    ellipse(x - 10, y - 5, 10, 3);
    ellipse(x + 10, y - 5, 10, 3);
  }
}

// Function to draw an umbrella following the mouse
void drawUmbrella(float x, float y) {
  fill(200, 0, 0);
  arc(x, y, 120, 80, PI, TWO_PI);  // Canopy
  stroke(100);
  strokeWeight(4);
  line(x, y, x, y + 80);  // Handle
}

// Raindrop Class
class Raindrop {
  float x, y, speed;

  Raindrop() {
    x = random(width);
    y = random(-200, height);
    speed = random(4, 10);
  }

  void fall() {
    fill(100, 100, 255, 150);
    noStroke();
    ellipse(x, y, 5, 15);
    y += speed;

    // When raindrop hits the ground, create splash and reset
    if (y > height - 5) {
      drawSplash(x, height - 5);
      y = random(-200, -50);
      x = random(width);
    }
  }
}

// Function to draw splash effect
void drawSplash(float x, float y) {
  stroke(100, 100, 255, 150);
  strokeWeight(2);
  line(x - 5, y, x - 10, y - 5);
  line(x + 5, y, x + 10, y - 5);
}

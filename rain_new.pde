// Anyue/Ema Sun
// Unit 2 Animation - Rainy Day Scene
// Feb 18th 2025

// Number of raindrops
int numDrops = 80;
float[] dropX = new float[numDrops];
float[] dropY = new float[numDrops];
float[] dropSpeed = new float[numDrops];

// Character properties
float charX, charY;
boolean blinking = false;
int blinkTimer = 0;

// Additional characters
int numChars = 5;
float[] otherCharX = new float[numChars];
float[] otherCharY = new float[numChars];
float[] charSpeed = new float[numChars];
color[] charColors = new color[numChars];

// Moon properties
float moonAngle = 0;
float moonRadius = 250;

// Traffic light properties
int lightState = 0; // 0: Red, 1: Yellow, 2: Green
int lightTimer = 0;

// Setup function
void setup() {
  size(800, 600);
  smooth();
  frameRate(60);
  
  // Initialize raindrops
  for (int i = 0; i < numDrops; i++) {
    dropX[i] = random(width);
    dropY[i] = random(-height, 0);
    dropSpeed[i] = random(2, 5);
  }
  
  // Initialize main character position
  charX = width / 2;
  charY = height - 150;
  
  // Initialize additional characters
  for (int i = 0; i < numChars; i++) {
    otherCharX[i] = random(width);
    otherCharY[i] = height - 150;
    charSpeed[i] = random(1, 3);
    charColors[i] = color(random(255), random(255), random(255));
  }
}

// Draw function
void draw() {
  // Draw gradient background
  drawGradientBackground(color(138, 43, 226), color(30, 144, 255));
  
  // Draw moon with halo
  drawMoon();
  
  // Draw lightning every 5 seconds
  if (frameCount % (5 * 60) == 0) {
    drawLightning();
  }
  
  // Update and draw raindrops
  updateRaindrops();
  
  // Update traffic light
  updateTrafficLight();
  
  // Draw traffic light
  drawTrafficLight();
  
  // Update and draw additional characters
  updateCharacters();
  
  // Draw main character and umbrella following mouse
  drawMainCharacter(mouseX, charY);
  drawUmbrella(mouseX, charY - 60);
  
  // Draw decorative shapes
  drawDecorativeShapes();
  
  // Draw title
  drawTitle();
}

// Function to draw gradient background
void drawGradientBackground(color c1, color c2) {
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    stroke(lerpColor(c1, c2, inter));
    line(0, y, width, y);
  }
}

// Function to draw moon with halo
void drawMoon() {
  float moonX = width / 2 + cos(moonAngle) * moonRadius;
  float moonY = 100 + sin(moonAngle) * 20;
  
  // Halo
  noStroke();
  fill(255, 255, 224, 50);
  ellipse(moonX, moonY, 100, 100);
  
  // Moon
  fill(255, 255, 224);
  ellipse(moonX, moonY, 80, 80);
  
  // Update moon angle
  moonAngle += 0.01;
}

// Function to draw lightning
void drawLightning() {
  stroke(255, 255, 224);
  strokeWeight(2);
  for (int i = 0; i < 5; i++) {
    float startX = random(width);
    float startY = 0;
    float endX = startX + random(-50, 50);
    float endY = random(100, 300);
    line(startX, startY, endX, endY);
  }
  // Flash effect
  fill(255, 255, 224, 80);
  rect(0, 0, width, height);
}

// Function to update and draw raindrops
void updateRaindrops() {
  for (int i = 0; i < numDrops; i++) {
    fill(100, 100, 255, 150);
    noStroke();
    ellipse(dropX[i], dropY[i], 5, 15);
    dropY[i] += dropSpeed[i];
    if (dropY[i] > height) {
      dropY[i] = random(-100, 0);
      dropX[i] = random(width);
    }
  }
}

// Function to update traffic light
void updateTrafficLight() {
  lightTimer++;
  if (lightTimer > 180) { // Change light every 3 seconds
    lightState = (lightState + 1) % 3;
    lightTimer = 0;
  }
}

// Function to draw traffic light
void drawTrafficLight() {
  float lightX = width - 50;
  float lightY = height - 300;
  
  // Pole
  fill(50);
  rect(lightX - 10, lightY - 50, 20, 200);
  
  // Light housing
  fill(30);
  rect(lightX - 20, lightY - 60, 40, 120, 5);
}
 

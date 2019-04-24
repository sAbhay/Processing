Puzzle puzzle;
int snapToGrid = 0; // 0: none, 1: edges, 2: all
color bg = color(255);
SettingsMenu sMenu;

void setup() {
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  strokeWeight(2);

  String path = "/Users/abhaysinghal/Desktop/World_Map.png";
  puzzle = new Puzzle(path, 100);
  print(factors(1000));
  
  sMenu = new SettingsMenu(width*1340/1440, height*1/9, (width+height)/(29.25*2), height*2/9);
  puzzle.randomize();
}

void draw() {
  background(bg);
  puzzle.updatePos(mouseX, mouseY);
  puzzle.checkMismatch(snapToGrid);
  puzzle.display(bg);
  sMenu.display();
}

int sign(float n) {
  return (int(n > 0) - int(n < 0));
}

void mousePressed() {
  puzzle.updateSelection(mouseX, mouseY);
  sMenu.update();
}

IntList factors(int num) {
  IntList factors = new IntList();

  // Skip two if the number is odd
  int incrementer = num % 2 == 0 ? 1 : 2;

  for (int i = 1; i <= Math.sqrt(num); i += incrementer) {

    // If there is no remainder, then the number is a factor.
    if (num % i == 0) {
      factors.append(i);

      // Skip duplicates
      if (i != num / i) {
        factors.append(num / i);
      }
    }
  }

  // Sort the list of factors
  return factors;
}

color complementColour(color c) {
  int r = 0, g = 0, b = 0;
  r += c>>16&0xFF;
  g += c>>8&0xFF;
  b += c&0xFF;
  
  float minRGB = min(r, min(g, b));
  float maxRGB = max(r, max(g, b));
  float minPlusMax = minRGB + maxRGB;
  color complement = color(minPlusMax-r, minPlusMax-g, minPlusMax-b); 

  return complement;
}

color extractOppositeColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    r += c>>16&0xFF;
    g += c>>8&0xFF;
    b += c&0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;

  color complement = complementColour(color(r, g, b));

  return complement;
}
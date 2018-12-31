String code[] = {"", "", "", "", "", ""};
String actual[] = {"20", "174", "GREEN", "BEAR", "SELENA", ""};
String clueText[] = {"20 mL of an acid was used to dissolve telling parts of the victim. The acid was then neutralised with a basic solution to cover up its usage. How many milliliters of this solution was used?",
"The killer first attempted to hit the victim with a slingshot projectile, but the victim noticed and ducked. One footprint of the killer was found. It was determined that the projectile was slung from that position. Upon further analysis, it was determined that it was slung at a 12º angle from the top of the killer’s head and hit the final position after 0.49 seconds. The x distance between the initial and final positions of the projectile is 2.2 m. The projectile hit the wall at a height of 1.2 m. What is the killer’s height to the nearest cm?",
"The scissors were left in a aqueous solution of a white solid (which was recovered post distillation). What is the colour of the pH of this solution? Which is it closest to: red, yellow, green, dark blue, purple", 
"There is a green-handled box of bones with a specific karyotype. The code to the box is 8-34-0. There is also a list of organisms with differing chromosome numbers. Determine the organism by counting chromosomes and convert its name into numbers.",
"On the animal, a hair containing the killers DNA was found. The killers DNA can be sequenced from the animal’s name. Sequence the killers DNA using different number bases. What is the first name of the killer?",
"Congratulations! You're done!"};
int index = 0;
float cellW;
float cellH;
int state = 0;
boolean wrong = false; 

void setup() {
  fullScreen();
  cellW = 0.75*width/actual[index].length();
  cellH = height/3;
  textAlign(LEFT);
}

void draw() {
  if(wrong) background(255,0,0);
  else background(255);
  
  fill(0);
  
  text("Clue: " + (index+2), 50, 100);
  
  textSize(12);
  text(clueText[index], 100, 150, width-100, height-200);
  
  textSize(20);
  text("Answer: " + code[index], 100, height - 100);
}

void cells() {
  for (int i = 0; i < actual[index].length(); i++) {
    fill(255);
    rect(width/8 + i * cellW, cellH, cellW, cellH);
    fill(0);
    if (i < code[index].length()) {
      textSize(cellW);
      text(code[index].charAt(i), (i+1) * cellW + cellW/2 - (6-actual[index].length())*cellW/6, cellH + 3*cellH/4);
    }
  }
}

void keyPressed() {
  if (key != CODED) {
    code[index] += str(key).toUpperCase();
  }

  if (key == BACKSPACE) {
    if (code[index].length() > 0) {
      code[index] = code[index].substring(0, code[index].length()-1);
    }
  }

  if (key == ENTER) {
    checkPasscode(code[index], actual[index]);
    code[index] = "";
  }
}

void checkPasscode(String code, String actual) {
  if (code.substring(0, code.length()-1).equals(actual)) {
    index++; 
    wrong = false;
  }
  else wrong = true;
}
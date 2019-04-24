String Q[] = {"q0", "q1", "q2"};
//char T[] = {'0', '+', '-', '*', '/', '(', ')', 'X'};
char B = 'B';
//char S[] = {'0', '+', '-', '*', '/', '(', ')', 'B'};
char T[] = {'0', 'X', '+'};
char S[] = {'0', 'c', B};
String I = "q0";
String F = "q3";
String tape = "S+00^00+000^0+0^00";
boolean headRight = true;
int headPos = 1;
int tSize = 50;
String currState = I;
boolean halt = false;
boolean pause = false;
int delay = 0;

void setup() {
  fullScreen();
  textSize(tSize);
  rectMode(CENTER);
  textAlign(CENTER);
  for (int i = 0; i < 100; i++) {
    tape += B;
  }
}

void draw() {
  background(255);
  delay(100);
  
  for (int i = 0; i < tape.length(); i++) {
    fill(0);
    text(tape.charAt(i), tSize*(i-headPos) + width/2, height/2);
  }
  
  rect(width/2, height/2 - tSize*2, tSize/2, tSize);
  if (headRight) {
    triangle(width/2 + tSize/2, height/2 - tSize*1.75, width/2 + tSize/2, height/2 - tSize*2.25, width/2 + tSize*0.75, height/2 - tSize*2);
  } else {
    triangle(width/2 - tSize/2, height/2 - tSize*1.75, width/2 - tSize/2, height/2 - tSize*2.25, width/2 - tSize*0.75, height/2 - tSize*2);
  }
  
  text(currState, width/3, 2*height/3);
  text(tape.charAt(headPos), 2*width/3, 2*height/3);
  
  if (!delta() && !pause) {
    if (headRight) headPos++; else headPos--;
  } 
  
  //println(currState);
  //println(tape.charAt(headPos));
  println(tape);
}

boolean delta() {
  if (currState == "q0" && tape.charAt(headPos) == B) command("q1", 'M', false);
  else if (currState == "q1" && tape.charAt(headPos) == '+') command("q2", '+', true);
  else if (currState == "q1" && tape.charAt(headPos) == 'S') command("q15", 'S', true);
  else if (currState == "q2" && tape.charAt(headPos) == '0') command("q3", 'X', true);
  else if (currState == "q2" && tape.charAt(headPos) == '+') command("q8", '+', true);
  else if (currState == "q3" && tape.charAt(headPos) == '^') command("q4", '^', true);
  else if (currState == "q3" && tape.charAt(headPos) == B) command("q13", B, false);
  else if (currState == "q4" && tape.charAt(headPos) == '0') command("q5", 'T', true);
  else if (currState == "q4" && tape.charAt(headPos) == '^') command("q4", '^', true);
  else if (currState == "q4" && tape.charAt(headPos) == B) command("q1", B, false);
  else if (currState == "q4" && tape.charAt(headPos) == 'M') command("q6", 'M', true);
  else if (currState == "q5" && tape.charAt(headPos) == B) command("q5", '0', false);
  else if (currState == "q5" && tape.charAt(headPos) == '^') command("q4", '^', true);
  else if (currState == "q6" && tape.charAt(headPos) == B) command("q7", '*', false);
  else if (currState == "q7" && tape.charAt(headPos) == '^') command("q2", '^', false);
  else if (currState == "q7" && tape.charAt(headPos) == 'T') command("q7", '0', false);
  else if (currState == "q8" && tape.charAt(headPos) == B) command("q9", 'B', false);
  else if (currState == "q9" && tape.charAt(headPos) == '*') command("q10", 'B', false);
  else if (currState == "q11" && tape.charAt(headPos) == '0') command("q11", 'X', false);
  else if (currState == "q11" && tape.charAt(headPos) == '^') command("q11", 'X', false);
  else if (currState == "q11" && tape.charAt(headPos) == '+') command("q12", 'X', true);
  else if (currState == "q10" && tape.charAt(headPos) == 'M') command("q11", 'M', false);
  else if (currState == "q12" && tape.charAt(headPos) == 'B') command("q14", '+', false);
  else if (currState == "q13" && tape.charAt(headPos) == '+') command("q13", B, false);
  else if (currState == "q14" && tape.charAt(headPos) == 'M') command("q1", 'M', false);
  else if (currState == "q15" && tape.charAt(headPos) == B) command("q16", B, false);
  else if (currState == "q16" && tape.charAt(headPos) == '+') command("q16", 'A', false);
  else if (currState == "q16" && tape.charAt(headPos) == '0') return true;
  return false;
}

void command(String nState, char toWrite, boolean hR) {
  currState = nState;
  String nTape = tape.substring(0,headPos) + toWrite + tape.substring(headPos+1);
  tape = nTape;
  if (hR) headRight = true; else headRight = false;
}

void keyPressed() {
  if (key == ' ') pause = !pause;
  if (key == 'w') delay += 100;
  if (key == 's') delay -= 100;
}
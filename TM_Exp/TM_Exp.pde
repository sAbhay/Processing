String Q[] = {"q0", "q1", "q2"};
//char T[] = {'0', '+', '-', '*', '/', '(', ')', 'X'};
char B = 'B';
//char S[] = {'0', '+', '-', '*', '/', '(', ')', 'B'};
char T[] = {'0', 'X', '+'};
char S[] = {'0', 'c', B};
String I = "q0";
String F = "q3";
String tape = "S000^00";
boolean headRight = true;
int headPos = 1;
int tSize = 50;
String currState = I;
boolean halt = false;

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
  //delay(500);
  
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
  
  if (!delta()) {
    if (headRight) headPos++; else headPos--;
  }
  
  println(tape);
}

boolean delta() {
  //if (currState == "q0" && tape.charAt(headPos) == '0') command("q1", 'X', true);
  //else if (currState == "q1" && tape.charAt(headPos) == B) command("q2", '0', false);
  //else if (currState == "q2" && tape.charAt(headPos) == 'X') command("q0", 'X', true);
  //else if (currState == "q2" && tape.charAt(headPos) == 'S') command("q0", 'S', true);
  //else if (currState == "q3" && tape.charAt(headPos) == '0') halt = true;
  
  if (currState == "q0" && tape.charAt(headPos) == B) command("q1", 'M', false);
  else if (currState == "q1" && tape.charAt(headPos) == 'S') command("q2", 'S', true);
  else if (currState == "q2" && tape.charAt(headPos) == '0') command("q3", 'X', true);
  else if (currState == "q2" && tape.charAt(headPos) == 'S') command("q8", 'S', true);
  else if (currState == "q3" && tape.charAt(headPos) == '^') command("q4", '^', true);
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
  else if (currState == "q10" && tape.charAt(headPos) == '*') return true;
  return false;
}

void command(String nState, char toWrite, boolean hR) {
  currState = nState;
  String nTape = tape.substring(0,headPos) + toWrite + tape.substring(headPos+1);
  tape = nTape;
  if (hR) headRight = true; else headRight = false;
}
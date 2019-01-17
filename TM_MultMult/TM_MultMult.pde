String Q[] = {"q0", "q1", "q2"};
//char T[] = {'0', '+', '-', '*', '/', '(', ')', 'X'};
char B = 'B';
//char S[] = {'0', '+', '-', '*', '/', '(', ')', 'B'};
char T[] = {'0', 'X', '+'};
char S[] = {'0', 'c', B};
String I = "q0";
String F = "q3";
String tape = "S00*00*00*00";
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
  delay(delay);
  
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
  } else {
    int ans = 0;
    boolean end= false;
    
    for (int i = tape.length()-1; i >= 0; i--) {
      if (tape.charAt(i) == 'E') end = true;
      if (tape.charAt(i) == '0' && !end) {
        ans++;
      }
    }
    
    println(ans);
  }
}

boolean delta() {
  if (currState == "q0" && tape.charAt(headPos) == B) command("q8", 'E', false);
  else if (currState == "q0" && tape.charAt(headPos) == '*') command("q0", 'M', true);
  else if (currState == "q1" && tape.charAt(headPos) == B) command("q9", 'E', false);
  else if (currState == "q1" && tape.charAt(headPos) == 'M') command("q2", 'M', true);
  else if (currState == "q2" && tape.charAt(headPos) == '0') command("q3", 'X', true);
  else if (currState == "q2" && tape.charAt(headPos) == 'M') command("q1", 'M', true);
  else if (currState == "q2" && tape.charAt(headPos) == 'S') return true;
  else if (currState == "q4" && tape.charAt(headPos) == 'M') command("q4", '*', true);
  else if (currState == "q3" && tape.charAt(headPos) == '*') command("q4", '*', true);
  else if (currState == "q4" && tape.charAt(headPos) == '0') command("q5", 'T', true);
  else if (currState == "q4" && tape.charAt(headPos) == '*') command("q4", '*', true);
  else if (currState == "q4" && tape.charAt(headPos) == B) command("q1", B, false);
  else if (currState == "q4" && tape.charAt(headPos) == 'E') command("q7", 'E', false);
  else if (currState == "q5" && tape.charAt(headPos) == B) command("q5", '0', false);
  else if (currState == "q5" && tape.charAt(headPos) == '*') command("q4", '*', true);
  else if (currState == "q7" && tape.charAt(headPos) == '*') command("q2", '*', false);
  else if (currState == "q7" && tape.charAt(headPos) == 'T') command("q7", '0', false);
  else if (currState == "q8" && tape.charAt(headPos) == 'M') command("q1", '*', false);
  else if (currState == "q10" && tape.charAt(headPos) == '0') command("q10", 'X', false);
  else if (currState == "q10" && tape.charAt(headPos) == '*') command("q10", 'X', false);
  else if (currState == "q9" && tape.charAt(headPos) == 'E') command("q10", 'X', false);
  else if (currState == "q10" && tape.charAt(headPos) == 'M') command("q2", '*', false);
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
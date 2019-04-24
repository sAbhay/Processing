String Q[] = {"q0", "q1", "q2"};
//char T[] = {'0', '+', '-', '*', '/', '(', ')', 'Z'};
char B = 'B';
//char S[] = {'0', '+', '-', '*', '/', '(', ')', 'B'};
char T[] = {'0', 'Z', '+'};
char S[] = {'0', 'c', B};
String I = "q0";
String F = "q3";
String tape = "S+0*0*0*0+00*0+00*00+0*0";
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
    println(tape);
  }
}

boolean delta() {
  if (currState == "q0" && tape.charAt(headPos) == B) command("q7", 'E', false);
  else if (currState == "q0" && tape.charAt(headPos) == '*') command("q0", 'M', true);
  else if (currState == "q1" && tape.charAt(headPos) == B) command("q8", 'E', false);
  else if (currState == "q1" && tape.charAt(headPos) == 'M') command("q2", 'M', true);
  else if (currState == "q1" && tape.charAt(headPos) == '+') command("q2", '+', true);
  else if (currState == "q2" && tape.charAt(headPos) == '0') command("q3", 'Z', true);
  else if (currState == "q2" && tape.charAt(headPos) == 'M') command("q1", 'M', true);
  else if (currState == "q2" && tape.charAt(headPos) == '+') command("q10", 'Z', true);
  else if (currState == "q4" && tape.charAt(headPos) == 'M') command("q4", '*', true);
  else if (currState == "q3" && tape.charAt(headPos) == '*') command("q4", '*', true);
  else if (currState == "q4" && tape.charAt(headPos) == '0') command("q5", 'T', true);
  else if (currState == "q4" && tape.charAt(headPos) == '*') command("q4", '*', true);
  else if (currState == "q4" && tape.charAt(headPos) == B) command("q1", B, false);
  else if (currState == "q4" && tape.charAt(headPos) == 'E') command("q6", 'E', false);
  else if (currState == "q5" && tape.charAt(headPos) == B) command("q5", '0', false);
  else if (currState == "q5" && tape.charAt(headPos) == '*') command("q4", '*', true);
  else if (currState == "q6" && tape.charAt(headPos) == '*') command("q2", '*', false);
  else if (currState == "q6" && tape.charAt(headPos) == 'T') command("q6", '0', false);
  else if (currState == "q7" && tape.charAt(headPos) == 'M') command("q1", '*', false);
  else if (currState == "q7" && tape.charAt(headPos) == 'S') command("q14", 'S', true);
  else if (currState == "q9" && tape.charAt(headPos) == '0') command("q9", 'Z', false);
  else if (currState == "q9" && tape.charAt(headPos) == '*') command("q9", 'Z', false);
  else if (currState == "q8" && tape.charAt(headPos) == 'E') command("q9", 'Z', false);
  else if (currState == "q9" && tape.charAt(headPos) == 'M') command("q2", '*', false);
  else if (currState == "q10" && tape.charAt(headPos) == '0') command("q10", 'Z', true);
  else if (currState == "q10" && tape.charAt(headPos) == '*') command("q10", 'Z', true);
  else if (currState == "q10" && tape.charAt(headPos) == 'E') command("q11", 'Z', true);
  else if (currState == "q11" && tape.charAt(headPos) == '0') command("q11", '1', true);
  else if (currState == "q11" && tape.charAt(headPos) == B) command("q12", 'A', true);
  else if (currState == "q12" && tape.charAt(headPos) == B) command("q13", 'E', false);
  else if (currState == "q13" && tape.charAt(headPos) == '0') command("q13", '1', false);
  else if (currState == "q13" && tape.charAt(headPos) == 'Z') command("q7", 'Z', false);
  else if (currState == "q14" && tape.charAt(headPos) == B) command("q15", B, false);
  else if (currState == "q15" && tape.charAt(headPos) == 'E') command("q15", 'Z', false);
  else if (currState == "q15" && tape.charAt(headPos) == '1') command("q15", '0', false);
  else if (currState == "q15" && tape.charAt(headPos) == 'A') command("q15", '+', false);
  else if (currState == "q15" && tape.charAt(headPos) == 'S') command("q16", 'S', true);
  else if (currState == "q16" && tape.charAt(headPos) == B) command("q17", B, false);
  else if (currState == "q17" && tape.charAt(headPos) == '+') command("q17", 'Z', false);
  else if (currState == "q17" && tape.charAt(headPos) == '0') return true;
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
  if (key == 's' && delay >= 100) delay -= 100;
}
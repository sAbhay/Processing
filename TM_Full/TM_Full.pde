String Q[] = {"q0", "q1", "q2"};
//char T[] = {'0', '+', '-', '*', '/', '(', ')', 'X'};
char B = 'B';
//char S[] = {'0', '+', '-', '*', '/', '(', ')', 'B'};
char T[] = {'0', 'X', '+'};
char S[] = {'0', 'c', B};
String I = "q0";
String F = "q3";
String tape = "S+00^0+00^000+000^00";
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
      if (tape.charAt(i) == 'A') end = true;
      if (tape.charAt(i) == '0' && !end) {
        ans++;
      }
    }

    println(ans);
    println(tape);
  }
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
  else if (currState == "q16" && tape.charAt(headPos) == '+') command("q17", B, false);
  else if (currState == "q17" && tape.charAt(headPos) == 'M') command("q17", '+', false);
  else if (currState == "q17" && tape.charAt(headPos) == 'X') command("q18", 'S', true);
  else if (currState == "q18" && tape.charAt(headPos) == B) command("q25", 'E', false);
  else if (currState == "q18" && tape.charAt(headPos) == '*') command("q18", 'M', true);
  else if (currState == "q19" && tape.charAt(headPos) == B) command("q26", 'E', false);
  else if (currState == "q19" && tape.charAt(headPos) == 'M') command("q20", 'M', true);
  else if (currState == "q19" && tape.charAt(headPos) == '+') command("q20", '+', true);
  else if (currState == "q20" && tape.charAt(headPos) == '0') command("q21", 'Z', true);
  else if (currState == "q20" && tape.charAt(headPos) == 'M') command("q19", 'M', true);
  else if (currState == "q20" && tape.charAt(headPos) == '+') command("q28", 'Z', true);
  else if (currState == "q22" && tape.charAt(headPos) == 'M') command("q22", '*', true);
  else if (currState == "q21" && tape.charAt(headPos) == '*') command("q22", '*', true);
  else if (currState == "q22" && tape.charAt(headPos) == '0') command("q23", 'T', true);
  else if (currState == "q22" && tape.charAt(headPos) == '*') command("q22", '*', true);
  else if (currState == "q22" && tape.charAt(headPos) == B) command("q19", B, false);
  else if (currState == "q22" && tape.charAt(headPos) == 'E') command("q24", 'E', false);
  else if (currState == "q23" && tape.charAt(headPos) == B) command("q23", '0', false);
  else if (currState == "q23" && tape.charAt(headPos) == '*') command("q22", '*', true);
  else if (currState == "q24" && tape.charAt(headPos) == '*') command("q20", '*', false);
  else if (currState == "q24" && tape.charAt(headPos) == 'T') command("q24", '0', false);
  else if (currState == "q25" && tape.charAt(headPos) == 'M') command("q19", '*', false);
  else if (currState == "q25" && tape.charAt(headPos) == 'S') command("q32", 'S', true);
  else if (currState == "q27" && tape.charAt(headPos) == '0') command("q27", 'Z', false);
  else if (currState == "q27" && tape.charAt(headPos) == '*') command("q27", 'Z', false);
  else if (currState == "q26" && tape.charAt(headPos) == 'E') command("q27", 'Z', false);
  else if (currState == "q27" && tape.charAt(headPos) == 'M') command("q20", '*', false);
  else if (currState == "q28" && tape.charAt(headPos) == '0') command("q28", 'Z', true);
  else if (currState == "q28" && tape.charAt(headPos) == '*') command("q28", 'Z', true);
  else if (currState == "q28" && tape.charAt(headPos) == 'E') command("q29", 'Z', true);
  else if (currState == "q29" && tape.charAt(headPos) == '0') command("q29", '1', true);
  else if (currState == "q29" && tape.charAt(headPos) == B) command("q30", 'A', true);
  else if (currState == "q30" && tape.charAt(headPos) == B) command("q31", 'E', false);
  else if (currState == "q31" && tape.charAt(headPos) == '0') command("q31", '1', false);
  else if (currState == "q31" && tape.charAt(headPos) == 'Z') command("q25", 'Z', false);
  else if (currState == "q32" && tape.charAt(headPos) == B) command("q33", B, false);
  else if (currState == "q33" && tape.charAt(headPos) == 'E') command("q33", 'Z', false);
  else if (currState == "q33" && tape.charAt(headPos) == '1') command("q33", '0', false);
  else if (currState == "q33" && tape.charAt(headPos) == 'A') command("q33", '+', false);
  else if (currState == "q33" && tape.charAt(headPos) == 'S') command("q34", 'S', true);
  else if (currState == "q34" && tape.charAt(headPos) == B) command("q35", B, false);
  else if (currState == "q35" && tape.charAt(headPos) == '+') command("q35", 'Z', false);
  else if (currState == "q35" && tape.charAt(headPos) == '0') command("q36", '0', false);
  else if (currState == "q36" && tape.charAt(headPos) == 'S') command("q37", 'S', true);
  else if (currState == "q37" && tape.charAt(headPos) == B) command("q38", 'A', false);
  else if (currState == "q38" && tape.charAt(headPos) == '0') command("q39", 'Z', true);
  else if (currState == "q38" && tape.charAt(headPos) == '+') command("q38", 'Z', false);
  else if (currState == "q38" && tape.charAt(headPos) == 'S') command("q41", 'X', false);
  else if (currState == "q39" && tape.charAt(headPos) == B) command("q40", '0', false);
  else if (currState == "q40" && tape.charAt(headPos) == 'A') command("q38", 'A', false);
  else if (currState == "q41" && tape.charAt(headPos) == 'S') command("q42", 'X', true);
  else if (currState == "q42" && tape.charAt(headPos) == 'Z') command("q42", 'X', true);
  else if (currState == "q42" && tape.charAt(headPos) == 'A') return true;
  return false;
}

void command(String nState, char toWrite, boolean hR) {
  currState = nState;
  String nTape = tape.substring(0, headPos) + toWrite + tape.substring(headPos+1);
  tape = nTape;
  if (hR) headRight = true; 
  else headRight = false;
}

void keyPressed() {
  if (key == ' ') pause = !pause;
  if (key == 'w') delay += 100;
  if (key == 's' && delay >= 100) delay -= 100;
}
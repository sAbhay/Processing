float rot = 0.3;

void setup()
{

size(500,500);
noStroke();
rectMode(CENTER);

}

void draw()
{
background(0,0,0);
pushMatrix();
translate(250,250);
rotate(rot);
stroke(255,255,0);
fill(255,128,0);
ellipse(0,0,500,500);
stroke(74,207,247);
fill(128,255,0);
rect(0,0,150,150);
fill(255,12,28);
ellipse(0,0,150,150);
fill(0,255,100);
strokeWeight(20);
stroke(100,255,50);
//Diagonal lines
line(-450,450,450,-450);
line(-450,-450,450,450);
stroke(255,255,255);
//Vertical and horizantal lines
line(0,450,0,-450);
line(-450,0,450,0);
popMatrix();
rot++;
}
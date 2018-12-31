PImage img;
PImage img1;

int x1=0;
int y1=0;
int x2=0;
int y2=0;

void setup()

{
smooth(-100);
  
 size(1000,500); 
  rectMode(CENTER);
  imageMode(CENTER);
img = loadImage("azazel.png");
img1 = loadImage("Background.png");

}

void draw()

{
  background(0);
  
  translate(500,250);
    
if(keyPressed)
    
{
  if (key == CODED){
  
    if (keyCode == UP)
    y2+=-5;
    
  if (keyCode == DOWN)
    y2+=5;
    
    if (keyCode == LEFT)
    x2+=-5;
    
    if (keyCode == RIGHT)
    x2+=5;
  }
  
  if(key=='w'){
   y1+=-3.5; }

  if(key=='s'){
   y1+=3.5; }

if(key=='a'){
   x1+=-3.5;}
   
   if(key=='d'){
   x1+=3.5; }
   
}

   image(img1,0,0,1000,500);
  image(img,x1,y1,100,100);

noFill();
stroke(255,0,0);
strokeWeight(25);
ellipse(x2,y2,200,200);

}
int screenState;

void setup()
{
  size(750, 1334);
  
  textAlign(CENTER);
  rectMode(CENTER);
}

void draw()
{ 
  if(screenState == 0)
  {
    rect(375, 80, 300, 50, 7);
    textSize(32); 
    text("Select a Sport", 375, 100);
  }
  
  if(screenState == 1)
  {
   background(0); 
  }
}

void button(int x1, int y1, int w, int h, int s)
{
   rect(x1, y1, w, h);
   
   if(mousePressed)
   {
    if(mouseX >= (x1 - w/2) && mouseX <= (x1 + w/2) && mouseY >= (y1 - h/2) && mouseY <= (y1 + h/2))
    {
      screenState = s; 
    }
   }
}
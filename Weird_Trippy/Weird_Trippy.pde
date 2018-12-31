int screenState;
int selectedItem;

void setup()
{
  fullScreen(); 
  textAlign(CENTER);
}

void draw()
{
  if (screenState == 0)
  { 
    background(0);
    
    textSize(96);
    text("More Circles",width/2, 200);
    
    for (int z = 300; z > 0; z-=5)
     {
       fill(random(255),random(255),random(255));
       stroke(random(255),random(255),random(255));
       ellipse(300, 600, z, z);
     }
    
    textSize(32);
    
    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Trippy", width/2, 525);
    fill(255);

    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Plain", width/2, 625);
    fill(255);
  }

  if (screenState == 1)
  { 
    background(0);

    for (int x = 0; x < 216; x++)
    {
      for (int y = 0; y < 91; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          stroke(random(255), random(255), random(255));
          fill(random(255), random(255), random(255));
          ellipse(x*z*10, y*z*10, z*2, z*2);
        }
      }
    }
  }

  if (screenState == 2)
  {
    background(0);

    for (int x = 0; x < 216; x++)
    {
      for (int y = 0; y < 91; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          fill(255);
          stroke(0);
          ellipse(x*z*10, y*z*10, z*2, z*2);
        }
      }
    }
  }
}

void keyPressed()
{ 
  if (screenState == 0)
  {
    if (key==CODED)
    {
      if (keyCode==UP)
      {
        selectedItem--;
      }

      if (keyCode==DOWN)
      {
        selectedItem++;
      }
    }
    if(key==ENTER)
    {
     if(selectedItem == 0) 
     {
      screenState = 1; 
     }
     
     if(selectedItem == 1)
     {
       screenState = 2;
     }
    }
  }
  
  if(screenState == 1||screenState == 2)
  {
   if(key == ESC)
   {
    key = 0;
    screenState = 0; 
   }
  }
}
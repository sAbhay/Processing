PImage logo;

int screenState = 0;
int selectedItem = 0;

  float x = 400;
  float y = 750;

  boolean leftPressed;
  boolean rightPressed;
  
  float shotX = x;
  float shotY = y - 60;

void setup()
{
  size(800, 800);
  logo = loadImage("galaga.png");
  
  imageMode(CENTER);
  logo.resize(600, 400);

}

void draw()
{

  background(0);
  
  if (screenState == 0)
  {
    image(logo, 400, 250);

    textAlign(CENTER);
    textSize(40);
    fill(255);

    //PLAY GAME
    if (selectedItem == 0)
    {
      fill(0, 255, 0);
    }

    text("Play Game", 400, 550);
    fill(255);

    //OPTIONS
    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }


    text("Options", 400, 610);
    fill(255);

    //EXIT
    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }

    text("Exit", 400, 670);
    fill(255);
  }
  
  if(screenState == 1)
  {
    triangle(x - 30, y, x+30, y, x, y-60);
     
    if (keyPressed)
    {
      if(key=='a')
      {
       leftPressed = true;
      }
      
      if(key=='d')
      {
       rightPressed = true; 
      }
    }
    
    if(leftPressed)
    {
     x-=5;
    }
    
    if(rightPressed)
    {
     x+=5; 
    }
  }
}
    
void keyPressed()
{
  if (key=='w')
  {
    selectedItem-=1;
  }

  if (key=='s')
  {
    selectedItem+=1;
  }

  if (selectedItem>2)
  {
    selectedItem=0;
  }

  if (selectedItem<0)
  {
    selectedItem=2;
  }

  if (key==ENTER)
  {
    if (selectedItem==0)
    {
      screenState = 1;
    }

    if (selectedItem==2)
    {
      exit();
    }
  }
}

void keyReleased()
{
 if(key=='a')
 {
  leftPressed = false;
 }
 
 if(key=='d')
 {
  rightPressed = false;
 }
}
int[] conga = new int[10];

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;

void setup()
{
 fullScreen();
 
 for(int i = 0; i < 90; i+=10)
 {
  conga[i/10] = i; 
 }
}

void draw()
{
  background(0);
  
  for(int i = 0; i < 9; i++)
  {
    conga[i] += 5;
    
    ellipse(conga[i], height/2, 10, 10);
  }
}

void keyPressed()
{
 if (key=='w')
  {
    upPressed = true;
  }

  if (key=='s')
  {
    downPressed = true;
  }

  if (key=='a')
  {
    leftPressed = true;
  }

  if (key=='d')
  {
    rightPressed = true;
  } 
}

void keyReleased()
{
 if (key=='w')
  {
    upPressed = false;
  }

  if (key=='s')
  {
    downPressed = false;
  }

  if (key=='a')
  {
    leftPressed = false;
  }

  if (key=='d')
  {
    rightPressed = false;
  } 
}
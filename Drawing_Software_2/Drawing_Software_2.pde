import java.awt.*;

float size = 10;

float r = 255;
float g = 255;
float b = 255;

int brushMode = 0;

boolean[] dropDown = new boolean[5];

PImage img;
PImage screenshot;

void setup()
{
  fullScreen();
  rectMode(CENTER);
  textAlign(CENTER);

  for (int i = 0; i < dropDown.length; i++)
  {
    dropDown[i] = false;
  }
  
  background(255);
  
  img = loadImage("pic.png");
  img.resize((int) (1.2*img.width), (int) (1.2*img.height));
  
  image(img, width/2, height/3);
}

void draw()
{ 
  if (mousePressed)
  {
    switch(brushMode)
    {
    case 0:
      strokeWeight(size);
      stroke(r, g, b);
      line(mouseX, mouseY, pmouseX, pmouseY);
      strokeWeight(1);
      break;

    case 1:
      noStroke();
      fill(r, g, b);
      ellipse(mouseX, mouseY, size, size);
      break;

    case 2:
      noStroke();
      fill(r, g, b);
      rect(mouseX, mouseY, size, size);
      break;
    }
  }

  stroke(2);
  fill(255);
  rect(135, height/2, 270, height);

  fill(r, g, b);
  rect(135, 200, size, size);

  fill(255);
  rect(130, 15, 260, 10);
  fill(r, 0, 0);
  ellipse(r, 15, 10, 10);

  fill(255);
  rect(130, 30, 260, 10);
  fill(0, g, 0);
  ellipse(g, 30, 10, 10);

  fill(255);
  rect(130, 45, 260, 10);
  fill(0, 0, b);
  ellipse(b, 45, 10, 10);

  line(270, 0, 270, height);
  
  dropDownButton(135, 300, 10, 0, "Preset Colours");
  dropDownButton(135, 500, 10, 1, "Brush Mode");
  //dropDownButton(135, 700, 20, 2, "Undecided");
  
  if(dropDown[0])
  {
   colourButton(30, 330, 15, 15, 255, 0, 0); 
   colourButton(45, 330, 15, 15, 0, 255, 0);
   colourButton(60, 330, 15, 15, 0, 0, 255);
  }

  if (keyPressed)
  {
    if (size!=0)
    {
      if (key=='w')
      {
        size++;
      }

      if (key=='s')
      {
        size--;
      }
    }

    if (size==0)
    {
      size=1;
    }

    if (key=='r')
    {
      r++;
    }

    if (key=='g')
    {
      g++;
    }

    if (key=='b')
    {
      b++;
    }

    if (key=='R')
    {
      r--;
    }

    if (key=='G')
    {
      g--;
    }

    if (key=='B')
    {
      b--;
    }

    if (key=='e')
    {
      r = 255;
      g = 255;
      b = 255;

      size = 100;
    }
  }

  if (r>255)
  {
    r = 255;
  }

  if (g>255)
  {
    g = 255;
  }

  if (b>255)
  {
    b = 255;
  }

  if (r<0)
  {
    r = 0;
  }

  if (g<0)
  {
    g = 0;
  }

  if (b<0)
  {
    b = 0;
  }

  if (size>250)
  {
    size = 250;
  }
}

void keyPressed()
{
  if (key == BACKSPACE)
  {
    background(255);

    r = 255;
    g = 255;
    b = 255;

    size = 100;
    
    //rectMode(CORNER);
    //stroke(0);
    //rect(width/2 - 1, height/3 - 1, img.width + 2, img.height + 2);
    //noStroke();
    //rectMode(CENTER);
   
    image(img, 270, 0);
  }
}

void colourButton(float x, float y, float w, float h, float _r, float _g, float _b)
{
  fill(_r, _g, _b);
  rect(x, y, w, h);

  if (mousePressed)
  {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
    {
      r = _r;
      g = _g;
      b = _b;
    }
  }
}

void brushButton(float x, float y, float size, int number)
{
  fill(0);
  ellipse(x, y, size, size);
  fill(255);
  text(number, x, y + size/4);

  if (mousePressed)
  {
    if (dist(mouseX, mouseY, x, y) <= size/2)
    {
      brushMode = number;
    }
  }
}

void dropDownButton(float x, float y, float size, int number, String text)
{
  if (dropDown[number])
  {
    fill(0);
  } else
  {
    fill(255);
  }

  ellipse(x + 100, y, size, size);

  fill(0);
  text(text, x, y + size/4);

  if (mousePressed)
  {
    if (dist(mouseX, mouseY, x + 100, y) < size/2)
    {
      if (dropDown[number] == false)
      {
        dropDown[number] = true;
      } else if (dropDown[number])
      {
        dropDown[number] = false;
      }
    }
  }
}
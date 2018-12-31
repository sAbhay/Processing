class star
{
  
  float x;
  float y;
  float z;
  
  float r;
  float g;
  float b;
  
  float size;
  
  float temp;
  
  star()
  {
    x = random(-2500, 2500);
    y = random(-2500, 2500);
    z = random(-2500, 2500);
    
    temp = random(2500, 40000);
    
    size = random(5);
    
    if (temp >= 2500 && temp < 3400)
    {
      r = random(200, 255);
      g = random(50);
      b = 0;
    }
    
    if (temp >= 3400 && temp < 4800)
    {
      r = random(200, 255);
      g = random(50, 150);
      b = 0;
    }

    if (temp >= 4800 && temp < 6000)
    {
      r = random(200, 255);
      g = random(50, 200);
      b = 0;
    }

    if (temp >= 6000 && temp < 7500)
    {
      r = random(200, 255);
      g = random(200, 255);
      b = 0;
    }
    
    if (temp >= 7500 && temp < 10700)
    {
      r = random(225, 255);
      g = random(225, 255);
      b = random(100, 200);
    }
    
    if (temp >= 10700 && temp < 19000)
    {
      r = 255;
      g = 255;
      b = 255;
    }
    
    if (temp >= 19000 && temp < 28600)
    {
      r = random(100, 200);
      g = random(100, 200);
      b = 255;
    }
    
    if (temp >= 28600 && temp < 36000)
    {
      r = random(100, 200);
      g = 255;
      b = random(100, 200);
    }
  }
  
  void display()
  {
    pushMatrix();
    
    translate(x, y, z);
    stroke(r, g, b);
    fill(r, g, b);
    sphere(size);
    
    popMatrix();
  }
}
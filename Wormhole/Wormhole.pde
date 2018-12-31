void setup()
{
 size(600,600); 
}

void draw()
{
  background(0);
  
     for (int z = 600; z > 0; z-=5)
     {
       fill(random(255),random(255),random(255));
       stroke(random(255),random(255),random(255));
       ellipse(300, 300, z, z);
     }
}
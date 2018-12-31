class Cell
{
  int x;
  int y;
  int Width;
  int Height;
  boolean[] walls = {true, true, true, true};
  boolean start;
  boolean end;
  
 Cell(int _x, int _y, int _Width, int _Height)
 {
  x = _x;
  y = _y;
  Width = _Width;
  Height = _Height;
 }
 
 void display(int identifier)
 {
  point(x, y);
  point(x + Width, y);
  point(x, y + Height);
  point(x + Width, y + Height);
  
  if(walls[0]) line(x, y, x + Width, y);
  if(walls[1]) line(x + Width, y, x + Width, y + Height);
  if(walls[2]) line(x , y + Height, x + Width, y + Height);
  if(walls[3]) line(x, y, x, y + Height);
  
  fill(0);
  text(identifier, x + 5, y + 15);
  
  if (end)
    {
      fill(0, 255, 0);
      noStroke();
      rect(x + Width/5, y + Height/2.75, Width/3, Height/4);
      triangle(x + Width/2, y + 4*Height/5, x + Width/2, y + Height/5, x + 4*Width/5, y + Height/2);  
    }

    if (start)
    {
      fill(255, 0, 0);
      noStroke();
      ellipse(x + Width/2, y + Height/2, Height/2, Height/2);
    }
 }
}
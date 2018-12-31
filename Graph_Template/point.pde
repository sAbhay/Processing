class Point
{
  PVector pos;
  PVector index;
  int size;
  
  Point(PVector in, int s, PVector scale)
  {
    pos = new PVector(index.x * scale.x, index.y * scale.y);
    size = s;
  }
  
  void display()
  { 
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, size, size);
  }
}
class Piece
{
  PVector pos;
  int size;
  color c;

  PVector prev;

  Piece(int x, int y, int z, int _size)
  {
    size = _size;

    pos = new PVector(x * size, y * size, z * size);

    c = color(random(255), random(255), random(255));
    
    prev = new PVector();
  }

  void display(int i)
  {
    pushMatrix();

    translate(pos.x, pos.y, pos.z);

    fill(c);
    box(size);

    fill(0);
    text(i, 0, 0);

    popMatrix();
  }
  
  void setPrev(PVector p)
  {
    prev = p;
  }
}
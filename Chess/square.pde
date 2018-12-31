class Cell
{
  int x;
  int y;

  float size;
  int colour = 0;

  Cell(int _x, int _y, float _size)
  {
    x = _x;
    y = _y;

    size = _size;
  }

  void display()
  {
    fill(colour);
    rect(x, y, size, size);
  }
}
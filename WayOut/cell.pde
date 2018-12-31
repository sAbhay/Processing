class Cell
{
  boolean red;
  float size;

  float x;
  float y;

  int indexUp;
  int indexSide;

  Cell(float _x, float _y, float _size, boolean _state, int _indexUp, int _indexSide)
  {
    size = _size;

    x = _x;
    y = _y;

    red = _state;

    indexUp = _indexUp;
    indexSide = _indexSide;
  }

  void display()
  {
    if (red) 
    {
      fill(255, 0, 0);
    } else 
    {
      fill(255);
    }

    rect(x, y, size, size, 100);

    fill(0);
  }

  void change()
  {
    if (red) red = false;
    else if (!red) red = true;
  }
}
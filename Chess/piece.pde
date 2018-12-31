class Piece
{
  int x;
  int y;

  int size;
  boolean red;
  String type;

  Piece(int _x, int _y, int _size, boolean _red, String _type)
  {
    x = _x;
    y = _y;

    size = _size;
    red = _red;
    type = _type;
  }

  void display()
  {
    if (red)
    {
      fill(255, 0, 0);
    } 
    
    if (red == false)
    {
      fill(0, 255, 0);
    }

    ellipse(x, y, cellSize/2, cellSize/2);
    
    fill(0, 0, 255);
    textSize(30);
    text(type, x, y + cellSize/10);
  }
  
  void showPiece()
  {
    
  }
}
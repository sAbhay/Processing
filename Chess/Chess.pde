int gridWidth = 8;
int gridHeight = 8;

int gridArea = gridHeight * gridWidth;

int cellSize;

ArrayList<Cell> c = new ArrayList<Cell>();
ArrayList<Pawn> pawn = new ArrayList<Pawn>();
ArrayList<Rook> rook = new ArrayList<Rook>();

int[] pawnPos = new int[pawn.size()];
int[] rookPos = new int[rook.size()];

void setup()
{
  fullScreen();
  textAlign(CENTER);

  cellSize = height/gridHeight;

  for (int i = 0; i < gridWidth; i++)
  {
    for (int j = 0; j < gridHeight; j++)
    {
      c.add(new Cell(cellSize*i, cellSize*j, cellSize));
    }
  }

  for (int i = 0; i < gridArea; i++)
  {
    if (pawn.size() < 16)
    {
      if (i % gridHeight == 1)
      {
        pawn.add(new Pawn(c.get(i).x + cellSize/2, c.get(i).y + cellSize/2, cellSize/2, true, "P"));
      }

      if (i % gridHeight == gridHeight - 2)
      {
        pawn.add(new Pawn(c.get(i).x + cellSize/2, c.get(i).y + cellSize/2, cellSize/2, false, "P"));
      }
    }
  }

  for (int i = 0; i < rook.size(); i++)
  {
    if (rook.size() < 4)
    {
      if (i % gridHeight == 0)
      {
        if (i % gridWidth == 0 || i % gridWidth == gridWidth - 1)
        {
          rook.add(new Rook(c.get(i).x + cellSize/2, c.get(i).y + cellSize/2, cellSize/2, true, "R"));
        }
      }

      if (i % gridHeight == gridHeight - 1)
      {
        if (i % gridWidth == 0 || i % gridWidth == gridWidth - 1)
        {
          rook.add(new Rook(c.get(i).x + cellSize/2, c.get(i).y + cellSize/2, cellSize/2, true, "R"));
        }
      }
    }
  }
}

void draw()
{
  for (int i = 0; i < gridArea; i++)
  {
    if ((i/gridHeight) % 2 == 0)
    {
      if (i % 2 == 0)
      {
        c.get(i).colour = 255;
      }
    } else if ((i/gridHeight) % 2 == 1)
    {

      if (i % 2 == 0) 
      {
        c.get(i+1).colour = 255;
      }
    }
    c.get(i).display();
  }

  for (int i = 0; i < pawn.size(); i++)
  {
    pawn.get(i).display();
  }

  for (int i = 0; i < rook.size(); i++)
  {
    rook.get(i).display();
  }
}
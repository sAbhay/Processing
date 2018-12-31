int gridWidth = 16;
int gridHeight = 10;
int gridArea = gridWidth * gridHeight;

int cellHeight;
int cellWidth;

ArrayList<Cell> c = new ArrayList<Cell>();

void setup()
{
 fullScreen(); 
 
 cellHeight = height/gridHeight;
 cellWidth = width/gridWidth;
 
 for(int i = 0; i < gridWidth; i++)
 {
  for(int j = 0; j < gridHeight; j++)
  {
    c.add(new Cell(width/gridWidth * i, height/gridHeight * j, cellWidth, cellHeight));
  }
 }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < gridArea; i++)
  { 
    int j = (int) random(i);
    int chooser = (int) random(4);
    
    switch(chooser)
    {
     case 0:
     c.get(j).walls[0] = false;
     break;
     
     case 1:
     c.get(j).walls[1] = false;
     break;
     
     case 2:
     c.get(j).walls[2] = false;
     break;
     
     case 3:
     c.get(j).walls[3] = false;
     break;
     
     
    }
    
    c.get(i).display(i);
  }
  
  println(c.size());
}
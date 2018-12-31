PrintWriter p;
int size = 273;

void setup()
{
  p = createWriter("mycolony.txt");
  
  p.println(size);
  p.println(size);
  
  for(int i = 0; i < size; i++)
  {
    String line = "";
    for(int j = 0; j < size; j++) line += "-";
    
    line = line.substring(0, i) + 'X' + line.substring(i+1);
    line = line.substring(0, size-i-1) + 'X' + line.substring(size-i);
    
    p.println(line);
  }
  
  p.flush();
  p.close();
}

void draw()
{
  
}
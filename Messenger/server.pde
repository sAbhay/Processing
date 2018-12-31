void startServer()
{
  if(!start)
  {
    s = new Server(this, 12345);
    start = true;
  }
  
  if(name == null)
  {
    text("Please enter a name", width/2, height/2);
  }
}

void sendServer()
{
  if(name != null)
  {
   s.write(name + ": " + message); 
  }
}

void receiveServer()
{
  c = s.available();
  
  if(c != null)
  {
    input = c.readString();
    
    s.write(input);
  }
}
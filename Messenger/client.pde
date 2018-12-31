void startClient()
{
  if(!connected)
  {
    text("Please enter an IP", width/2, height/2);
  }
  
  if(connected && name == null)
  {
    text("Please enter a name", width/2, height/2);
  }
}

void sendClient()
{
  if(connected && name != null)
  {
    c.write(name + ": " + message);
  }
  
  if(!connected)
  {
    c = new Client(this, message, 12345);
    connected = true;
  }
  
  if(connected && name == null)
  {
    name = message;
  }
}

void receiveClient()
{
  if(connected)
  {
   if(c.available() != 0)
   {
    input = c.readString(); 
   }
  }
}
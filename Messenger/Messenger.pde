import processing.net.*;

StringList m = new StringList();
String message = "";

Client c;
Server s;

boolean connected;
boolean client, server, start;

String name;
String input;

void setup()
{
  fullScreen(P2D);
}

void draw()
{
  background(255);

  fill(0);

  if (!server && !client)
  {
    text("Enter 's' for Server and 'c' for Client", width/2, height/2);

    if (message.equals("s"))
    {
      server = true;
    } else if (message.equals("c"))
    {
      client = true;
    }

    message = "";
  }

  if (client)
  {
    startClient();
    receiveClient();
  }

  if (server)
  {
    startServer();
    receiveServer();
  }

  for (int i = 0; i < m.size(); i++)
  {
    text(m.get((m.size() -1) - i), width/10, height - (i+2)*height/30 - height/10, width/10);
  }

  text(message, width/10, height - height/10, width - width/10);
}

void keyPressed()
{
  message = message + key; 

  if (key == BACKSPACE)
  { 
    if (message.length() > 1) message = message.substring(0, message.length() - 2);
  }

  if (key == ENTER)
  {
    if (name != null)
    {
      m.append(message);
      message = "";

      if (client) sendClient();
      if (server) sendServer();
    } else
    {
      name = message;
    }
  }
}
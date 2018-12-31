void setup()
{
  String[] s;
  StringList fs = new StringList();
  PrintWriter output;

  s = loadStrings("data//data.txt");
  output = createWriter("data//result.txt");

  for (int i = 0; i < s.length; i++)
  {
    for (int j = 0; j < s.length; j++)
    {
      if (i != j)
      {
        if (s[i].equals(s[j])) s[i] = "";
      }
    }
    
    if(!s[i].equals("")) fs.append(s[i]);
  }

  for (int i = 0; i < fs.size(); i++)
  {
    output.println(fs.get(i));
  }

  output.close();
}

void draw()
{
}
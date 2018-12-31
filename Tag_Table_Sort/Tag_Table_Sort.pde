PrintWriter output;
BufferedReader reader;
String line;

HashMap<Integer, String> map = new HashMap();
StringList lines = new StringList();
int count = 0;

void setup()
{
  reader = createReader("text.txt");
  
  for (int i = 0; i < 30; i++)
  {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop();
    } else {
      count++;
      String tag = line.substring(line.length()-1, line.length());
      lines.append(line.substring(0, line.length()-4));

      map.put(count, tag);
    }
  }
  
  println(map);
  
  output = createWriter("output.txt");
  
  for(int i = 1; i <= 30; i++)
  {
    println(map.get(i));
    if(map.get(i).equals("D")) output.println(i + ". " + lines.get(i-1));
  }
  
  output.println(ENTER);
  
  for(int i = 1; i <= 30; i++)
  {
    if(map.get(i).equals("U")) output.println(i + ". " + lines.get(i-1));
  }
  
  output.println(ENTER);
  
  for(int i = 1; i <= 30; i++)
  {
    if(map.get(i).equals("P")) output.println(i + ". " + lines.get(i-1));
  }
  
  output.flush();
  output.close();
}

void draw()
{
  
}
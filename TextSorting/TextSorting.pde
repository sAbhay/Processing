PrintWriter output;

String[] sValues;
int[] nValues;

void setup()
{
   size(500, 500);
}

void draw()
{
  translate(0, 500);
  background(0);
  
  delay(200);
  
  output = createWriter("data\\values.txt");
  
  for(int i = 0; i < 100; i++)
   {
    output.println((int)random(0,10000));
   }
   
   output.flush();
   output.close();
   
   sValues = loadStrings("data\\values.txt");
   nValues = new int[sValues.length];
   
   for(int i = 0; i < sValues.length-1; i++)
   {
     nValues[i] = parseInt(sValues[i]);
   }
  
  for(int i = 0; i < nValues.length-1; i++)
  {
     int h = (int) map(nValues[i], 0, 10000, 0, 400);
     noStroke();
     fill(random(255), random(255), random(255));
     rect((width/100)+i*10, 0, 10, -h);
  }
}
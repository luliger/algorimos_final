PImage img;
int c = 0;
PrintWriter output, output2;
String r, g, b;
int stop = 0;

void setup(){
  img = loadImage("imagen1.png");
  output = createWriter("g1.txt");
  output2 = createWriter("b1.txt");
}

void draw(){
  background(0);
  img.loadPixels();
  img.resize(200, 0);
  
  for (int i = 0; i < img.pixels.length; i++){
    r = str(int(red(img.pixels[i])));
    g = str(int(green(img.pixels[i])));
    b = str(int(blue(img.pixels[i])));
    
    output.println(g);
    output2.println(b);
  }
  output.flush();
  output.close();
  exit();
}

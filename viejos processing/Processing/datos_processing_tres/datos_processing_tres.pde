PImage img;
int c = 0;
PrintWriter outputR, outputG, outputB, outputALL, outputIMG;
String r, g, b;

void setup(){
  img = loadImage("imagen2.png");
  outputR = createWriter("r2.txt");
  outputG = createWriter("g2.txt");
  outputB = createWriter("b2.txt");
  outputALL = createWriter("ALL2.txt");
  outputIMG = createWriter("img2.txt");
}

void draw(){
  background(0);
  img.loadPixels();
  img.resize(200, 0);
  
  for (int i = 0; i < img.pixels.length; i++){
    r = str(int(red(img.pixels[i])));
    g = str(int(green(img.pixels[i])));
    b = str(int(blue(img.pixels[i])));
    
    outputR.println(r);
    outputG.println(g);
    outputB.println(b);
    outputALL.print(r + ",");
    outputALL.print(g + ",");
    outputALL.print(b + "\n");
    outputIMG.print(r + "," + g + "," + b + ",");
    c++;
  }
  print(c);
  outputALL.flush();
  outputALL.close();
  outputR.flush();
  outputR.close();
  outputG.flush();
  outputG.close();
  outputB.flush();
  outputB.close();
  outputIMG.flush();
  outputIMG.close();
  exit();
}

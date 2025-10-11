PImage img;
int i = 0;
PrintWriter output;
String r, g, b;
int stop = 0;

void setup(){
  img = loadImage("imagen1.png");
  output = createWriter("img1.txt");
  size(400, 400);
}

void draw(){
  background(0);
  img.loadPixels();
  img.resize(200, 0);

   if (i < 30000){
    r = str(int(red(img.pixels[i])));
    g = str(int(green(img.pixels[i])));
    b = str(int(blue(img.pixels[i])));
    
    fill(int(r), int(g), int(b)); 
    rect(10, 10, 130, 130);
    fill(img.pixels[i]);
    rect(150, 10, 130, 130);
    
    //println("pixel numero:" + i);
    output.print(r); 
    output.print(",");
    output.print(g);
    output.print(",");
    output.print(b);
    output.print(",");
    //println(r, g, b);
    
    i++;
   } else {
     output.flush();
     output.close();
     exit();
   }
}

PImage img;
int i = 0;
int r, g, b;

void setup(){
  img = loadImage("color_bar_test.png");
  //img = loadImage("imagen_colores.png");
  size(400, 400);
}

void draw(){
  background(0);
  img.loadPixels();
  img.resize(200, 0);

   if (i < 30000){
   
    r = int(red(img.pixels[i]));
    g = int(green(img.pixels[i]));
    b = int(blue(img.pixels[i]));
    
    fill(int(r), int(g), int(b)); 
    rect(10, 10, 380, 380);
    
    i++;
   } else {
     exit();
  
   }
}

PImage img;
int i = 0;
int r, g, b;
color c;
int posX = 40, posY = 40;

int imgN = 0;

void setup(){
  //img = loadImage("color_bar_test.png");
  //img = loadImage("imagen_colores.png");
  //img = loadImage("imagen2.png");
  //img = loadImage("IMG_20221230_162549.jpg"); //york
  //img = loadImage("IMG_9414.JPG"); //londres
  img = loadImage("100_4082.JPG"); //cj
  
  size(800, 800);
  background(0);
}

void draw(){
  
  img.loadPixels();
  img.resize(300, 0);

   if (i < img.pixels.length){
   
    r = int(red(img.pixels[i]));
    g = int(green(img.pixels[i]));
    b = int(blue(img.pixels[i]));
    
    c = color(r, g, b);
    
    fill(c); 
    rect(posX, posY, 20, 20);
    
    i+= random(30);
    
    if (posX > width-60){
      posX = 40;
      posY += 22;
    } else {
      posX += 22;
    }
    
    if (posY > height-60){
      posY = 40;
    }
    
   } else {
     saveFrame("imagen_"+imgN+".png");
     exit();
   }
}

void keyPressed() {
  
  saveFrame("imagen_"+imgN+".png");
  imgN++;

}

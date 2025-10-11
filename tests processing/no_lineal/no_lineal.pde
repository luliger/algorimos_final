PImage img;
int i = 0;
int r, g, b;
color c;
int posX = 500, posY = 500;
int tamanioCuadrado = 25;
int distanciaCuadrados = 2;
int margen = 25;
int[] dirs = {27, -27};
int idir;

int imgN = 0;

void setup(){
  img = loadImage("IMG_20221230_162549.jpg"); //york
  //img = loadImage("IMG_9414.JPG"); //londres
  //img = loadImage("100_4082.JPG"); //cj
  
  size(1000, 1000);
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
    rect(posX, posY, tamanioCuadrado, tamanioCuadrado);
    
    
    i+= random(30);
    idir = int(random(0, 2)); 
    
    if (posX > width-(tamanioCuadrado*3)){
      posX = int(random(25, 950));
      posY += tamanioCuadrado + distanciaCuadrados;
    } else {
      posX += dirs[idir];
    }
    
    if (posY > height-(tamanioCuadrado*3)){
      posY = int(random(25, 950));
    } else {
      posY += random(25, 950);
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

PImage img;
int i = 0;
int r, g, b;
color c;

int margen = -5;
int posX, posY = margen;
int nroColumna = 0;
int nroFila= 0;
int tamanioMatriz = 42;
int tamanioCuadrado = 25;
int distanciaCuadrados = 0;


int size = 25;

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
    
    noStroke();
    fill(0, 50); 
    rect(posX-1, posY-1, size+6, size+6);
    
    fill(c); 
    rect(posX, posY, size, size);
    nroColumna++;
    
    size = 25 + int(random(-10, 10));
    
    i+= random(30);
    
    if (nroColumna > tamanioMatriz){
      posX = margen;
      posY += tamanioCuadrado + distanciaCuadrados;
      nroColumna = 0;
      nroFila++;
    } else {
      posX += tamanioCuadrado + distanciaCuadrados;
    }
    
    if (nroFila > tamanioMatriz){
      posY = margen;
      nroFila = 0;
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

PImage img;
int i = 0;
int r, g, b;
color c;
int posX = 25, posY = 25;
int nroColumna = 0;
int nroFila= 0;
int tamanioMatriz = 34;
int tamanioCuadrado = 25;
int distanciaCuadrados = 2;
int margen = 25;

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
    nroColumna++;
    
    
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

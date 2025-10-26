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
  //img = loadImage("../fotos/ushuaia1.JPG");
  //img = loadImage("../fotos/ushuaia2.JPG");
  //img = loadImage("../fotos/ushuaia3.JPG");
  
  //img = loadImage("../fotos/untref1.JPG");
  
  img = loadImage("../fotos/york.jpg");
  
  size(1000, 1000);
  background(0);
  
  img.loadPixels();
  img.resize(300, 0);
}

void draw(){

   if (i < img.pixels.length){
   
    r = int(red(img.pixels[i]));
    g = int(green(img.pixels[i]));
    b = int(blue(img.pixels[i]));
    
    c = color(r, g, b);
    
    noStroke();
    fill(0, 60); 
    rect(posX-2, posY-4, size+10, size+10);
    
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
      saveFrame("imagen_"+imgN+".png");
      imgN++;
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

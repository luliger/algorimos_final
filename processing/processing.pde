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
  
  //se carga la imagen
  
  //img = loadImage("../fotos/ushuaia1.JPG");
  //img = loadImage("../fotos/ushuaia2.JPG");
  //img = loadImage("../fotos/ushuaia3.JPG");
  img = loadImage("../fotos/york.jpg");
  
  //se define el tamaño del canvas y el color del fondo
  size(1000, 1000);
  background(0);
  noStroke();
  
  //se cambia el tamanio de la imagen y se cargan los pixeles de la misma en un array
  img.resize(300, 0);
  img.loadPixels();
  
}

void draw(){
  
  //para recorrer el array de pixeles
   if (i < img.pixels.length){
    
    //se guardan en variables los valores de r, g y b del pixel i
    r = int(red(img.pixels[i]));
    g = int(green(img.pixels[i]));
    b = int(blue(img.pixels[i]));
    
    //se guardan esas tres variables en una variable del tipo color
    c = color(r, g, b);
    
    //se dibuja la sombra que va a quedar detras del cuadrado
    fill(0, 60); 
    rect(posX-2, posY-4, size+10, size+10);
    
    //se dibuja el cuadrado
    fill(c); 
    rect(posX, posY, size, size);
    
    //se aumenta el numero de columna en el que estamos posicionadas
    nroColumna++;
    
    //se cambia el tamanio para el proximo cuadrado, aleatorio entre 15 y 35
    size = tamanioCuadrado + int(random(-10, 10));
    
    //se aumenta el indice de recorrido del array de pixeles, en un valor aleatorio entre 1 y 30
    i+= random(1, 31);
    
    //aca se determina la proxima posicion donde se dibujara un cuadrado
    
    //si se llego al extremo derecho del canvas, se resetea la posicion en X a la izquieda de todo, y se aumenta en el valor correspondiente al alto de la fila la posicion en Y
    //si aun no se llego al extremo derecho del canvas, se aumenta la posicion en X y se mantiene en Y
    if (nroColumna > tamanioMatriz){
      posX = margen;
      posY += tamanioCuadrado + distanciaCuadrados;
      nroColumna = 0;
      nroFila++;
    } else {
      posX += tamanioCuadrado + distanciaCuadrados;
    }
    
    //si la posicion en Y excede el tamaño del canvas, se resetea la posicion en Y, y se guarda la imagen actual del canvas
    if (nroFila > tamanioMatriz){
      posY = margen;
      nroFila = 0;
      saveFrame("imagen_"+imgN+".png");
      imgN++;
    }
    
   } else {
     //cuando se llega al final del array de pixeles, se guarda la imagen actual de canvas y se cierra el programa
     saveFrame("imagen_"+imgN+".png");
     exit();
   }
}

void keyPressed() {
  //cuando se presiona una tecla, se guarda la imagen actual del canvas
  saveFrame("imagen_"+imgN+".png");
  imgN++;

}

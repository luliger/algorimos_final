PImage img;
int i = 0;
int r, g, b;
color c;
int pos = 612;
int tamanioCuadrado = 25;
int distanciaCuadrados = 2;
int margen = 25;

int imgN = 0;

int[][] posiciones;

int n = 0;
Boolean[] ocupados = new Boolean[1225];

void setup() {
  //img = loadImage("IMG_20221230_162549.jpg"); //york
  //img = loadImage("IMG_9414.JPG"); //londres
  img = loadImage("100_4082.JPG"); //cj

  size(1000, 1000);
  background(0);

  posiciones = generarMatriz();
  ocupados = llenarArrayFalse(ocupados);
  
  img.loadPixels();
  img.resize(300, 0);
}

void draw() {

  

  if (i < img.pixels.length) {

    r = int(red(img.pixels[i]));
    g = int(green(img.pixels[i]));
    b = int(blue(img.pixels[i]));

    c = color(r, g, b);

    fill(c);
    
    if (n < 1224){
      while (ocupados[pos] == true) {
        pos = int(random(1225));
      } 
    } else {
      n = 0;
      ocupados = llenarArrayFalse(ocupados);
      saveFrame("imagen_"+imgN+".png");
      imgN++;
      pos = int(random(1225));
    }
    
    rect(posiciones[pos][0], posiciones[pos][1], tamanioCuadrado, tamanioCuadrado);
    
    i+=10;
    
    n++;
    
    ocupados[pos] = true;
    pos = int(random(1225));
    
    
  } else {
    saveFrame("imagen_"+imgN+".png");
    exit();
  }
}

void keyPressed() {

  saveFrame("imagen_"+imgN+".png");
  imgN++;
}

int[][] generarMatriz() {

  int[][] posiciones = new int[1225][2];
  int nroColumna = 1;
  int nroFila = 1;
  int tamanioMatriz = 34;
  int x, y;

  x = 25;
  y = 25;

  for (int i = 0; i < 1225; i++) {

    if (nroColumna > tamanioMatriz) {
      nroColumna = 0;
      nroFila++;
      posiciones[i][0] = x;
      posiciones[i][1] = y;
      x = margen;
      y+=(tamanioCuadrado+distanciaCuadrados);
    } else if (nroFila > tamanioMatriz+1) {
      //print("done");
      i = 1300;
    } else {
      posiciones[i][0] = x;
      posiciones[i][1] = y;
      x+=(tamanioCuadrado+distanciaCuadrados);
    }

    nroColumna++;
  }

  return posiciones;
}

Boolean[] llenarArrayFalse(Boolean[] array){

  for (int i = 0; i < array.length; i++) {
    array[i] = false;
  }
  
  return array;

}

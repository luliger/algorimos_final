import processing.serial.*;  //ESTO DE ACÁ SASHA
Serial myPort; //ESTO DE ACÁ SASHA

int d;
int cambio;

float s = 35;           //definimos la variable del tamaño de los pixeles, y la inicamos en el máximo valor que va a tomar
float sMapped = 20;
PImage img, img1, img2, img3, img4, img5; //variables que van a contener las imagenes

int ind = 0; 
int prevCambio = cambio; //ESTO DE ACÁ SASHA

int end = 10; //ESTO DE ACÁ SASHA
String receivedString; //ESTO DE ACÁ SASHA

void setup(){
    noCursor();
    fullScreen();
    //ESTO DE ACÁ SASHA
    myPort = new Serial(this, "COM6", 9600); //inicializamos comunicación con el puerto serial
    myPort.clear();
    receivedString = myPort.readStringUntil(end); //cargamos lo recibido a una vaiable string
    receivedString = null;
    // HASTA ACÁ (sigue en el loop)
    
   //size(1000, 800);
    noStroke();
    img1 = loadImage("1.png");
    img2 = loadImage("2.png");
    img3 = loadImage("3.png");      //cargamos las imagenes a las variables que les corresponden
    img4 = loadImage("4.png");
    img5 = loadImage("5.png");
    
    img = img1;  //definimos inicalmente la imagen como la primera de la secuencia
}

void draw(){
    background(0);
    prevCambio = cambio;
    img.loadPixels();
    translate((width - img.width) / 2,(height - img.height) / 2); //movemos el (0,0) para centrar la imagen en la pantalla
    
    for (int x = 0; x < img.width; x += abs(sMapped)) {
        for (int y = 0; y <img.height; y += abs(sMapped)){
            int index = y * img.width + x;
            fill(img.pixels[index]);
            rect(x, y, abs(sMapped), abs(sMapped));
        }
    }
    
    
    while (myPort.available () > 0){ //ESTO DE ACÁ SASHA
      receivedString = myPort.readStringUntil(end);
  }
    if (receivedString != null) { //ESTO DE ACÁ SASHA
      String[] a = split(receivedString, ','); // acá lo divido en las comas
      s = Integer.parseInt(a[0].trim()); // y acá lo paso a int? creo
      sMapped = map(s, 25, 50, 0, 35); 
      if (sMapped < 1 && sMapped > -1){
        sMapped = -3;
      } 
      cambio = Integer.parseInt(a[1].trim());
    }
    
    if (cambio == 1 && cambio != prevCambio){
      println("Cambio de imagen.");
      ind += 1;
      if (ind == 0){img = img1;} if (ind == 1){img = img2;} if (ind == 2){img = img3;} if (ind == 3){img = img4;} if (ind == 4){img = img5;}
      if (ind == 4){
        ind = -1;
      }
    }
       
}

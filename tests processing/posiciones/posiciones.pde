int i = 0;
int stop = 0;
int x, y;
int[][] posiciones = new int[1296][2];
int nroColumna = 0;
int nroFila= 0;
int tamanioMatriz = 34;
int tamanioCuadrado = 25;
int distanciaCuadrados = 2;
int margen = 25;

void setup(){

  size(1000, 1000);
  background(0);
  
  x = 25;
  y = 25;
  
  posiciones[0][0] = x;
  posiciones[0][1] = y;
}

void draw(){
 
//for (int i = 0; i < 1296; i++){
    rect(posiciones[i][0], posiciones[i][1], tamanioCuadrado, tamanioCuadrado);
    nroColumna++;
    i++;
    
    if (nroColumna > tamanioMatriz){
      x = margen;
      y+=(tamanioCuadrado+distanciaCuadrados);
      nroColumna = 0;
      nroFila++;
      posiciones[i][0] = x;
      posiciones[i][1] = y;
    } else if (nroFila > tamanioMatriz){
      print("done");
      delay(5000);
      exit();
    } else {
      x+=(tamanioCuadrado+distanciaCuadrados);
      posiciones[i][0] = x;
      posiciones[i][1] = y;
    }
//  }
  if (i>1295){
  delay(5000);
  exit();
  }
}

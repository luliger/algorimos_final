int pos = 0;
int x, y;
int[][] posiciones = new int[1225][2];
int nroColumna = 1;
int nroFila = 1;
int tamanioMatriz = 34;
int tamanioCuadrado = 25;
int distanciaCuadrados = 2;
int margen = 25;
int c = 20;

PrintWriter output;
String px, py;

void setup() {

  output = createWriter("pos.txt");
  
  size(1000, 1000);
  background(0);

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
  
}

void draw() {
  
  if (pos > 1224){
    print("bye");
    output.flush();
    output.close();
    delay(3000);
    exit();
    return;
  }
  
  px = str(posiciones[pos][0]);
  py = str(posiciones[pos][1]);
  
  output.print(str(pos)+":");
  output.print(px); 
  output.print(",");
  output.print(py);
  output.print(",\n");
  
  fill(c);
  rect(int(px), int(py), 25, 25);
  pos++;
  c++;
  
  if (c >= 255){c=20;};
}

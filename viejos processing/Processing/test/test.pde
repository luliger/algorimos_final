String[] strR, R, strG, G, strB, B;
String r, g, b;
int n = 0;
int RGoB = 0;


void setup(){
  size(400, 400);
  strR = loadStrings("r1.txt");
  R = split(strR[n], ",");
  strG = loadStrings("g1.txt");
  G = split(strG[n], ",");
  strB = loadStrings("b1.txt");
  B = split(strB[n], ",");
}

void draw(){
  //background(0);
    
  //fill(int(R[n]), int(G[n]), int(B[n]));
  //rect(10, 10, 130, 130);
  for (int i = 0; i < 30000; i++){ 
  println(int(R[i]));
  //n++;
  }
  stop();
    
}

  //for (int i = 0; i <= 2; i++){
  //  if (RGoB == 0) {
  //   r = numeros[n]; 
  //   RGoB +=1;
  //   n++;
  //  }
  //  else if (RGoB == 1) { 
  //    g = numeros[n];
  //    RGoB +=1;
  //    n++;
  //  }
  //  else if(RGoB == 2) {
  //    b = numeros[n];
  //    RGoB = 0;
  //    n++;
  //   }
  //  }

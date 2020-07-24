int maxSize = 100;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];

void setup() {
  for(int i = 0; i < numList.length; i++){
  int r = (int)random(0,100);
  numList[i] = r;
  }

  frameRate(60);
  stroke(12);
  size(1000, 500);
}

void draw() {
 background(255);
 
 for(int i = 0; i < numList.length; i++){
 line(linePx, numList[i], linePx, 5);
 stroke(126);
 linePx+=2;
 }
 
}

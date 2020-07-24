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
 linePx = 1;
 
}

private void swap(int[] a, int b, int c) {
    int d = a[b];
    a[b] = a[c];
    a[c] = d;
  }
  
  public void selection(int[] sorting) {
    int[] sorted = sorting;

    // Goes through the array, and performs a switch at the very bottom
    for (int i = 0; i < sorted.length; i++) {

      int j = 0;
      int index = -1;
      float high = sorted[i];

      // Looks for the highest from the the tested
      for (j = i; j < sorted.length; j++) {
        // If a higher value than highest is found, set the new highest value
        if (high > sorted[j]) {
          high = sorted[j];
          index = j;
        }
      }

      // Swaps the current index being compared with the highest value found
      // I had to swap both the Party array and float array at the same time
      // in order to get this to work, maybe someone can make this more efficient?
      if (index >= 0) {
        // tempP = sorted[i]; sorted[i] = sorted[index]; sorted[index] = tempP;

        // This is actually slower than the previous setup, however it will be more
        // convenient to use a method than retype code
        swap(sorted, index, i);
      }
    }
  }

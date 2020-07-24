int maxSize = 100;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
int cur = 0;
int LOG_SWAP;

void setup() {
  for (int i = 0; i < numList.length; i++) {
    int r = (int)random(0, 100);
    numList[i] = r;
  }
  frameRate(60);
  stroke(12);
  size(1020, 500);
}

void draw() {
  background(255);

  for (int i = 0; i < numList.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 10, 10, 5, numList[i] * 2);
  }
  if (checkIfSorted(numList) == false) { 
    if (cur != numList.length) {
      fill(255, 10, 10);
      rect(10 * cur + 10, 10, 5, numList[cur] * 2);
      cur++;
      BubbleSortFirst(numList);
    } else {
      cur = LOG_SWAP;
    }
  }
}

private boolean checkIfSorted(int numList[]) {
  for (int i = 0; i < numList.length; i++) {
    if (i != 0) {
      if (numList[i-1] > numList[i]) {
        return false;
      }
    }
  }
  return true;
}

private int[] BubbleSortFirst(int numList[]) {
  for (int i = 0; i < numList.length; i++) {
    if (numList[i] >= numList[i+1] && i != 100) {
      LOG_SWAP = i;
      int prev = numList[i];
      numList[i] = numList[i+1];
      numList[i+1] = prev;
      return numList;
    }
  }
  return numList;
}

/**private void swap(int[] a, int b, int c) {
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
 }*/

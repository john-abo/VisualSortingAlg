int maxSize = 100;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
int cur = 0;
int indexSwap = -1;

void setup() {
  /*
  initial population of the array
  **/
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
  if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
    if (cur < numList.length) {
      cur++;
      selectionSort(numList, cur);
    } else {
      cur = 0; //resets the red rectangle to 0;
    }
  }
  
  
  
  delay(25);
}

/**
navigates through the array, and if it's good to go then it returns true
*/
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

/**
InsertionSort Algorithm
*/
private void selection(int numList[], int startAt) {
  for (int i = 0; i < numList.length; i++) {
    if (numList[i] > numList[i+1] && i != 100) { //if i is not 100 and the current indexed value is greater then the next one they swap positions
      LOG_SWAP = i; //logs the current index that needs to be swapped
    }
  }
}

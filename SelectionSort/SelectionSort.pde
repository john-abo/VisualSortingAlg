int maxSize = 1350;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
int cur = 0;
int indexSwap = -1;
int mx = 1;

void setup() {
  frameRate(60);
  noStroke();
  //size(1350, 500);
  fullScreen();
  maxSize = width;
  numList = new int[maxSize];

  /*
  initial population of the array
   **/
  for (int i = 0; i < numList.length; i++) {
    int r = (int)random(0, height);
    numList[i] = r;
  }
  scale(1, -1);
  translate(0, -height);
}

void draw() {
  background(255);

  for (int i = 0; i < numList.length; i++) {
    fill(0, 0, 0);
    rect((width/numList.length) * i, 0, (width/numList.length), numList[i] * mx);
  }
  if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
    if (cur < numList.length ) {
      selectionSort(numList, cur);
      if (indexSwap >= 0) {
        swap();
        fill(255, 0, 0);
        rect((width/numList.length) * cur, 0, (width/numList.length), numList[indexSwap] * mx);
        rect((width/numList.length) * indexSwap, 0, (width/numList.length), numList[cur] * mx);
        //rect(10 * cur + 10, 10, 5, numList[indexSwap] * 2);
      }
    }
  }
  cur++;
  indexSwap = -1;

  delay(5);
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
 Selection Sort Algorithm
 */
private void selectionSort(int numList[], int startAt) {
  int lowest = numList[cur];
  for (int i = startAt; i < numList.length && cur < numList.length; i++) {
    if (numList[i] < lowest) { //if i is not 100 and the current indexed value is greater then the next one they swap positions
      indexSwap = i; //logs the current index that needs to be swapped
      lowest = numList[i];
    }
  }
}

private void swap() {
  if (!(indexSwap < 0)) {
    int temp = numList[cur];
    numList[cur] = numList[indexSwap];
    numList[indexSwap] = temp;
  }
}

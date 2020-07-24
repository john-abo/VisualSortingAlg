int maxSize = 100;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
int cur = 0;
int LOG_SWAP;

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
    if (cur != numList.length-1) {
      fill(255, 10, 10);
      rect(10 * cur + 10, 10, 5, numList[cur] * 2);
      if(numList[cur] > numList[cur+1]){
      BubbleSort(numList);
      cur++;//moves over to the next 
      }else{
      cur++;//moves over to the next 
      }
    } else {
      cur = 0; //resets the red rectangle to 0;
    }
  }
  delay(1000);
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
Bubble Sort Algorithm
*/
private int[] BubbleSort(int numList[]) {
 int c = numList[cur+1];
 numList[cur+1] = numList[cur];
 numList[cur] = c;
  return numList;
}

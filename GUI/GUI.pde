import controlP5.*; //<>//
import java.util.Collections;

ControlP5 cp5;
Button SS;
Button IS;
Button BrickS;
Button BubbleS;
Button Bogo;
Button RESET;
Button CHANGE;

boolean SSclick = false;
boolean ISclick = false;
boolean BrickSclick = false;
boolean BubbleSclick = false;
boolean BogoClick = false;
boolean RESETclick = false;
boolean Changeclick = false;

int maxSize = 100;
int BogoMax = 7;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
ArrayList<Integer> numListA = new ArrayList<Integer>();
int cur = 0;
int LOG_SWAP;
int click;
int indexSwap = -1;
int mx = 2;
int speed = 0;
int size = 0;
void setup() {
  /*
  initial population of the array
   **/
  for (int i = 0; i < numList.length; i++) {
    int r = (int)random(0, 100);
    numList[i] = r;
  }
  numListA = new ArrayList<Integer>();
  for (int i = 0; i < BogoMax; i++) {
    numListA.add((int)random(0, 100));
  }
  cp5 = new ControlP5(this);
  BrickS = cp5.addButton("BrickS")
    .setValue(0)
    .setPosition(0, 0)
    .setSize(75, 50)
    .setLabel("Brick Sort");

  IS = cp5.addButton("IS")
    .setValue(0)
    .setPosition(75, 0)
    .setSize(75, 50)
    .setLabel("Insertion Sort");

  BubbleS = cp5.addButton("BubbleS")
    .setValue(0)
    .setPosition(150, 0)
    .setSize(75, 50)
    .setLabel("Bubble Sort");

  SS = cp5.addButton("SS")
    .setValue(0)
    .setPosition(225, 0)
    .setSize(75, 50)
    .setLabel("Selection Sort");

  Bogo = cp5.addButton("Bogo")
    .setValue(0)
    .setPosition(300, 0)
    .setSize(75, 50)
    .setLabel("Bogo Sort");

  RESET = cp5.addButton("RESET")
    .setValue(0)
    .setPosition(945, 0)
    .setSize(75, 50)
    .setLabel("RESET - 100");

  CHANGE = cp5.addButton("CHANGE")
    .setValue(0)
    .setPosition(870, 0)
    .setSize(75, 50);

  cp5.addSlider("speed")
    .setPosition(0, 100)
    .setRange(0, 100);

  cp5.addSlider("size")
    .setPosition(921, 100)
    .setRange(10, 175);



  RESET();
  frameRate(60);
  stroke(12);
  size(1020, 500);
}

void draw() {
  background(255);
  fill(50);
  text("Speed slider", 0, 98);
  text("Max height", 921, 98);
  push();
  scale(1, -1);
  translate(0, -height);

  if (BogoClick == false) {
    for (int i = 0; i < numList.length; i++) {
      fill(0, 0, 0);
      rect(((width/numList.length) * i), 0, (width/numList.length), numList[i] * mx);
    }
  } else {
    for (int i = 0; i < BogoMax; i++) {
      fill(0, 0, 0);
      rect((width/BogoMax) * i, 0, (width/BogoMax), numListA.get(i) * mx);
    }
  }

  if (ISclick == true) {
    if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
      if (cur != numList.length) {
        fill(255, 10, 10);
        rect(((width/numList.length) * cur) + 2, 10, (width/numList.length), numList[cur] * mx);
        cur++;//moves over to the next 
        InsertionSort(numList);
        cur = LOG_SWAP; //sets the red rectangle where the index left off
      } else {
        cur = 0; //resets the red rectangle to 0;
      }
    }
  }

  if (SSclick == true) {
    if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
      if (cur < numList.length ) {
        selectionSort(numList, cur);
        if (indexSwap >= 0) {
          swap();
          fill(255, 0, 0);
          fill(255, 0, 0);
          rect((width/numList.length) * cur, 0, (width/numList.length), numList[indexSwap] * mx);
          rect((width/numList.length) * indexSwap, 0, (width/numList.length), numList[cur] * mx);
          //rect(10 * cur + 10, 10, 5, numList[indexSwap] * 2);
        }
      } else {
        //cur = 0;
      }
    }
    cur++;
    indexSwap = -1;
  }

  if (BrickSclick == true) {
    if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
      if (cur != numList.length-1 && cur != 100) {
        fill(255, 10, 10);
        rect(((width/numList.length) * cur) + 10, 10, (width/numList.length), numList[cur] * mx);
        if (numList[cur] > numList[cur+1]) {
          BubbleSort(numList);
          cur+=2;//moves over to the next
        } else {
          cur+=2;//moves over to the next
        }
      } else if (cur % 2 == 0) {
        //println(" 1 " + cur);
        cur = 1; //resets the red rectangle to 1;
      } else {
        //println(" 0 "+cur);
        cur = 0;
      }
    }
  }

  if (BubbleSclick == true) {
    if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
      if (cur != numList.length-1) {
        fill(255, 10, 10);
        rect(((width/numList.length) * cur) + 10, 10, (width/numList.length), numList[cur] * mx);
        if (numList[cur] > numList[cur+1]) {
          BubbleSort(numList);
          cur++;//moves over to the next
        } else {
          cur++;//moves over to the next
        }
      } else {
        cur = 0; //resets the red rectangle to 0;
      }
    }
  }

  if (BogoClick == true) {
    if (checkIfSorted(numListA) == false) { //checks if the list is fully sorted
      Collections.shuffle(numListA);
      println(numListA);
    }
  }

  pop();
  delay(speed);
}

/**
 navigates through the array, and if it's good to go then it returns true
 */
private boolean checkIfSorted(int numList[]) {

  for (int i = 1; i < numList.length; i++) {
    //if (i != 0) {
    if (numList[i-1] > numList[i]) {
      return false;
    }
    //}
  }
  return true;
}

private boolean checkIfSorted(ArrayList<Integer> numListA) {

  for (int i = 1; i < numListA.size(); i++) {
    //if (i != 0) {
    if (numListA.get(i-1) > numListA.get(i)) {
      return false;
    }
    //}
  }
  return true; //<>//
}

/**
 InsertionSort Algorithm
 */
private int[] InsertionSort(int numList[]) {
  for (int i = 0; i < numList.length; i++) {
    if (numList[i] > numList[i+1] && i != 100) { //if i is not 100 and the current indexed value is greater then the next one they swap positions
      LOG_SWAP = i; //logs the current index that needs to be swapped
      int prev = numList[i];
      numList[i] = numList[i+1];
      numList[i+1] = prev;
      return numList;
    }
  }
  return numList;
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

/**
 Bubble Sort Algorithm
 */
private int[] BubbleSort(int numList[]) {
  int c = numList[cur+1];
  numList[cur+1] = numList[cur];
  numList[cur] = c;
  return numList;
}

private void swap() {
  if (!(indexSwap < 0)) {
    int temp = numList[cur];
    numList[cur] = numList[indexSwap];
    numList[indexSwap] = temp;
  }
}

public void IS() {
  softReset();

  ISclick = true;
  SSclick = false;
  BrickSclick = false;
  BubbleSclick = false;
}

public void SS() {
  softReset();

  ISclick = false;
  SSclick = true;
  BrickSclick = false;
  BubbleSclick = false;
  BogoClick = false;
}

public void BrickS() {
  softReset();

  ISclick = false;
  SSclick = false;
  BrickSclick = true;
  BubbleSclick = false;
  BogoClick = false;
}

public void BubbleS() {
  softReset();

  ISclick = false;
  SSclick = false;
  BrickSclick = false;
  BubbleSclick = true;
  BogoClick = false;
}

public void Bogo() {

  ISclick = false;
  SSclick = false;
  BrickSclick = false;
  BubbleSclick = false;
  BogoClick = true;
}

public void CHANGE() {
  softReset();
  numList = new int[maxSize];
  for (int i = 0; i < numList.length; i++) {
    int r = (int)random(0, size);
    numList[i] = r;
  }
  numListA = new ArrayList<Integer>();
  for (int i = 0; i < BogoMax; i++) {
    numListA.add((int)random(0, size));
  }
}

public void softReset() {
  SSclick = false;
  ISclick = false;
  BrickSclick = false;
  BubbleSclick = false;
  BogoClick = false;
  Changeclick = false;
  cur = 0;
}

public void RESET() {
  // println("resetting");
  SSclick = false;
  ISclick = false;
  BrickSclick = false;
  BubbleSclick = false;
  BogoClick = false;
  Changeclick = false;
  maxSize = 100;
  minSize = 1;
  linePx = 1;
  numList = new int[maxSize];
  cur = 0;
  indexSwap = -1;
  mx = 2;
  for (int i = 0; i < numList.length; i++) {
    int r = (int)random(0, 100);
    numList[i] = r;
  }
  numListA = new ArrayList<Integer>();
  for (int i = 0; i < BogoMax; i++) {
    numListA.add((int)random(0, 100));
  }
}

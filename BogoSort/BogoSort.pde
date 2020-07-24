import java.util.Collections;

int maxSize = 2;
int minSize = 1;
int linePx = 1;

ArrayList<Integer> numList = new ArrayList<Integer>();

int cur = 0;
int indexSwap = -1;
int mx = 1;

void setup() {
  frameRate(60);
  noStroke();
  size(1350, 500);
  maxSize = 7;

  for(int i = 0; i < maxSize; i++) {
    numList.add((int)random(0,height));
  }

  scale(1, -1);
  translate(0, -height);
}

void draw() {
  background(255);

  for (int i = 0; i < numList.size(); i++) {
    fill(0, 0, 0);
    rect((width/numList.size()) * i, 0, (width/numList.size()), numList.get(i) * mx);
  }
  if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
    Collections.shuffle(numList);
  }
  cur++;
  indexSwap = -1;

}

/**
 navigates through the array, and if it's good to go then it returns true
 */
private boolean checkIfSorted(ArrayList<Integer> numList) {
  for (int i = 0; i < numList.size(); i++) {
    if (i != 0) {
      if (numList.get(i-1) > numList.get(i)) {
        return false;
      }
    }
  }
  return true;
}

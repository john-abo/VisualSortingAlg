int maxSize = 100;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
int[] numList1 = new int[maxSize/4];
int[] numList2 = new int[maxSize/4];
int[] numList3 = new int[maxSize/4];
int[] numList4 = new int[maxSize/4];
int cur = 0, curr = 0;
int LOG_SWAP;
double c = maxSize;
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
 
  /*for (int i = 0; i < numList.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 10, 10, 5, numList[i] * 2);
  }*/
  
  if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
    if (cur != numList.length && numList4.length != 25) {
     /*fill(255, 10, 10);
      rect(10 * cur + 10, 10, 5, numList[cur] * 2);*/
      if(cur < 25){
       numList1[curr] = numList[cur];
       curr+=1;
      }else if(cur < 50){
       numList2[curr] = numList[cur];
       curr+=1;
      }else if(cur < 75){
       numList3[curr] = numList[cur];
       curr+=1;
      }else if(cur <= 100){
       numList4[curr] = numList[cur];
       curr+=1;
      }
      if(curr == 25){
      curr = 0;
      }
      cur++;
  }else{
    
   print(numList[0]);
    print(numList1[0]);
   
    for (int i = 0; i < numList1.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 10, 10, 5, numList1[i] * 2);
   }
   for (int i = 0; i < numList2.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 250, 10, 5, numList2[i] * 2);
   }
   for (int i = 0; i < numList3.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 500, 10, 5, numList3[i] * 2);
   }
   for (int i = 0; i < numList4.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 750, 10, 5, numList4[i] * 2);
   }
  
    if(checkIfSorted(numList1) == false) {
     
      if (numList1[curr] > numList1[curr+1]) {
          MBubbleSort(numList1);
      }
        curr++;//moves over to the next
   }
  /** print("i) ");
   for(int i : numList1){
    print(i + ",");
  }*/
  print("\n");
   if (checkIfSorted(numList2) == false && checkIfSorted(numList1) == true) {
    if (numList2[curr] > numList2[curr+1]) {
          MBubbleSort(numList2);
      }
       curr++;//moves over to the next
   }
   if (checkIfSorted(numList3) == false && checkIfSorted(numList2) == true) {
     //BubbleSort(numList3);
   }
   if (checkIfSorted(numList4) == false && checkIfSorted(numList3) == true) {
      //BubbleSort(numList4);
   }
   if(curr == 24){
     curr = 0;
   }
}
}
  delay(0);
}
/**
navigates through the array, and if it's good to go then it returns true
*/
private boolean checkIfSorted(int l[]) {
  for (int i = 0; i < l.length; i++) {
    if (i != 0) {
      if (l[i-1] > l[i]) {
        return false;
      }
    }
  }
  return true;
}

private int[] MBubbleSort(int numList[]) {
  int c = numList[curr+1];
  numList[curr+1] = numList[curr];
  numList[curr] = c;
  return numList;
}

int maxSize = 100;
int minSize = 1;
int linePx = 1;
int[] numList = new int[maxSize];
int[] numList1 = new int[maxSize/4];
int[] numList2 = new int[maxSize/4];
int[] numList3 = new int[maxSize/4];
int[] numList4 = new int[maxSize/4];
int[] numList5 = new int[maxSize/2];
int[] numList6 = new int[maxSize/2];
int cur = 0, curr = 0, currr = 0,currrr = 0, e = 0;
int LOG_SWAP;
double c = maxSize;
boolean FLAG1 = false, FLAG2 = false;
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
  if(cur != 100){
  for (int i = 0; i < numList.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 10, 10, 5, numList[i] * 2);
  }
  }
  
  if (checkIfSorted(numList) == false) { //checks if the list is fully sorted
    if (cur != numList.length && FLAG1 != true) {
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
      if(cur == 100){
      FLAG1 = true;
      }
      cur++;
  }else{
   
   if(FLAG2 == false){
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
   }
  
    if(checkIfSorted(numList1) == false) {
     
      if (numList1[curr] > numList1[curr+1]) {
          MBubbleSort(numList1);
      }
        curr++;//moves over to the next
   }
  /* print("i) ");
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
     if (numList3[curr] > numList3[curr+1]) {
          MBubbleSort(numList3);
      }
       curr++;//moves over to the next
   }
   if (checkIfSorted(numList4) == false && checkIfSorted(numList3) == true) {
      if (numList4[curr] > numList4[curr+1]) {
          MBubbleSort(numList4);
      }
       curr++;//moves over to the next
   }
   if(curr == 24 && checkIfSorted(numList4) != true){
     curr = 0;
   }
   
   if(checkIfSorted(numList4) == true && FLAG2 != true){
     if(currr < 25 && e == 0){
     numList5[currr] = numList1[curr];
       currr++;
     }else if(currr <= 50 && e == 0){
       print(curr);
      numList5[currr] = numList2[curr];
       currr++;
     }else if(currr < 25 && e == 1){
      numList6[currr] = numList3[curr];
       currr++;
     }else if(currr <= 50 && e == 1){
      numList6[currr] = numList4[curr];
       currr++;
     }
     if(currr == 49){
     currr = 0;
     e++;
     }
     if(e == 2){
     FLAG2 = true;
     }
     
      if(curr == 24){
      curr = 0;
      }
      curr++;
   }
   
   if(FLAG2 == true){
     if(curr == 49 && checkIfSorted(numList6) != true){
     curr = 0;
    }
    for (int i = 0; i < numList5.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 10, 10, 5, numList5[i] * 2);
   }
    for (int i = 0; i < numList6.length; i++) {
    fill(0, 0, 0);
    rect(10 * i + 500, 10, 5, numList6[i] * 2);
   }
   
    if(checkIfSorted(numList5) == false) {
      if (numList5[curr] > numList5[curr+1]) {
          MBubbleSort(numList5);
      }
        curr++;//moves over to the next
   }
     if (checkIfSorted(numList6) == false && checkIfSorted(numList5) == true) {
    if (numList6[curr] > numList6[curr+1]) {
          MBubbleSort(numList6);
      }
       curr++;//moves over to the next
   }
   }
   
   /*if(checkIfSorted(numList6) == true){
     if(currrr < 50){
     numList[currrr] = numList5[currr];
       currrr++;
     }else if(currrr <= 100){
     numList[currrr] = numList6[currr];
       currrr++;
     }
   }*/
 
 
}//end of else
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

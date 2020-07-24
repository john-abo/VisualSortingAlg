import java.util.Arrays;

int[] a = new int[100];

float b = 100f;

for (int i = 0; i < a.length; i++) {
  a[i] = (int)random(b);
}

long start  = System.nanoTime();

Arrays.sort(a);

long end = System.nanoTime();

println("Runtime: " + (end - start)/(Math.pow(10,9)));

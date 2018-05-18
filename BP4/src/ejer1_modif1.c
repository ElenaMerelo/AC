#include <stdlib.h>
#include <stdio.h>
#include <time.h>

struct{
  int a, b;
} s[5000];

int main(){
  struct timespec cgt1, cgt2;
  double ncgt;  //para tiempo de ejecución
  int i, x1, x2, r[40000];
  srand(time(NULL));

  for(i= 0; i< 5000; i++){
    s[i].a= rand();
    s[i].b= rand();
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);
  for(int ii= 0; ii< 40000; ii++){
    x1= 0;
    x2= 0;

    for(i= 0; i< 5000; i++) {
      x1 += 2*s[i].a + ii;
      x2 += 3*s[i].b - ii;
  }

    if (x1 < x2) r[ii]= x1;
    else r[ii]= x2;
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  printf("Tiempo de ejecución: %11.9f\t / r[0]= %d\t / r[4999]= %d\n", ncgt, r[0], r[39999]);

}

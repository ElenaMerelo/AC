#include <stdlib.h>
#include <stdio.h>
#include <time.h>

struct {
  int a;
  int b;
} s[5000];

int r[40000];

int main(){
  time_t t;
  int x1, x2, i, ii, aux1, aux2;
  struct timespec cgt1, cgt2;
  double ncgt;

  for(int i=0; i<5000; i++) {
      s[i].a = rand() % 5000;
      s[i].b = rand() % 5000;
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  x1= 0; x2= 0;
  for(i=0; i<5000; i++){
   x1 += s[i].a;
   x2 += s[i].b;
  }

  x1 *= 2;
  x2 *= 3;

  for(ii=0; ii<40000; ii++){
    aux1= x1; aux2= x2;
    aux1 += ii*5000;
    aux2 -= ii*5000;

    if( aux1< aux2 ) r[ii]= aux1; else r[ii]= aux2;
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  printf("Tiempo de ejecución: %11.9f\t / r[0]= %d\t / r[39999]= %d\n", ncgt, r[0], r[39999]);

}

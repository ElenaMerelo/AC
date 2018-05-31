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
  int x1, x2, i, ii, aux1[4];
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

  for(ii=0; ii<40000; ii+=4){
    aux1[0]=ii*5000;
    aux1[1]=(ii+1)*5000;
    aux1[2]=(ii+2)*5000;
    aux1[3]=(ii+3)*5000;

    if( x1<x2-2*aux1[0] ) r[ii]=x1+aux1[0]; else r[ii]=x2-aux1[0];
    if( x1<x2-2*aux1[1] ) r[ii+1]=x1+aux1[1]; else r[ii+1]=x2-aux1[1];
    if( x1<x2-2*aux1[2] ) r[ii+2]=x1+aux1[2]; else r[ii+2]=x2-aux1[2];
    if( x1<x2-2*aux1[3] ) r[ii+3]=x1+aux1[3]; else r[ii+3]=x2-aux1[3];
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  printf("Tiempo de ejecución: %11.9f\t / r[0]= %d\t / r[39999]= %d\n", ncgt, r[0], r[39999]);

}

#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) {
  int i, n = 20, chunk, a[n],suma=0;

  if(argc < 3) {
    fprintf(stderr,"\nFalta chunk y/o iteraciones\n");
    exit(-1);
  }

  n = atoi(argv[1]);

  if(n > 20){
    n= 20;
    chunk= atoi(argv[2]);
    if(chunk <= 0){
      fprintf(stderr,"\nChunk incorrecto\n");
      exit(-1);
    }
  }

  for (i=0; i<n; i++)
    a[i] = i;

  #pragma omp parallel for firstprivate(suma) \
lastprivate(suma) schedule(guided,chunk)
  for (i=0; i<n; i++){
    suma += a[i];
    printf(" thread %d suma a[%d] suma=%d \n", omp_get_thread_num(),i,suma);
  }

  printf("Fuera de 'parallel for' suma=%d\n",suma);
}

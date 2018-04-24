#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) {
  int i, n = 16, chunk, a[n],suma=0;

  if(argc < 2) {
    fprintf(stderr,"\nFalta chunk \n");
    exit(-1);
  }

  chunk = atoi(argv[1]);

  if(chunk <= 0){
    fprintf(stderr,"\nChunk incorrecto\n");
    exit(-1);
  }

  for (i=0; i<n; i++)
    a[i] = i;

  /* Con firstprivate(suma) inicializamos de forma que todas las threads tengan
  como variable privada suma y ésta valga 0, y con lastprivate(suma) se guarda en suma
  el valor obtenido en la última ejecución del bucle. Al especificar shedule(static, chunk)
  hacemos que cada hebra ejecute chunk veces el bucle.*/
  #pragma omp parallel for firstprivate(suma) \
lastprivate(suma) schedule(static,chunk)
  for (i=0; i<n; i++){
    suma += a[i];
    printf(" thread %d suma a[%d] suma=%d \n", omp_get_thread_num(),i,suma);
  }

  printf("Fuera de 'parallel for' suma=%d\n",suma);
}

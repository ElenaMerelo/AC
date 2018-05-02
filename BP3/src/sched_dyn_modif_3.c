//Elena Merelo Molina
#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num()0
#endif

int main(int argc, char **argv){
  int i, n= 200, chunk, a[n], suma= 0, modifier;
  omp_sched_t kind;

  if(argc < 3){
    fprintf(stderr,"\nFalta chunk y/o iteraciones\n");
    exit(-1);
  }

  n= atoi(argv[1]);

  if(n > 200)
    n= 200;

  chunk= atoi(argv[2]);

  for(i= 0; i< n; i++)
    a[i]= i;

  omp_get_schedule(&kind, &modifier);
  printf("Antes de modificar: dyn-var= %d, nthreads-var= %d, run-sched-var= kind %d, modifier %d\n", omp_get_dynamic(), omp_get_max_threads(), kind, modifier);

  omp_set_dynamic(0);
  omp_set_num_threads(12);
  omp_set_schedule(omp_sched_guided, 0);
  printf("Después de modificar: dyn-var= %d, nthreads-var= %d, run-sched-var= kind %d, modifier %d\n", omp_get_dynamic(), omp_get_max_threads(), kind, modifier);


  #pragma omp parallel for firstprivate(suma) \
lastprivate(suma) schedule(dynamic, chunk)
  for(i= 0; i< n; i++){
    suma += a[i];
    printf("Thread %d suma a a[%d]= %d suma= %d\n", omp_get_thread_num(), i, a[i], suma);
  }

  printf("Fuera de parallel for suma= %d\n", suma);
}

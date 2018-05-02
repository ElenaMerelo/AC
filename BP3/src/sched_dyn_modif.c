/*Añadir al programa scheduled-clause.c lo necesario para que imprima
el valor de las variables de control dyn-var, nthreads-var, thread-limit-var
y run-sched-var dentro (debe imprimir sólo un thread) y fuera de la región
paralela. Realizar varias ejecuciones usando variables de entorno para modificar
estas variables de control antes de la ejecución.
By: Elena Merelo Molina
*/

#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num()0
#endif

int main(int argc, char **argv){
  int i, n= 200, chunk, a[n], suma= 0;
  omp_sched_t kind;
  int modifier;

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

  #pragma omp parallel
  {
    #pragma omp for firstprivate(suma) \
                    lastprivate(suma) schedule(dynamic, chunk)
    for(i= 0; i< n; i++){
      suma += a[i];
      printf("Thread %d suma a a[%d]= %d suma= %d\n", omp_get_thread_num(), i, a[i], suma);
    }
    #pragma omp single
    {
      omp_get_schedule(&kind, &modifier);
      printf("Dentro de la región paralela. dyn-var: %d, nthreads-var: %d, thread-limit-var: %d , run-sched-var: kind- %d, modifier- %d \n", omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), kind, modifier);
    }
  }

  printf("Fuera de parallel for suma= %d\n", suma);
  omp_get_schedule(&kind, &modifier);
  printf("dyn-var: %d, nthreads-var: %d, thread-limit-var: %d , run-sched-var: kind- %d, modifier- %d \n", omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), kind, modifier);
}

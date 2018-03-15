/* --Elena Merelo Molina--
Compilamos con gcc -fopenmp bucle-for.c -o bucle-for, ejecutamos con ./bucle 5
y obtenemos:
thread 0 ejecuta la iteración 0 del bucle
thread 2 ejecuta la iteración 2 del bucle
thread 4 ejecuta la iteración 4 del bucle
thread 1 ejecuta la iteración 1 del bucle
thread 3 ejecuta la iteración 3 del bucle
*/

#include <stdio.h>
#include <omp.h>

int main() {
  int n = 9, i, a, b[n];

  for (i=0; i<n; i++) b[i] = -1;

  #pragma omp parallel
  {
    #pragma omp single
    {
      printf("Introduce valor de inicialización a: ");
      scanf("%d", &a );
      printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
    }

    #pragma omp sections
      for (i=0; i<n; i++) b[i] = a;
  }

  printf("Después de la región parallel:\n");

  for (i=0; i<n; i++) printf("b[%d] = %d\t",i,b[i]);
  printf("\n");
  }

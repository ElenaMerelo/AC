//Elena Merelo Molina

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char **argv) {
  int i, n= 20, x, tid, a[n], suma=0, sumalocal;

  if(argc != 3) {
    fprintf(stderr,"Número de argumentos incorrecto, ha de introducir iteraciones y threads\n");
    exit(-1);
  }

  n = atoi(argv[1]);
  x= atoi(argv[2]);

  for (i=0; i<n; i++)
    a[i] = i;

  /*Al imprimir omp_get_max_threads en mi pc sale 4, es el máximo número de threads
  con los que puedo trabajar.*/
  if( x > 4)
    x= 4;

  if (n>20)
    n=20;

  /*No se ejecuta en paralelo si n<= 4. Con default(none) hacemos que no se compartan
  o por defecto sean privadas las variables, de manera que nosotros mismos podamos
  establecer su visibilidad, poniendo sumalocal y tid privadas(con private(sumalocal, tid))
  y a, suma, n compartidas.*/
  #pragma omp parallel if(n > 4) num_threads(x) default(none) \
  private(sumalocal,tid) shared(a,suma,n)
  {
    sumalocal=0;
    tid=omp_get_thread_num();
    /*Con private(i) hacemos que cada hebra tenga un valor de i propio, schedule(static)
    hace que openMP divida el número de iteraciones de forma equitativa entre las hebras,
    aunque al poner nowait no han de esperarse unas a otras.*/
    #pragma omp for private(i) schedule(static) nowait
    for (i=0; i< n; i++){
      sumalocal += a[i];
      printf(" thread %d suma de a[%d]=%d sumalocal=%d \n",tid,i,a[i],sumalocal);
    }

    #pragma omp atomic
    suma += sumalocal;
    #pragma omp barrier //Se espera a que todas las hebras terminen para imprimir el resultado
    #pragma omp master
    printf("thread master=%d imprime suma=%d\n",tid,suma);
  }
}

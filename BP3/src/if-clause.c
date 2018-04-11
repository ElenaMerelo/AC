#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char **argv) {
  int i, n=20, tid;
  int a[n], suma=0, sumalocal;

  if(argc < 2) {
    fprintf(stderr,"[ERROR]-Falta iteraciones\n");
    exit(-1);
  }
  n = atoi(argv[1]);

  if (n>20)
    n=20;

  for (i=0; i<n; i++)
    a[i] = i;

  /*No se ejecuta en paralelo si n<= 4. Con default(none) hacemos que no se compartan
  o por defecto sean privadas las variables, de manera que nosotros mismos podamos
  establecer su visibilidad, poniendo sumalocal y tid privadas(con private(sumalocal, tid))
  y a, suma, n compartidas.*/
  #pragma omp parallel if(n>4) default(none) \
  private(sumalocal,tid) shared(a,suma,n)
  {
    sumalocal=0;
    tid=omp_get_thread_num();
    /*Con private(i) hacemos que cada hebra tenga un valor de i propio, schedule(static)
    hace que openMP divida el número de iteraciones de forma equitativa entre las hebras,
    aunque al poner nowait no han de esperarse unas a otras.*/
    #pragma omp for private(i) schedule(static) nowait
    for (i=0; i<n; i++){
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

/* Implementar en paralelo la multiplicación de una matriz triangular por un
vector a partir del código secuencial realizado para el ejercicio anterior
utilizando la directiva for de OpenMP. El código debe repartir entre los threads
las iteraciones del bucle que recorre las filas.

Añadir lo necesario para que el usuario pueda fijar la planificación de tareas
usando la variable de entorno OMP_SCHEDULE.
Autora: Elena Merelo Molina.*/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

#define PRINTF_MATRIX // descomentar para imprimir la matriz triangular
#define PRINTF_VECTOR // descomentar para imprimir el vector que va a ser multiplicado
#define PRINTF_RESULT // descomentar para imprimir el vector resultante del producto
#define PRINTF_SCHED // descomentar para imprimir el tipo de scheduling y el chunk usado

int main(int argc, char **argv){
  int n, i, j, suma_local;
  struct timespec cgt1, cgt2;
  double ncgt;  //para tiempo de ejecución

  if(argc != 2){
    printf("Faltan número de filas y columnas de la matriz\n");
    exit(-1);
  }

  n= atoi(argv[1]);

  int **m, *v, *r;

  v= (int*) malloc(n*sizeof(int));
  r= (int*) malloc(n*sizeof(int));

  //Creamos una matriz usando un array de punteros a arrays
  m= (int**) malloc(n*sizeof(int*));
  for(i= 0; i< n; i++)
    m[i]= (int*) malloc(n*sizeof(int));

    if ((m == NULL) || (v == NULL) || (r == NULL)) {
      printf("Error en la reserva de espacio\n");
      exit(-2);
    }


  //Inicializamos la matriz y los vectores paralelamente
  for(i= 0; i< n; i++){
    v[i]= i;
    r[i]= 0;
    #pragma omp parallel for
    for(j= 0; j< n; j++)
      m[i][j]= (i <= j) ? i+j : 0;
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  /*Realizamos el producto de la matriz triangular m por el vector v, guardando
  el resultado en r. Ponemos schedule a runtime para que desde la terminal podamos
  decidir cómo queremos que se reparta el trabajo entre las threads.*/
  #pragma omp parallel num_threads(4) private(i, j, suma_local)
  {
     #pragma omp for schedule(runtime)
      for(i= 0; i< n; i++){
        suma_local= 0;
        for(j= i; j< n; j++)
          suma_local += m[i][j] * v[j];

          #pragma omp atomic
          r[i] += suma_local;
      }
      #ifdef PRINTF_SCHED
        //Para que lo ejecute un solo thread
        #pragma omp single
        {
          omp_sched_t kind;
          int chunk_size;

          omp_get_schedule(&kind, &chunk_size);

          printf("\nTipo de scheduling usado: %d (1= static, 2= dynamic, 3= guided, 4= auto), chunk_size: %d", kind, chunk_size);
        }
      #endif
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);

  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  //Para comprobar que hace bien el producto
  #ifdef PRINTF_MATRIX
    printf("\nMatriz m:\n");
    for(i= 0; i< n; i++){
      for(j= 0; j< n; j++)
        printf("%d\t", m[i][j]);
      printf("\n");
    }
  #endif

  #ifdef PRINTF_VECTOR
    printf("\nVector v: ");
    for(i= 0; i< n; i++)
      printf("%d ", v[i]);
  #endif

  #ifdef PRINTF_RESULT
    printf("\nVector resultante del producto: ");
    for(i= 0; i< n; i++)
      printf("%d ", r[i]);
  #endif

  printf("\nTiempo de ejecución: %11.9f\t / r[0]= %d\t / r[%d]= %d\n", ncgt, r[0], n-1, r[n-1]);

  //Liberación de memoria
  for(int i= 0; i< n; i++)
    free(m[i]);

    free(m);
    free(r);
    free(v);
}

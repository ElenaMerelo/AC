/* Implementar un programa secuencial en C que multiplique una matriz triangular
por un vector (use variables dinámicas). Compare el orden de complejidad del
código que ha implementado con el código que implementó para el producto matriz
por vector.
NOTAS: (1) el número de filas/columnas debe ser un argumento de entrada;
(2) se debe inicializar las matrices antes del cálculo;
(3) se debe imprimir siempre la primera y última componente del resultado antes
de que termine el programa.*/
//Autora: Elena Merelo Molina
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

//#define PRINTF_RESULT // descomentar para que imprima el resultado del producto de la matriz por el vector

int main(int argc, char **argv){
  int n, i, j;
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


  //Inicializamos la matriz y los vectores
  for(i= 0; i< n; i++){
    v[i]= i;
    r[i]= 0;
    for(j= 0; j< n; j++)
      m[i][j]= (i <= j) ? i+j : 0;
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  //Realizamos el producto de la matriz triangular m por el vector v, guardando el resultado en r
  for(i= 0; i< n; i++)
    for(j= i; j< n; j++)
      r[i] += m[i][j] * v[j];

  clock_gettime(CLOCK_REALTIME, &cgt2);

  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  //Para comprobar que hace bien el producto
  #ifdef PRINTF_RESULT
    printf("Matriz m: \n");
    for(i= 0; i< n; i++){
      for(j= 0; j< n; j++)
        printf("%d\t", m[i][j]);
      printf("\n");
    }

    printf("Vector v: \n");
    for(i= 0; i< n; i++)
      printf("%d ", v[i]);

    printf("Vector resultante del producto\n");
    for(i= 0; i< n; i++)
      printf("%d ", r[i]);
  #endif

  printf("Tiempo de ejecución: %11.9f\t / r[0]= %d\t / r[%d]= %d\n", ncgt, r[0], n-1, r[n-1]);

  //Liberación de memoria
  for(int i= 0; i< n; i++)
    free(m[i]);

    free(m);
    free(r);
    free(v);

}

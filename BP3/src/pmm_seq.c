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

#define PRINTF_RESULT // descomentar para que imprima el resultado del producto de la matriz por el vector

int main(int argc, char **argv){
  int tam, i, j;
  struct timespec cgt1, cgt2;
  double ncgt;  //para tiempo de ejecución

  if(argc != 2){
    printf("Faltan número de filas y columnas de la matriz\n");
    exit(-1);
  }

  tam= atoi(argv[1]);

  int **m, **n, **r;

  //Reservamos espacio para las tres matrices
  m= (int**) malloc(tam*sizeof(int*));
  n= (int**) malloc(tam*sizeof(int*));
  r= (int**) malloc(tam*sizeof(int*));

  for(i= 0; i< tam; i++){
    m[i]= (int*) malloc(tam*sizeof(int));
    n[i]= (int*) malloc(tam*sizeof(int));
    r[i]= (int*) malloc(tam*sizeof(int));
  }

    if ((m == NULL) || (n == NULL) || (r == NULL)) {
      printf("Error en la reserva de espacio\n");
      exit(-2);
    }


  //Inicializamos la matriz y los vectores
  for(i= 0; i< tam; i++){
    for(j= 0; j< tam; j++)
      m[i][j]= i+j;
      n[i][j]= j;
      r[i][j]= 0;
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  //Realizamos el producto de la matriz triangular m por el vector v, guardando el resultado en r
  for(i= 0; i< tam; i++)
    for(j= 0; j< tam; j++)
      r[i][j] += m[i][j] * n[i][j];

  clock_gettime(CLOCK_REALTIME, &cgt2);

  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  //Para comprobar que hace bien el producto
  #ifdef PRINTF_RESULT
    printf("Matriz m: \n");
    for(i= 0; i< tam; i++){
      for(j= 0; j< tam; j++)
        printf("%d\t", m[i][j]);
      printf("\n");
    }

    printf("Matriz n: \n");
    for(i= 0; i< tam; i++){
      for(j= 0; j< tam; j++)
        printf("%d\t", n[i][j]);
      printf("\n");
    }

    printf("Matriz resultante del producto\n");
    for(i= 0; i< tam; i++){
      for(j= 0; j< tam; j++)
        printf("%d\t", r[i][j]);
      printf("\n");
    }
  #endif

  printf("Tiempo de ejecución: %11.9f\t / r[0][0]= %d\t / r[%d][%d]= %d\n", ncgt, r[0][0], tam-1, tam-1, r[tam-1][tam-1]);

  //Liberación de memoria
  for(int i= 0; i< tam; i++){
    free(m[i]);
    free(n[i]);
    free(r[i]);
  }

    free(m);
    free(n);
    free(r);

}
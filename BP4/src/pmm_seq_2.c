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

//#define PRINTF_MATRIX_1 // descomentar para imprimir la matriz 1
//#define PRINTF_MATRIX_2 // descomentar para imprimir la matriz 2
//#define PRINTF_TRASPUESTA //descomentar para ver la matriz 2 traspuesta
//#define PRINTF_RESULT // descomentar para imprimir la matriz resultado del producto de las anteriores

int main(int argc, char **argv){
  int tam, i, j, k, aux, aux0, aux1, aux2, aux3;
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


  //Inicializamos las matrices
  for(i= 0; i< tam; i++)
    for(j= 0; j< tam; j++){
      m[i][j]= i+j;
      n[i][j]= j;
      r[i][j]= 0;
  }

  //Para comprobar que hace bien el producto
  #ifdef PRINTF_MATRIX_1
    printf("Matriz m: \n");
    for(i= 0; i< tam; i++){
      for(j= 0; j< tam; j++)
        printf("%d\t", m[i][j]);
      printf("\n");
    }
  #endif

  #ifdef PRINTF_MATRIX_2
    printf("Matriz n: \n");
    for(i= 0; i< tam; i++){
      for(j= 0; j< tam; j++)
        printf("%d\t", n[i][j]);
      printf("\n");
    }
  #endif

  clock_gettime(CLOCK_REALTIME, &cgt1);

  //Trasponemos la segunda matriz
  for(i= 0; i< tam; i++){
    for(j= i+1; j< tam; j++){
      aux= n[i][j];
      n[i][j]= n[j][i];
      n[j][i]= aux;
    }
  }

  //Realizamos el producto de la matriz m por la matriz n, guardando el resultado en r
  for(i= 0; i< tam; i++)
    for(j= 0; j< tam; j += 4){
      aux0=0; aux1=0; aux2=0; aux3=0;
      for(k= 0; k< tam; k++){
        aux0 += m[i][k] * n[j][k];
        aux1 += m[i][k] * n[j+1][k];
        aux2 += m[i][k] * n[j+2][k];
        aux3 += m[i][k] * n[j+3][k];
      }
      r[i][j]= aux0;
      r[i][j+1]= aux1;
      r[i][j+2]= aux2;
      r[i][j+3]= aux3;
    }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  #ifdef PRINTF_TRASPUESTA
    printf("Matriz n traspuesta: \n");
    for(i= 0; i< tam; i++){
      for(j= 0; j< tam; j++)
        printf("%d\t", n[i][j]);
      printf("\n");
    }
  #endif

  #ifdef PRINTF_RESULT
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

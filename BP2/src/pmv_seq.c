/*
Enunciado:
Implementar un programa secuencial en C que calcule el producto de una matriz
cuadrada, M, por un vector, v1 (implemente una versión para variables globales y
otra para variables dinámicas, use una de estas versiones en los siguientes ejercicios):

NOTAS: (1) el número de filas /columnas N de la matriz deben ser argumentos de
entrada al programa; (2) se debe inicializar la matriz y el vector antes del
cálculo; (3) se debe asegurar que el programa calcula la suma correctamente
imprimiendo todos los componentes del vector resultante, v3, para tamaños pequeños
de los vectores (por ejemplo, N = 8 y N=11); (5) se debe imprimir sea cual sea
el tamaño de los vectores el tiempo de ejecución del código paralelo que calcula
el producto matriz vector y, al menos, el primer y último componente del
resultado (esto último evita que las optimizaciones del compilador eliminen el
código de la suma).
*/

//Autora: Elena Merelo Molina
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define V_GLOBAL
//#define V_DYNAMIC
#define PRINTF_RESULT // descomentar para que imprima el resultado del producto de la matriz por el vector

#ifdef V_GLOBAL
  #define MAX 55000
  int m[MAX][MAX], v[MAX], r[MAX];
#endif

int main(int argc, char **argv){
  int n, i, j;
  struct timespec cgt1, cgt2;
  double ncgt;  //para tiempo de ejecución

  if(argc != 2){
    printf("Faltan número de filas y columnas de la matriz\n");
    exit(-1);
  }

  n= atoi(argv[1]);

  #ifdef V_GLOBAL
    if(n > MAX) n= MAX;
  #endif

  #ifdef V_DYNAMIC
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
  #endif

  //Inicializamos la matriz y los vectores
  for(i= 0; i< n; i++){
    v[i]= i;
    r[i]= 0;
    for(j= 0; j< n; j++)
      m[i][j]= i+j;
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  //Realizamos el producto de la matriz m por el vector v, guardando el resultado en r
  for(i= 0; i< n; i++)
    for(j= 0; j< n; j++)
      r[i] += m[i][j] * v[j];

  clock_gettime(CLOCK_REALTIME, &cgt2);

  ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  //Para comprobar que hace bien el producto
  #ifdef PRINTF_RESULT
    printf("Matriz m: \n");
    for(i= 0; i< n; i++){
      for(j= 0; j< n; j++)
        printf("%d ", m[i][j]);
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
  #ifdef V_DYNAMIC
    for(int i= 0; i< n; i++)
      free(m[i]);

    free(m);
    free(r);
    free(v);
  #endif

}

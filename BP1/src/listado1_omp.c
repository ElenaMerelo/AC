/* EJERCICIO 7
Implementar un programa en C con OpenMP, a partir del código del Listado 1, que calcule en paralelo la suma de dos vectores
(v3 = v1 + v2;  v3(i)=v1(i)+v2(i),  i=0,…N-1) usando las directivas parallel y for.

Se deben paralelizar también las tareas asociadas a la inicialización de los vectores. Como en el código del Listado 1 se debe
obtener el tiempo (elapsed time) que supone el cálculo de la suma. Para obtener este tiempo usar la función omp_get_wtime(),
que proporciona el estándar OpenMP, en lugar de clock_gettime().

NOTAS: (1) el número de componentes N de los vectores debe ser un argumento de entrada al programa;
(2) se deben inicializar los vectores antes del cálculo;
(3) se debe asegurar que el programa calcula la suma correctamente imprimiendo todos los componentes del vector resultante, v3, para
varios tamaños pequeños de los vectores (por ejemplo, N = 8 y N=11);
(4) se debe imprimir sea cual sea  el tamaño de los vectores el tiempo de ejecución del código paralelo que suma
los vectores y, al menos, el primer y último componente de v1, v2 y v3 (esto último evita que las optimizaciones del compilador eliminen el código de la suma).

File: listado1_omp.c
Para compilar usar (-lrt: real time library):
gcc -O2 - fopenmp listado1_omp.c -o listado1_omp -lrt
gcc -O2 -S -fopenmp listado1_omp.c -lrt    (para generar el código ensamblador)
Para ejecutar: ./listado1_omp longitud
*/

#include <stdlib.h>   //biblioteca para funciones atoi(), malloc() y free()
#include <stdio.h>    //biblioteca donde se encuentra la función printf()
#include <time.h>     //biblioteca donde se encuentra la función clock_gettime()
#include <math.h>

#ifdef _OPENMP  //Si se compila con la opción -fopenmp
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif

//#define PRINTF_ALL

#define MAX 67108865
double v1[MAX], v2[MAX], v3[MAX];


int main(int argc, char **argv){
  int i;

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){
    printf("Faltan nºcomponentes del vector\n");
    exit(-1);
  }

  unsigned int N= atoi(argv[1]);    //Máximo N= 2^32-1= 4294967295 (sizeof(unsigned int)= 4B)

  if (N> MAX) N= MAX;

  //Inicializar vectores
  #pragma omp parallel for
    for(i= 0; i< N; i++){
      v1[i]= N*0.1 + i*0.1;
      v2[i]= N*0.1 - i*0.1;   //los valores dependen de N
    }
  #pragma omp barrier //para que se asignen correctamente los valores

  double start= omp_get_wtime();

  //Calcular suma de vectores
  #pragma omp parallel for
    for(i= 0; i< N; i++)
      v3[i]= v1[i] + v2[i];

  #pragma omp barrier

  double end= omp_get_wtime();
  double diff= end - start;

  //Imprimir resultado de la suma y el tiempo de ejecución
  #ifdef PRINTF_ALL
  printf("Tiempo(seg): %11.9f\t / tamaño vectores: %u\n", diff, N);

  for(i= 0; i<N; i++)
    printf("/V1[%d] + V2[%d] = V3[%d] (%8.6f + %8.6f = %8.6f) /\n", i, i, i, v1[i], v2[i], v3[i]);
  #else
    printf("Tiempo(seg): %11.9f\t / tamaño vectores: %u\t/ v1[0]+v2[0]=v3[0](%8.6f+%8.6f=%8.6f) / / v1[%d]+v2[%d]=v3[%d](%8.6f+%8.6f=%8.6f) /\n", diff, N, v1[0], v2[0], v3[0], N-1, N-1, N-1, v1[N-1], v2[N-1], v3[N-1]);
  #endif

}

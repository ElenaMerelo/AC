/* Si compilamos con gcc hello.c -o hello, al ejecutar devuelve Hello 0 World 0. Si por otro lado
compilamos con gcc -fopenmp hello.c -o hello, al ejecutar muestra Hello 2 World 2
Hello 1 World 1
Hello 3 World 3
Hello 0 World 0
*/
#include <stdio.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(){
  int ID;

  #pragma omp parallel private (ID)
  {
    ID= omp_get_thread_num();
    printf("Hello %d ", ID);
    printf("World %d\n", ID);
  }
}

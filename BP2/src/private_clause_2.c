//Elena Merelo Molina

#include <stdio.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(){
  int i, n = 7, a[n], suma;

  for (i=0; i<n; i++)
    a[i] = i;

  suma= 10;

  #pragma omp parallel private(suma)
  {
    #pragma omp for
    for (i=0; i<n; i++){
      suma += a[i];
      printf("thread %d suma a[%d] / ", omp_get_thread_num(), i);
    }
    printf("\n* thread %d suma= %d", omp_get_thread_num(), suma);
  }
}

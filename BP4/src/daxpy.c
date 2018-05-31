#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main(int argc, char **argv) {
    if( argc != 2 ) {
        printf("Número de argumentos inválido, introduzca tamaño.\n");
        exit(-1);
    }

    struct timespec cgt1, cgt2;
    double ncgt;
    int n = atoi(argv[1]);
    float *x= (float*) malloc(n*sizeof(float)), *y= (float*) malloc(n*sizeof(float)) ;

    for(int i= 0; i< n ; i++) x[i]= i + 0.1;

    clock_gettime(CLOCK_REALTIME, &cgt1);

    for(int i=0; i< n; i++) y[i] = 3.14 * x[i] + y[i];

    clock_gettime(CLOCK_REALTIME, &cgt2);

    ncgt= (double)(cgt2.tv_sec - cgt1.tv_sec) + (double) ((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

    printf("Tiempo de ejecución: %11.9f \t / y[0]=%5.3f / y[%d]=%5.3f\n", ncgt, y[0], n, y[n-1]);

    free(x);
    free(y);
}

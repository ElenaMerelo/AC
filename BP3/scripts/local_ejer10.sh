#!/usr/bin/bash

export OMP_DYNAMIC=false

I=275
for ((N=1; N < 5; N=N+1))
do
  export OMP_NUM_THREADS=$N
  echo "Paralelo: "
  ../bin/pmm_omp 150
  echo "Secuencial: "
  ../bin/pmm_seq 150
done

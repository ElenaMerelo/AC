#!/usr/bin/bash

export OMP_DYNAMIC=FALSE

for ((N= 1;N<= 4;N += 1))
do
  export OMP_NUM_THREADS=$N
  echo "Número de thread $N"
  ../bin/pmv_seq_dyn 15000
  ../bin/pmv_seq_dyn 30000
done

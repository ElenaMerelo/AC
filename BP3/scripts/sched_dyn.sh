#!/usr/bin/bash

# export OMP_NUM_THREADS=2
export OMP_NUM_THREADS=4

for ((N= 1;N<= 4;N *= 2))
do
  echo "Chunk $N"
  ../bin/sched_dyn 16 $N
done

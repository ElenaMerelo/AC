#!/usr/bin/bash

export OMP_NUM_THREADS=2

for ((N= 1;N<= 4;N *= 2))
do
  echo "Chunk $N"
  ../bin/sched_guided 16 $N
done

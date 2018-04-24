#!/usr/bin/bash

export OMP_NUM_THREADS=2

for ((N= 1;N<= 4;N *= 2))
do
  echo "Chunk $N"
  ../bin/schedule-clause $N
done

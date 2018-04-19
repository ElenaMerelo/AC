#!/usr/bin/bash

#Se asigna al trabajo el nombre pmv
#PBS -N pmv_seq
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS.

export OMP_DYNAMIC=FALSE

echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificando usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"

cat $PBS_NODEFILE

clear

for ((n= 1; n <= 12; n += 1))
do
  export OMP_NUM_THREADS= n
  echo "Número de threads: $n"
  $PBS_O_WORKDIR/pmv_seq_dyn 15000
  $PBS_O_WORKDIR/pmv_seq_dyn 30000
done

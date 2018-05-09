#!/usr/bin/bash

#Se asigna al trabajo el nombre pmv
#PBS -N pmv_parallel_b
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

for ((n= 0; n < 15364; n += 1))
do
  $PBS_O_WORKDIR/pmv_parallel_b_dyn 15000
  $PBS_O_WORKDIR/pmv_parallel_b_dyn 30000
done

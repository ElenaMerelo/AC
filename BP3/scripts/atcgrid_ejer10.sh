#!/usr/bin/bash

#Se asigna al trabajo el nombre pmv
#PBS -N pmm_atcgrid
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS.


echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificando usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"

cat $PBS_NODEFILE

clear

export OMP_DYNAMIC=false

for((N=1; N<13; N= N+1))
do
  export OMP_NUM_THREADS=$N
  echo "Paralelo: "
  $PBS_O_WORKDIR/pmm_omp 1250
  echo "Secuencial: "
  $PBS_O_WORKDIR/pmm_seq 1250

done

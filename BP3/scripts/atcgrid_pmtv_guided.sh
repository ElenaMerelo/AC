#!/usr/bin/bash

#Se asigna al trabajo el nombre pmv
#PBS -N pmv_parallel_b
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

export OMP_SCHEDULE="guided"
$PBS_O_WORKDIR/pmtv_omp 15552

export OMP_SCHEDULE="guided,1"
echo "Segunda opción guided"
$PBS_O_WORKDIR/pmtv_omp 15552

export OMP_SCHEDULE="guided, 64"
$PBS_O_WORKDIR/pmtv_omp 15552

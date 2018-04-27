#!/usr/bin/bash

export OMP_DYNAMIC=FALSE

for ((N= 1;N<= 4;N += 1))
do
  export OMP_NUM_THREADS=$N
  echo "Número de thread $N"
  ../bin/pmv_seq_dyn 15000
  ../bin/pmv_seq_dyn 30000
done

#!/usr/bin/bash

export OMP_NUM_THREADS=2

for ((N= 1;N<= 4;N *= 2))
do
  echo "Chunk $N"
  ../bin/schedule-clause $N
done


#!/usr/bin/bash

export OMP_NUM_THREADS=2

for ((N= 1;N<= 4;N *= 2))
do
  echo "Chunk $N"
  ../bin/sched_dyn 16 $N
done



#!/usr/bin/bash

export OMP_NUM_THREADS=2

for ((N= 1;N<= 4;N *= 2))
do
  echo "Chunk $N"
  ../bin/sched_guided 16 $N
done


#PBS -q cpu-radionica
#PBS -l ncpus=1

cd ${PBS_O_WORKDIR:-""}

./r-base.sif iris.R

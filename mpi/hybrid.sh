
#PBS -q cpu-radionica
#PBS -l select=2:ncpus=1
#PBS -l place=scatter

cd ${PBS_O_WORKDIR:-""}

module load utils/openmpi/4.1.1-intel

mpirun \
  apptainer exec \
    --bind /lustre/scratch \
    hybrid.sif \
      /myapp/mpi

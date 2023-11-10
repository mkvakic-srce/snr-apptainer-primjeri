
#PBS -q cpu-radionica
#PBS -l select=2:ncpus=1
#PBS -l place=scatter

cd ${PBS_O_WORKDIR:-""}

module load utils/openmpi/4.1.1-intel

# izvršavanje kontejnera hybrid.sif s aplikacijom mpirun modula utils/openmpi/4.1.1-intel
echo "----- mpiexec ... /myapp/mpi -----"
mpirun \
  apptainer exec \
    --bind /lustre/scratch \
    hybrid.sif \
      /myapp/mpi

# testiranje propusnosti
echo "----- mpiexec ... osu_bw -----"
mpirun \
  apptainer run \
    --bind /lustre/scratch \
    hybrid.sif

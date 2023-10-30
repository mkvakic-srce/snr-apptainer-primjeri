
#PBS -q cpu-radionica
#PBS -l select=2:ncpus=2:mpiprocs=2
#PBS -l place=scatter

cd ${PBS_O_WORKDIR:-""}

# dopremanje modula
module load PrgEnv-gnu
module load cray-mpich-abi
module load cray-pals
module load cray-pmi
module load libfabric

# namještanje okolišne varijable LD_LIBRARY_PATH u kontejneru:
#
#     1) CRAY_LD_LIBRARY_PATH        - Cray knjižnice iz /opt
#     2) LD_LIBRARY_PATH             - sistemske knjižnice iz /usr/lib64
#     3) \$LD_LIBRARY_PATH           - očuvanje varijable ako već postoji u kontejneru
#     4) /opt/cray/pe/pals/1.2.3/lib - putanja za PALS servis

export APPTAINERENV_LD_LIBRARY_PATH="${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}:\$LD_LIBRARY_PATH:/opt/cray/pe/pals/1.2.3/lib"

# print ldd ovisnosti izvršne datoteke
echo "----- ldd /myapp/mpi -----"
apptainer exec \
  --bind /opt \
  --bind /run \
  --bind /usr/lib64 \
  mpi.sif \
    ldd /myapp/mpi

# izvršavanje kontejnera mpi-test.sif s aplikacijom mpiexec modula cray-pals
echo "----- mpiexec ... /myapp/mpi -----"
mpiexec --no-transfer \
  apptainer exec \
    --bind /opt \
    --bind /run \
    --bind /usr/lib64 \
    mpi.sif \
      /myapp/mpi

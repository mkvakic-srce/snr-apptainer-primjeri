
#PBS -q cpu-radionica
#PBS -l ncpus=1

cd ${PBS_O_WORKDIR:-""}

apptainer exec ${HOME}/ubuntu-22.04.sif python3 run.py

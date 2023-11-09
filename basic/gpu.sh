
#PBS -q gpu-radionica
#PBS -l ngpus=1

cd ${PBS_O_WORKDIR:-""}

apptainer exec --nv ${HOME}/ubuntu-22.04.sif python3 gpu.py

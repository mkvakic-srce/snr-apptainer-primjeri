
#PBS -q gpu-radionica
#PBS -l ngpus=1

cd ${PBS_O_WORKDIR:-""}

apptainer run --nv conda.sif gpt2.py

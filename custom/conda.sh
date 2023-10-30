
#PBS -q gpu-radionica
#PBS -l ngpus=1

apptainer run --nv conda.sif gpt2.py

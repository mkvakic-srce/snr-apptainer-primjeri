
#PBS -q gpu-radionica
#PBS -l ngpus=1

apptainer run --nv ngc.sif ngc.py

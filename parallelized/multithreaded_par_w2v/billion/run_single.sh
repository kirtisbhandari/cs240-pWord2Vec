#!/bin/bash
#SBATCH --job-name="nmpi-1"  
#SBATCH --output="nmpi_pW2V_36.%j.%N.out"  
#SBATCH --partition=compute  
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --export=ALL  
#SBATCH -t 05:30:00
# example run on 4 Intel BDW nodes, and each node with 72 threads
# please specify the host file accordingly
srun ./single_job.sh

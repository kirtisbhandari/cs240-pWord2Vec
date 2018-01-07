#!/bin/bash
#SBATCH --job-name="mpi-1"  
#SBATCH --output="pW2V-24.%j.%N.out"  
#SBATCH --partition=compute  
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --export=ALL  
#SBATCH -t 03:30:00
# example run on 4 Intel BDW nodes, and each node with 72 threads
# please specify the host file accordingly
nprocs=4

mpirun -np $nprocs ./mpi_job.sh

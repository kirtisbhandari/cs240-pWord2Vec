This is parallelized implementation of word2vec for shared and distributed memory.

- [Intel Compiler](https://software.intel.com/en-us/qualify-for-free-software) (The code is optimized on Intel CPUs)
- OpenMP (No separated installation is needed once Intel compiler is installed)
- MKL (The latest version "16.0.0 or higher" is preferred as it has been improved significantly in recent years)
- MPI library, with multi-threading support (Intel MPI, MPICH2 or MVAPICH2 for distributed word2vec only)
- [HyperWords](https://bitbucket.org/omerlevy/hyperwords) (for model accuracy evaluation)
- Numactl package (for multi-socket NUMA systems)

source /opt/intel/2016.3.210/compilers_and_libraries_2016.3.210/linux/bin/compilervars.sh intel64
sudo yum install numactl (on RedHat/Centos)

1. Download the data: 
cd data
.\getText8.sh
.\getBillion.sh
2.Submit the job for demo script for text8 dataset as:
cd sandbox; 
sbatch run_single_text8.sh (for single machine demo)
sbatch run_mpi_text8.sh (for distributed w2v demo)
3. Submit the job for the 1-billion-word-benchmark as: 
cd billion
sbatch run_single.sh (for single machine w2v) (please set ncores=number of logical cores = required number of threads in single_job.sh)
sbatch run_mpi.sh (for distributed w2v) (please set ncores=number of logical cores = required number of thread in mpi_job.sh)

## Reference
1. [Parallelizing Word2Vec in Shared and Distributed Memory](https://arxiv.org/abs/1604.04661), arXiv, 2016.
2. [Parallelizing Word2Vec in Multi-Core and Many-Core Architectures](https://arxiv.org/abs/1611.06172), in NIPS workshop on Efficient Methods for Deep Neural Networks, Dec. 2016.


#!/bin/bash

data=../data/1b
binary=../pWord2Vec

# set this number to #logical cores of your machine (with hyper-threading if available)
ncores=36 # 24 core max for our case
export OMP_NUM_THREADS=$ncores
export KMP_AFFINITY=explicit,proclist=[0-$(($ncores-1))],granularity=fine
#export KMP_AFFINITY=verbose,scatter
numactl --interleave=all $binary -train $data -save-vocab ./model72/vocab.txt -output ./model72/vectors.txt -size 300 -window 5 -negative 5 -sample 1e-4 -threads $ncores -binary 0 -iter 5 -min-count 2 -st -batch-size 11 -alpha 0.05 -sync-period 0.1 -full-sync-times 0 -min-sync-words 1024 -message-size 1024

#tips: run the above line once with "-save-vocab" to generate vocabulary, then use "-read-vocab" to load vocabulary directly for later runs.

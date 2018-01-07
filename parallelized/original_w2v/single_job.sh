#!/bin/bash

data=../pWord2Vec/data/1b
binary=word2vec

# set this number to #logical cores of your machine (with hyper-threading if available)
ncores=36 # 24 core max for our case
time ./word2vec -train $data -save-vocab ./model72/vocab.txt -output vectors.bin  -size 300 -window 5 -negative 5 -sample 1e-4 -threads $ncores -binary 0 -iter 5 -st -batch-size 11 -alpha 0.05 


#tips: run the above line once with "-save-vocab" to generate vocabulary, then use "-read-vocab" to load vocabulary directly for later runs.

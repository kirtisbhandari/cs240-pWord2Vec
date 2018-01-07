This directory contains models for unsupervised training of word embeddings
using the model described in:

(Mikolov, et. al.) [Efficient Estimation of Word Representations in Vector Space](http://arxiv.org/abs/1301.3781),
ICLR 2013.

Detailed instructions on how to get started and use them are available in the
tutorials. Brief instructions are below.

* [Word2Vec Tutorial](http://tensorflow.org/tutorials/word2vec)

TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
g++ -std=c++11 -shared word2vec_ops.cc word2vec_kernels.cc -o word2vec_ops.so -fPIC -I $TF_INC -O2 -D_GLIBCXX_USE_CXX11_ABI=0

Copy the data to 1 pod:
$kubectl ../data/text8 <pod_id>:tmp/.

Copy the script and other files to the same pod:
$kubectl word2vec.py <pod_id>:/.

Log into the pod as :
$kubectl exec -it <pod_id> -- /bin/bash

Run the script as:
$python word2vec.py \
  --train_data=/tmp/text8 \
  --eval_data=/tmp/questions-words.txt \

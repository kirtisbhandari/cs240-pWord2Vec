This directory includes yaml files to run a distributed word2vec model using tensorflow

#### Create yaml to start TensorFlow servers
This script (https://github.com/caicloud/tensorflow-demo/blob/master/distributed/create_tf_server_yaml.py) can generate yaml file needed to create distributed tensorflow cluster. You can use --num_workers to specify number of workers and use --num_parameter_servers to specify number of parameter servers.

#### Create cluster as
kubectl create -f tf.yml

#### Verify that the cluster is created and running:

$kubectl get pods

#### Copy script to each pod

$kubectl cp word2vector.py <pod_id>:<path>

#### Copy data to each pod

$kubectl cp ../data/text8.zip <pod_id>:tmp/.

#### Run the script on *each* pod and collect result in log file

$kubectl exec -it <pod_id> -- python word2vector.py --worker_grpc_url=grpc://tf-worker0:2222 --worker_index=0 --workers=tf-worker0:2222, tf-worker1:2222 --parameter_servers=tf-ps0:2223


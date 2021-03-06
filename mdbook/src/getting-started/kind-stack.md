# (optional) Kind Stack

Eventually we want to port all exercises to a kind stack which can be run locally.
Source and docker images from the VM images would need to be ported. There is
also currently an issue with port forwarding on windows which must be resolved.

## Installing the go, kind, kubectl stack


* [go](https://golang.org/doc/install)
* [kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)


## Cluster Management and Ops

Here are the jobs each component performs.

* kubeadm: the command to bootstrap the cluster.
* kubelet: the component that runs on all of the machines in your cluster and does things like starting pods and containers.
* kubectl: the command line util to talk to your cluster.

Typically, kubeadm will be wrapped with other tools such as [kubespray](https://github.com/kubernetes-sigs/kubespray)
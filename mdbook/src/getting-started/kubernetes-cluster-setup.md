# Kubernetes Cluster Setup

This lab can run with a Kubernetes cluster in Google Cloud, or locally with Kind.
Kind uses kubeadm to manage a cluster using docker.


## Kube admin tools

The following tools are needed. They are installed in the Student VM or the docker-compose student container.

1. [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
2. [Helm 2](https://v2.helm.sh/docs/install/) or [helm3](https://github.com/helm/helm/releases) (not tested)


## Student environment

1. [docker-compose](https://docs.docker.com/compose/install/)
2. Virtualbox or VMware Fusion, or locally installed tools

## Kind

Install [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) natively (currently kind create inside docker-compose student container fails)  
`kind create cluster`

## Google Cloud
We will setup a Kubernetes cluster in Google Cloud. For this, you will require:

1. Google Cloud account
2. [gcloud](https://cloud.google.com/sdk/install)

* Ensure `gcloud` is configured and able to access your Google Cloud account. This can be verified using

```
gcloud projects lists
```

* Ensure you have `helm2` symlink pointing to the Helm v2.x binary. The setup script in the 
infra-setup folder uses `helm2` to invoke Helm v2.

> **NOTE:** Setting up a cluster in Google cloud may incur cost. Refer to `setup.sh` on the resources created.

## Create Cluster


### Kind

```bash
export STUDENTPROJECTNAME="kind"
./setup.sh --kind

```

> The cluster creation script `setup.sh` will

1. Create a kind kubernetes cluster
2. Add an nginx ingress
3. Deploy vulnerable apps and config
4. Generate `kubeconfig` file in current directory


### Google Cloud

```bash
export STUDENTPROJECTNAME="Google-Cloud-Project-Name"
./setup.sh
```

> The cluster creation script `setup.sh` will generate a script `destroy.sh` that can be used to delete the resources created on Google cloud

The `setup.sh` will

1. Create a Kubernetes cluster on Google cloud using `gcloud`
2. Allocate a static IP address for Ingress
3. Deploy vulnerable apps and config
4. Generate `kubeconfig` file in current directory
5. Generate `destroy.sh` script to destroy [1] and [2]


## Expose Vulnerable Apps

### Kind (may want to expose a higher port to avoid sudo)
```bash
sudo kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 80:80
```

You can verify everything worked as follows. It's ok for the ingress-nginx-controller ExternalIP to 
be in <pending> state if deployed with Kind.
```bash
kubectl get svc --all-namespaces
```

The default ingress `app-ingress/app-ingress.yml` uses host names that resolves to `127.0.0.1`. The above command will forward port 80 on localhost to the `Nginx Ingress` service running inside the cluster.

### Google Cloud

```bash
sudo kubectl port-forward -n kube-system svc/nginx-ingress-controller 80:80
```


## Destroy Cluster

```
./destroy.sh
```
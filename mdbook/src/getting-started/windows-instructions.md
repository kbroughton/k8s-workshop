# Pre-requisites

If you're running Docker Desktop for Windows, make sure you have a default machine created, and that it has at least 2 threads assigned to it.

If you're running Docker Toolbox, make sure you have a default machine created, that it has at least 2 threads assigned to it, and that Kitematic is running.

### Install
[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-with-curl-on-windows)

[Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

# Setup

Execute the following steps in order:

1. Change setup.sh line ending to LF. This can be done with Notepad++, for example.
2. Run `docker build -t student .`
3. Run `docker-compose -f .\docker-compose-windows.yml up -d`
4. Run `kind create cluster`. This will take a few minutes. Make sure you have at least 5GB of disk space available.
5. Exec into the infra-setup container. 
* On Kitematic, this can be done by clicking the exec button.
![](images/kitematic_exec.png) 

* On Docker Desktop, this can be done by running `docker ps`, copying the container's ID, and then running `docker exec -it replace-this-with-container-id bash`

6. Run `./setup.sh --kind`
7. Run `kubectl apply -f apps-ingress/apps-ingress.yaml`. It should return either unchanged or created. If it returns an InternalServer error, wait a few minutes and try again.

To verify everything worked, run `kubectl get pods`. This should return the pods status as Running or ContainerCreating.

If your pods get stuck on Pending, it's most likely a lack of resources. You need to delete both containers, close Kitematic or Docker Desktop, increase the CPU and RAM limit and re-do all the steps.

# Expose Vulnerable Apps

* Run `kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 80:80`
* Browse to localhost to see the vulnerable apps.
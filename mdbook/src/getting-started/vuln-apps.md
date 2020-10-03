# Vulnerable Apps

Each student cluster has intentionally vulnerable apps running which will be used during lab scenarios. The apps are available in following URLs. For Kind deployments, these are hosted on localhost.

```
http://mailbox-service.oss-k8s-security.cloudsec.training
http://server-health.oss-k8s-security.cloudsec.training
http://connectivity-check.oss-k8s-security.cloudsec.training
```

**NOTE:** All attacks described in this document must be executed from Kubernetes Student VM or the docker-compose
student service.

The apps are accessible from Student VM after you setup port forward locally. Open a terminal in Student VM and execute the command below to setup a port forward into the cluster.

```bash
sudo kubectl port-forward -n kube-system svc/nginx-ingress-controller 80:80
```

Kind (verify this)
```bash
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8090:80
```

You can verify everything worked as follows. It's ok for the ingress-nginx-controller ExternalIP to 
be in <pending> state.
```bash
kubectl get svc --all-namespaces
```

Now you can navigate to the vulnerable applications by URL given above.
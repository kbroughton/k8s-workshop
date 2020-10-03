# Setup Student Environment

# Option 1 - docker-compose

In the `infra-setup` directory
```bash
docker build -t student .
docker-compose up -d
export CONTAINTER_ID=`docker ps | grep student | cut -d' ' -f1`
docker exec -it $CONTAINER_ID bash
```

# Option 2 - Student VM 

## Download Kubernetes Student VM

* http://www.mediafire.com/file/b739545szyrc6i5/kubernetes-security.ova/file
* http://www.mediafire.com/file/asz5xukxg1lhs3r/kubernetes-security.ova.checksum/file

## Import VM

* Click on Virtual Box `File` -> `Import`

* Browse to the ova of k8s-security and import the file
![](images/select-import.png)

* Click on Import
![](images/import.png)

![](images/process.png)


* Login to the vm using below credentials

```bash
username: student
password: hackk8s
```
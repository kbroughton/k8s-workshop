# Attacking Kubernetes Workshop Presented By Praetorian

![Attacking and Auditing Docker Containers and Kubernetes Clusters](github-images/k8s-docker-github-background.png)

## Introduction

Praetorian has adapted the original training materials developed by Appsecco
and customized them to the most relevant attacks for the customer. The original
training was 3 days. As the workshop is intended to be 1 day, we will leave
the Docker labs as exercises for the reader and will focus on the existing
classic k8s attacks as well as adding a few custom attacks relevant to the customer.

------------------

The world is changing right in front of our eyes. The way we have been learning is going to be radically transformed by the time we all have eradicated the COVID19 from our lives.

While we figure out what is the best way to transfer our knowledge to you, we realise that by the time world is out of the lockdown, a docker and kubernetes focused pentesting training is likely going to be obsolete in parts.

So as a contribution towards the greater security community, we decided to open source the complete training.

Hope you enjoy this release and come back to us with questions, comments, feedback, new ideas or anything else that you want to let us know! Looking forward to hacking with all of you!

## Description

An organisation using microservices or any other distributed architecture rely heavily on containers and container orchestration engines like Kubernetes and as such its infrastructure security is paramount to its business operations.

This course will set the base for security testers and DevOps teams to test for common security vulnerabilities and configuration weaknesses across containerised environments and distributed systems. It also helps to understand approach and process to audit the Kubernetes environment for security posture.

The courseware is meant to introduce participants to container and cluster management with Kubernetes.

* The focus is on the security aspects of application and the container infrastructure
* The participants will learn the common tools and techniques that are used to attack applications running in containerized environments
* The participants will be introduced to Kubernetes and learn to assess the attack surfaces applicable for a given application on the cluster
* The participants will learn how to audit for security based on best practices using tools and custom scripts

## About this Repo

This repo contains all the material from our 3 day hands on training that we have delivered at security conferences and to our numerous clients.

The training requires following components

1. Lab manual (Documentation)
2. Docker Lab virtual machines
3.  <span style="color:red">Intentionally vulnerable Kubernetes cluster (Google Cloud)</span>

| Content       | Description                                                                 |
| ------------- | --------------------------------------------------------------------------- |
| `mdbook`      | Complete documentation for training                                         |
| `infra-setup` | Scripts for setting up vulnerable Kubernetes infrastructure in Google Cloud |

## Getting Started

1. Clone this repo
2. Start the mdBook server
3. Follow the mdbook

### Starting mdBook Server

* Install `mdbook` with `cargo` using below command. Also binaries and other methods of installation can be found at [mdBook docs](https://github.com/rust-lang/mdBook)

```
cargo install mdbook
```

* Start mdBook to serve locally

```
cd mdbook && mdbook serve
```

* Navigate to `http://localhost:3000`

## License

* Documentation and mdbook are released under [Creative Commons Attribution Share Alike 4.0 International](CC-BY-SA-LICENSE.txt)
* Lab material including any code, script are release under [MIT License](MIT-LICENSE.txt)

## About Appsecco

At Appsecco we provide advice, testing and training around software, infra, web and mobile apps, especially that are cloud hosted. We specialise in auditing Kubernetes clusters as per the CIS Benchmark to create a picture of the current state of security. If you are confident about the security of your cluster get assurance for withstanding real world attackers by getting us to do a black box pentest.

* https://appsecco.com
* https://blog.appsecco.com



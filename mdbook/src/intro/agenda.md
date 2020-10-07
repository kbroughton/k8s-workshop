# Attacking & Auditing Docker Containers & Kubernetes Clusters - Agenda

<span style="color:red">Red</span> - Covered in class. We will replace some based on Phase II attacks.<br>
<span style="color:orange">Orange</span> - Assumed knowledge. May cover a few on request.

* 10:00 am Setup and Overview
* 11:00 am - 11:15 coffee break
* 11:45 am - VM environment: reverse shell
* 12:30 pm - Lunch
* 1:00 pm - GKE cluster: mailbox-service
* 2:00 pm - coffee break
* 2:15 pm - GKE cluster: conn
* 3:15 pm - coffee break
* 3:30 pm - GKE 
* 4:45 pm - End

* Introduction
    * About the trainer
    * Disclaimer
    * Agenda
* <span style="color:red">Environment Setup - PLEASE COMPLETE THE INSTALL THE DAY PRIOR TO CLASS</span>
    * Installing the go, kind, kubectl stack
    * Importing Virtual Machines
    * SSH into machines from your host
    * Common troubleshooting steps
* Docker Quick start
    * docker run
    * Dockerfile
    * docker management
* Docker Advanced Concepts
    * docker-compose wordpress
    * docker volumes and networks
    * docker swarm
    * Portainer
* <span style="color:red">Attacking Insecure Volume Mounts</span>
    * Scenario
    * Solution
* Learning More about
    * Namespaces
    * Capabilities
    * Control Groups
* Attacking docker misconfiguration
    * Scenario
    * Solution
* Auditing Docker containers and images
    * Docker images and containers
    * Scenario
    * Solution
* Auditing Docker networks and volumes
    * Docker volumes and networks
    * Scenario
    * Solution
* <span style="color:red">Docker integrity checks</span>
* amicontained - Introspection tool
* Attacking & Auditing Docker Runtime & Registries
    * Docker runtime endpoints
    * Docker registries
* <span style="color:red">Attacking container capabilities</span>
    * Scenario
    * Solution
* Linux Security Module - Apparmor nginx profile
* Attacking swarm cluster secrets
    * Scenario
    * Solution
* <span style="color:red">Attacking private registry images (Customize)</span>
    * Scenario
    * Solution
* Docker bench security audit
* Container Security Monitoring
    * Docker logging
    * Docker Events
    * Sysdig Faclo
* <span style="color:red">Kubernetes Environment Setup</span>
    * Import VM
    * Internet Check
    * Configure kubectl
* <span style="color:orange">Kubernetes 101</span>
    * Getting Started with Kubernetes
    * Introduction to Kubernetes
    * Kubernetes Overview
    * The Illustrated Children's Guide to Kubernetes
    * Understanding Kubernetes specific technical terms
    * kubectl usage for pentesters
* <span style="color:red">Deploying simple application in Kubernetes Cluster</span>
    * Using yaml manifest
    * Using helm chart
* <span style="color:red">Scenario-1 - Exploiting Private Registry via Misconfiguration (Customize)</span>
    * Scenario
    * Solution
    * Discussion
* Scenario-2 - Attacking Kubernetes Cluster Metadata using SSRF vulnerability
    * Scenario
    * Solution
    * Discussion
* <span style="color:red">Scenario-3 - Testing for the sensitive configurations and secrets in Kubernetes cluster</span>
    * Scenario
    * Solution
    * Discussion
* <span style="color:red">Scenario-4 - Docker escape using Pod Volume Mounts to access the nodes and host systems</span>
    * Scenario
    * Solution
    * Discussion
* <span style="color:red">Scenario-5 - Attacking applications in different namespaces in Kubernetes cluster</span>
    * Scenario
    * Solution
    * Discussion
* Scenario-6 - Attacking Helm tiller without RBAC setup
    * Scenario
    * Solution
    * Discussion
* <span style="color:red">Scenario-7 - RCE on Envoy via CVE-2019-18801 (Proposed)
    * [Scenario](https://blog.envoyproxy.io/exploiting-an-envoy-heap-vulnerability-96173d41792)
    * Solution
    * Discussion
* <span style="color:red">Scenario-8 - Istio/Envoy Path Traversal - CVE-2019-9901 (Proposed)
    * Scenario
    * Solution
    * Discussion


* Auditing Kubernetes Clusters with CIS Benchmarks using kube-bench
* Kubernetes resources security scoring using kubesec.io
* Kube-hunter to do analysis of the cluster for security concerns
* Kubeaudit to audit the cluster with detailed results
* Logging and Monitoring for security events
* Security checks for events using Sysdig Falco - Automated Defense (DEMO Only)
* Advanced Scenario - Exploiting Kubernetes API Server Vulnerability CVE-2018-1002105 (DEMO Only)
* Fun Learning About Kubernetes
    * Contained.af
    * Play with Docker
    * Katacoda Docker Security
    * Play with Kubernetes
* Popular Attacks
    * Dockerhub 190k accounts
    * Cryptojacking using public docker containers
    * Dockerhub known vulnerable images
    * BSidesSF CTF cluster pwn
    * Shopify metadata to cluster pwn
* References & Resources
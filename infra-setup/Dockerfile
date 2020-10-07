FROM google/cloud-sdk:slim

RUN git config --system credential.'https://source.developers.google.com'.helper gcloud.sh

ENV HELM_VERSION=v2.16.12

RUN  apt-get update \
    && apt-get install -y wget curl
    #&& rm -rf /var/lib/apt/lists/*

RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz 
        

RUN  tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm2 \
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl


CMD ["/bin/bash", "-l", "-c", "tail", "-f", "/dev/null"]

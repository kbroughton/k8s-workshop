FROM ubuntu

ENV HELM_VERSION=v2.16.12
#https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz

RUN  apt-get update \
    && apt-get install -y wget curl
    #&& rm -rf /var/lib/apt/lists/*

RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz 
        

RUN  tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm2 \
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/bin/ping","-c","3"]
CMD ["/bin/bash", "-l", "-c", "tail", "-f", "/dev/null"]

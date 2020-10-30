ARG DEBIAN_VERSION=10-slim
FROM debian:${DEBIAN_VERSION}

RUN apt-get update && \
    apt-get install -y \
                    bash bash-completion ca-certificates lsb-release gnupg\
                    wget curl apt-transport-https git \
                    unzip rsync vim tmux less jq gettext xclip xsel

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts && \
    git clone https://github.com/tinslice/dotfiles.git ~/.dotfiles && \
    rm -rf ~/.bashrc ~/.profile && cd ~/.dotfiles && ./install && \
    echo "source <(kubectl completion bash)" > ~/.bashrc_local_after

ARG TERRAFORM_VERSION=0.12.25
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./

ADD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip ./

ARG HELM_VERSION=3.2.1

RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip awscli-exe-linux-x86_64.zip -d /bin && \
    rm -f awscli-exe-linux-x86_64.zip && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz && \
    tar xzvf helm.tar.gz && cd linux-amd64 && \
    chmod +x ./* && \
    mv ./helm /usr/local/bin/helm

WORKDIR /workspace
FROM ubuntu:18.04

ENV TERRAFORM_VERSION=0.12.29

RUN apt-get update && apt-get install wget zip -y && \
    wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip -o ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin/ && \
    rm ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get --no-install-recommends install -y \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-setuptools \
    python3-pip  && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install "ansible[azure]" "pywinrm>=0.4.1" "jmespath>=0.10.0"

#!/bin/bash

# Definir variáveis de ambiente
export KUBECONFIG="/.kube/config"
echo 'export KUBECONFIG="/.kube/config"' >> /home/ec2-user/.bashrc
source /home/ec2-user/.bashrc

sudo yum update -y
sudo yum install -y curl conntrack docker
sudo service docker start
sudo usermod -aG docker ec2-user
su ec2-user
newgrp docker
sudo chown ec2-user /var/run/docker.sock
sudo systemctl restart docker

#######################
# Kubectl Installation
#######################
sudo curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

####################
# Helm Installation
####################
# https://helm.sh/docs/intro/install/

sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh
sudo cp /usr/local/bin/helm /usr/bin/helm
sudo rm -f get_helm.sh
helm version


# Kind Installation
sudo curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
sudo chmod +x ./kind
sudo mv ./kind /usr/local/bin
kind create cluster --name alelok8s --image kindest/node:v1.21.10

sudo chmod 777 -R /.kube
sudo chmod 777 /.kube/config

kubectl cluster-info --context kind-alelok8s
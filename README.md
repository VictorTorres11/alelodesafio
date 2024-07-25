Este repositório contém arquivos de configuração do Terraform para implantar um cluster k3s de nó único na AWS. 
A implantação é automatizada usando GitHub Actions e Após a implantação, um servidor Nginx é configurado para exibir uma página "Hello World".

## Pré-requisitos

- Terraform
- GitHub CLI
- Conta AWS com credenciais configuradas no GitHub Actions
- Par de chaves SSH para acessar a instância EC2

## Estrutura do Repositório


## Configurar Segredos no GitHub
Para que o GitHub Actions possa acessar suas credenciais da AWS e outras informações sensíveis, você precisa configurar os segredos do repositório:

No GitHub, vá para a página do repositório.
Clique em Settings > Secrets and variables > Actions.
Adicione os seguintes segredos:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION (us-east-1)
- TF_API_TOKEN (opcional, para usar com o HashiCorp Terraform Cloud)


## Acessando o Cluster

1. Conectar à instância EC2


ssh -i alelodesafio/my-key ec2-user@<instance_public_ip>

2. Verificar a instalação do MiniKube

sudo kubectl get nodes

## Implantando o Nginx


1. Criar um deployment para o Nginx

sudo kubectl create deployment nginx --image=nginx

2. Expor o deployment do Nginx

sudo kubectl expose deployment nginx --type=LoadBalancer --port=80

3. Criação Cluster IP expose
   
kubectl expose pod nginx-ID-DEPLOYMENT --port=80 --target-port=80 --name=nginx-service --type=ClusterIP

## Efetuando comunicação com o NGINX


1. Iniciar pod para teste com attach

kubectl run -i --tty busybox --image=busybox --restart=Never -- sh

2. Executar comando para comunicação com o NGINX

wget -qO- http://nginx-service:80

## Limpando Deploy Terraform


Para destruir a infraestrutura, execute:

terraform destroy -auto-approve

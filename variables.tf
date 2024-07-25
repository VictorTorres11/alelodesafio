variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "key_name" {
  description = "Nome da chave SSH"
  default     = "my-key"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the Subnet"
  default     = "10.0.1.0/24"
}

variable "kubernetes_version" {
  description = "Kubernetes version of the Minikube cluster. Note, this module has only been tested to work with what is currently the latest version of Kubernetes (i.e. the default value for this variable). Specifying any other version might result in an error or a cluster that is not fully functional."
  default     = "1.30.2"
}
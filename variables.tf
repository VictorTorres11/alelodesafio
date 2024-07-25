variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "key_name" {
  description = "SSH key name"
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
  description = "Kubernetes version of the Minikube cluster."
  default     = "1.30.2"
}
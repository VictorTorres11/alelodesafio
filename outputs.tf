output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.k8s.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.k8s.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.k8s.public_dns
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the Subnet"
  value       = aws_subnet.main.id
}

output "kubeconfig_dns" {
  description = "Path to the the kubeconfig file using DNS address"
  value       = "/home/centos/kubeconfig"
}

output "kubeconfig_ip" {
  description = "Path to the kubeconfig file using IP address"
  value       = "/home/centos/kubeconfig_ip"
}